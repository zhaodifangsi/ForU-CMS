<?php
class Smtp {
    /* Public Variables */ 
    var $smtp_port; 
    var $time_out; 
    var $host_name; 
    var $log_file; 
    var $relay_host; 
    var $debug; 
    var $auth; 
    var $user; 
    var $pass; 

    /* Private Variables */  
    var $sock; 

    /* Constractor */ 
    function __construct($relay_host = "", $smtp_port = 25, $user, $pass, $auth=true) {
        $this->debug = FALSE; 
        $this->smtp_port = $smtp_port; 
        $this->relay_host = $relay_host; 
        $this->time_out = 30; //is used in fsockopen()  
        $this->auth = $auth;//auth
        $this->user = $user; 
        $this->pass = $pass; 
        $this->host_name = "localhost"; //is used in HELO command  
        $this->log_file = ""; 
        $this->sock = FALSE; 
    } 

    /* Main Function */
    //$mailtype 邮件格式（HTML/TXT）,TXT为文本邮件
    function sendMail($to, $from, $subject = "", $body = "", $mailtype = "HTML", $cc = "", $bcc = "", $additional_headers = "") {
        $mail_from = $this->smtpGetAddress($this->smtpStripComment($from)); 
        $body = preg_replace("/(^|(\r\n))(\.)/", "\1.\3", $body); 
        $header = "MIME-Version:1.0\r\n"; 
        if($mailtype=="HTML") {
            $header .= "Content-Type:text/html\r\n"; 
        } 
        $header .= "To: ".$to."\r\n"; 
        if ($cc != "") {
            $header .= "Cc: ".$cc."\r\n"; 
        } 
        $header .= "From: $from<".$from.">\r\n"; 
        $header .= "Subject: ".$subject."\r\n"; 
        $header .= $additional_headers; 
        $header .= "Date: ".date("r")."\r\n"; 
        $header .= "X-Mailer:By Redhat (PHP/".phpversion().")\r\n"; 
        list($msec, $sec) = explode(" ", microtime()); 
        $header .= "Message-ID: <".date("YmdHis", $sec).".".($msec*1000000).".".$mail_from.">\r\n"; 
        $TO = explode(",", $this->smtpStripComment($to)); 

        if ($cc != "") {
            $TO = array_merge($TO, explode(",", $this->smtpStripComment($cc))); 
            } 
        if ($bcc != "") {
            $TO = array_merge($TO, explode(",", $this->smtpStripComment($bcc))); 
        } 
        $sent = TRUE; 
        foreach ($TO as $rcpt_to) {
            $rcpt_to = $this->smtpGetAddress($rcpt_to); 
            if (!$this->smtpSockOpen($rcpt_to)) {
                $this->smtpLogWrite("Error: Cannot send email to ".$rcpt_to."\n"); 
                $sent = FALSE; 
                continue; 
            } 
            if ($this->smtpSend($this->host_name, $mail_from, $rcpt_to, $header, $body)) {
                $this->smtpLogWrite("E-mail has been sent to <".$rcpt_to.">\n"); 
            } else {
                $this->smtpLogWrite("Error: Cannot send email to <".$rcpt_to.">\n"); 
                $sent = FALSE; 
            } 
            fclose($this->sock); 
            $this->smtpLogWrite("Disconnected from remote host\n"); 
        } 
        return $sent; 
    } 

    /* Private Functions */ 
    function smtpSend($helo, $from, $to, $header, $body = "") {
        if (!$this->smtpPutCmd("HELO", $helo)) {
            return $this->smtpError("sending HELO command"); 
        } 

        #auth 
        if($this->auth) {
            if (!$this->smtpPutCmd("AUTH LOGIN", base64_encode($this->user))) {
                return $this->smtpError("sending HELO command"); 
            } 
            if (!$this->smtpPutCmd("", base64_encode($this->pass))) {
                return $this->smtpError("sending HELO command"); 
            } 
        } 
        if (!$this->smtpPutCmd("MAIL", "FROM:<".$from.">")) {
            return $this->smtpError("sending MAIL FROM command"); 
        } 
        if (!$this->smtpPutCmd("RCPT", "TO:<".$to.">")) {
            return $this->smtpError("sending RCPT TO command"); 
        } 
        if (!$this->smtpPutCmd("DATA")) {
            return $this->smtpError("sending DATA command"); 
        } 
        if (!$this->smtpMessage($header, $body)) {
            return $this->smtpError("sending message"); 
        } 
        if (!$this->smtpEom()) {
            return $this->smtpError("sending <CR><LF>.<CR><LF> [EOM]"); 
        } 
        if (!$this->smtpPutCmd("QUIT")) {
            return $this->smtpError("sending QUIT command"); 
        } 
        return TRUE; 
    } 

    function smtpSockOpen($address) {
        if ($this->relay_host == "") {
            return $this->smtpSockOpenMx($address); 
        } else {
            return $this->smtpSockOpenReplay(); 
        } 
    } 

    function smtpSockOpenReplay() {
        $this->smtpLogWrite("Trying to ".$this->relay_host.":".$this->smtp_port."\n"); 
        $this->sock = @fsockopen($this->relay_host, $this->smtp_port, $errno, $errstr, $this->time_out); 
        if (!($this->sock && $this->smtpOk())) {
            $this->smtpLogWrite("Error: Cannot connenct to relay host ".$this->relay_host."\n"); 
            $this->smtpLogWrite("Error: ".$errstr." (".$errno.")\n"); 
            return FALSE; 
        } 
        $this->smtpLogWrite("Connected to relay host ".$this->relay_host."\n"); 
        return TRUE;; 
    } 

    function smtpSockOpenMx($address) {
        $domain = preg_replace("/^.+@([^@]+)$/", "\1", $address); 
        if (!@getmxrr($domain, $MXHOSTS)) {
            $this->smtpLogWrite("Error: Cannot resolve MX \"".$domain."\"\n"); 
            return FALSE; 
        } 
        foreach ($MXHOSTS as $host) {
            $this->smtpLogWrite("Trying to ".$host.":".$this->smtp_port."\n"); 
            $this->sock = @fsockopen($host, $this->smtp_port, $errno, $errstr, $this->time_out); 
            if (!($this->sock && $this->smtpOk())) {
                $this->smtpLogWrite("Warning: Cannot connect to mx host ".$host."\n"); 
                $this->smtpLogWrite("Error: ".$errstr." (".$errno.")\n"); 
                continue; 
            } 
            $this->smtpLogWrite("Connected to mx host ".$host."\n"); 
            return TRUE; 
        } 
        $this->smtpLogWrite("Error: Cannot connect to any mx hosts (".implode(", ", $MXHOSTS).")\n"); 
        return FALSE; 
    } 

    function smtpMessage($header, $body) {
        fputs($this->sock, $header."\r\n".$body); 
        $this->smtpDebug("> ".str_replace("\r\n", "\n"."> ", $header."\n> ".$body."\n> ")); 
        return TRUE; 
    } 

    function smtpEom() {
        fputs($this->sock, "\r\n.\r\n"); 
        $this->smtpDebug(". [EOM]\n"); 
        return $this->smtpOk(); 
    } 

    function smtpOk() {
        $response = str_replace("\r\n", "", fgets($this->sock, 512)); 
        $this->smtpDebug($response."\n"); 
        if (!preg_match("/^[23]/", $response)) {
            fputs($this->sock, "QUIT\r\n"); 
            fgets($this->sock, 512); 
            $this->smtpLogWrite("Error: Remote host returned \"".$response."\"\n"); 
            return FALSE; 
        } 
        return TRUE; 
    } 

    function smtpPutCmd($cmd, $arg = "") {
        if ($arg != "") {
            if($cmd=="") {
                $cmd = $arg; 
            } 
            else 
            { 
                $cmd = $cmd." ".$arg; 
            } 
        } 
        fputs($this->sock, $cmd."\r\n"); 
        $this->smtpDebug("> ".$cmd."\n"); 
        return $this->smtpOk(); 
    } 

    function smtpError($string) {
        $this->smtpLogWrite("Error: Error occurred while ".$string.".\n"); 
        return FALSE; 
    } 

    function smtpLogWrite($message) {
        $this->smtpDebug($message); 
        if ($this->log_file == "") {
            return TRUE; 
        } 
        $message = date("M d H:i:s ").get_current_user()."[".getmypid()."]: ".$message; 
        if (!@file_exists($this->log_file) || !($fp = @fopen($this->log_file, "a"))) {
            $this->smtpDebug("Warning: Cannot open log file \"".$this->log_file."\"\n"); 
            return FALSE;; 
        } 
        flock($fp, LOCK_EX); 
        fputs($fp, $message); 
        fclose($fp); 
        return TRUE; 
    } 

    function smtpStripComment($address) {
        $comment = "/\([^()]*\)/"; 
        while (preg_match($comment, $address)) {
            $address = preg_replace($comment, "", $address); 
        } 
        return $address; 
    } 

    function smtpGetAddress($address) {
        $address = preg_replace("/([ \t\r\n])+/", "", $address); 
        $address = preg_replace("/^.*<(.+)>.*$/", "\1", $address); 
        return $address; 
    } 

    function smtpDebug($message) {
        if ($this->debug) {
            echo $message; 
        } 
    } 
} 
?>