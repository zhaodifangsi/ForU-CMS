<!doctype html>
<html>
<head><?php include 'inc/head.php';?></head>
<body class="scroll-assist" data-reveal-selectors="section:not(.masonry):not(:first-of-type):not(.parallax)" data-reveal-timing="1000">
  <a id="top"></a>
  <div class="loader"></div>
  <?php include 'inc/nav.php';?>
  <!--end of modal-container-->
  <div class="main-container transition--fade">
    <!-- 结果简述 -->
    <section class="height-40" data-overlay="3">
      <div class="container pos-vertical-center">
        <div class="row">
          <div class="col-sm-12 text-center">
            <h3>关键词:
              <span>&ldquo;<?php echo $keyword;?>&rdquo;</span>
            </h3>
            <span>
              <?php
              if (!empty($_GET['tag'])) 
                $res_count = $db->getOne("SELECT COUNT(*) FROM cms_detail WHERE d_tag LIKE '%$keyword%'");
              else
                $res_count = $db->getOne("SELECT COUNT(*) FROM cms_detail WHERE d_name LIKE '%$keyword%'");
              echo '<em>检索得到 '.$res_count.' 个结果</em>';
              ?>
            </span>
          </div>
        </div>
      </div>
    </section>
    <!-- 结果列表 -->
    <section class="bg--secondary">
      <div class="container">
        <div class="row">
          <div class="masonry">
            <div class="masonry__container">
              <?php
              if (!empty($_GET['tag'])) 
                $res = $db->getAll("SELECT * FROM cms_detail WHERE d_tag LIKE '%$keyword%' ORDER BY d_order ASC,id DESC LIMIT 0,50");
              else
                $res = $db->getAll("SELECT * FROM cms_detail WHERE d_name LIKE '%$keyword%' ORDER BY d_order ASC,id DESC LIMIT 0,50");
              foreach($res as $val){
                echo '<div class="col-md-4 col-sm-6 masonry__item" data-masonry-filter="'.get_channel($val['d_parent'],'c_name').'"><a href="'.d_url($val['id'],$val['d_link']).'"><div class="boxed bg--white box-shadow"><span>'.get_channel($val['d_parent'],'c_name').'</span><h5>'.$val['d_name'].'</h5><hr><p>'.str_cut(str_text($val['d_content']),50).'</p></div></a></div>'; }
              ?>
            </div>
            <!--end of masonry container-->
          </div>
        </div>
        <!--end of row-->
      </div>
      <!--end of container-->
    </section>
    <!-- 重新检索 -->
    <section class="space--even bg--white">
      <div class="container">
        <div class="row">
          <div class="col-sm-12 text-center">
            <h4>没有找到您想要找的东西吗?</h4>
            <a class="btn btn--primary modal-trigger" href="#" data-modal-id="search-form">
              <span class="btn__text">重新检索</span>
            </a>
          </div>
        </div>
        <!--end of row-->
      </div>
      <!--end of container-->
    </section>
    <?php include 'inc/footer.php';?>
  </div>
  <?php include 'inc/js.php';?>
</body>
</html>