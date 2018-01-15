<?php
class Mysqi {
  public $queryCount = 0;
  public $queryTime = '';
  private $mysqli;
  private $lastInsID = null;
  private $_user;
  //连接数据库用户名
  private $_pwd;
  //连接密码
  private $_host;
  //数据库地址
  public $_err;
  //返回错误信息
  private $_db;
  //连接的数据库名
  /**
   * 构造方法
   * @return Connect
   */
  public function __construct($host, $user, $pwd, $db = '') {
    $this->Connect($host, $user, $pwd, $db);
  }
  /**
   * 建立数据库连接
   * @param string $host 服务器地址
   * @param string $user 登陆用户名
   * @param string $pwd 登陆密码
   * @param string $db  数据库名称
   */
  public function Connect($host, $user, $pwd, $db = '') {
    $this->mysqli = new mysqli($host, $user, $pwd);
    $this->_host = $host;
    $this->_user = $user;
    $this->_pwd = $pwd;
    if (@$this->mysqli->errno) {
      $this->_err = $this->_conn->error;
      return;
    }
    // $this->mysqli->set_charset("utf8");
    if (!empty($db)) {
      $this->selectDB($db);
    }
  }
  /**
   * 选择数据库
   * @param string $db 数据库名称
   */
  public function selectDB($db) {
    $this->_db = $db;
    if (!empty($this->_db)) {
      @$this->mysqli->select_db($this->_db);
      if ($this->mysqli->errno) {
        $this->_err = $this->mysqli->error;
        return;
      }
    } else {
      $this->_err = 'Please enter a database name';
      return;
    }
  }
  public function query($sql) {
    if (empty($sql) || $sql == NULL) {
      $this->_err = 'Please input SQL statement';
      return false;
    }
    $sql = Sql::parse($sql);
    $query = @$this->mysqli->query($sql);
    $lastInsID = @mysqli_insert_id();
    if (!$query) {
      $this->_err = 'Please verify that the data table is incorrect';
      return;
    }
    if ($this->mysqli->errno) {
      $this->_err = $this->mysqli->error;
      return false;
    }
    return $query;
  }
  public function execute($sql) {
     if (empty($sql) || $sql == NULL) {
      $this->_err = 'Please input SQL statement';
      return false;
    }
    $sql = Sql::parse($sql);
    $query = @$this->mysqli->execute($sql);
    $lastInsID = @mysqli_insert_id();
    if (!$query) {
      $this->_err = 'Please check whether the data table is wrong';
      return;
    }
    if ($this->mysqli->errno) {
      $this->_err = $this->mysqli->error;
      return false;
    }
    return $query;
  }
  /* 仿真 Adodb 函数 */
  public function selectLimit($sql, $num, $start = 0) {
    if ($start == 0) {
      $sql .= ' LIMIT ' . $num;
    } else {
      $sql .= ' LIMIT ' . $start . ', ' . $num;
    }
    return $this->query($sql);
  }
  public function getOne($sql, $limited = false) {
    if ($limited) {
      $sql = trim($sql . ' LIMIT 1');
    }
    $res = $this->query($sql);
    if ($res !== false) {
      $row = !empty($res) ? mysqli_fetch_row($res) : false;
      return $row!==false ? $row[0] : '';
    } else {
      return false;
    }
  }
  public function getAll($sql) {
    $res = $this->query($sql);
    if ($res !== false && $res !== null) {
      $arr = array();
      while ($row = mysqli_fetch_assoc($res)) {
        $arr[] = $row;
      }
      return $arr;
    } else {
      return false;
    }
  }
  public function getRow($sql, $limited = true) {
    if ($limited) {
      $sql = trim($sql . ' LIMIT 1');
    }
    $res = $this->query($sql);
    if ($res !== false) {
      return @mysqli_fetch_assoc($res);
    } else {
      return false;
    }
  }
  public function getCol($sql) {
    $res = $this->query($sql);
    if ($res !== false) {
      $arr = array();
      while (@($row = mysqli_fetch_row($res))) {
        $arr[] = $row[0];
      }
      return $arr;
    } else {
      return false;
    }
  }
  public function autoExecute($table, $field_values, $mode = 'INSERT', $where = '', $querymode = '') {
    $field_names = $this->getCol('DESC ' . DATA_PREFIX . $table);
    $sql = '';
    if ($mode == 'INSERT') {
      $fields = $values = array();
      foreach ($field_names as $value) {
        if (array_key_exists($value, $field_values)) {
          $fields[] = $value;
          $values[] = '\'' . $field_values[$value] . '\'';
        }
      }
      if (!empty($fields)) {
        $sql = 'INSERT INTO ' . $table . ' (' . implode(', ', $fields) . ') VALUES (' . implode(', ', $values) . ')';
      }
    } else {
      $sets = array();
      foreach ($field_names as $value) {
        if (array_key_exists($value, $field_values)) {
          $sets[] = $value . ' = \'' . $field_values[$value] . '\'';
        }
      }
      if (!empty($sets)) {
        $sql = 'UPDATE ' . $table . ' SET ' . implode(', ', $sets) . ' WHERE ' . $where;
      }
    }
    if ($sql) {
      return $this->query($sql, $querymode);
    } else {
      return false;
    }
  }
  // 获取最近插入的ID
  public function getLastID() {
    return $this->lastInsID;
  }
  // 获取最大值
  public function getMaxID($table, $field, $where = '') {
    if ($where != '') {
      $res = $this->getOne("SELECT MAX($field) FROM $table WHERE $where");
    } else {
      $res = $this->getOne("SELECT MAX($field) FROM $table");
    }
    return !empty($res) ? $res : 0;
  }
  public function truncate($table) {
    return $this->query('TRUNCATE TABLE ' . $table);
  }
  public function drop($table) {
    return $this->query('DROP TABLE ' . $table);
  }
  public function dropDB($db) {
    return $this->query('DROP DATABASE ' . $db);
  }
  /**
   * 关闭数据源
   */
  public function close() {
    @$this->mysqli->close();
    unset($this->_host);
    unset($this->_db);
    unset($this->_user);
    unset($this->_pwd);
    unset($this->_err);
  }
  /**
   * 析构函数
   */
  public function __destruct() {
    $this->close();
  }
}
