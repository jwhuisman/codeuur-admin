<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?=APP_NAME?></title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="/dist/css/custom.css">
    <link rel="stylesheet" href="/dist/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="/plugins/iCheck/flat/blue.css">
    <link rel="stylesheet" href="/plugins/morris/morris.css">
    <link rel="stylesheet" href="/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet" href="/plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="/plugins/daterangepicker/daterangepicker-bs3.css">
    <link rel="stylesheet" href="/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="/plugins/daterangepicker/daterangepicker-bs3.css">
    <link rel="stylesheet" href="/plugins/iCheck/all.css">
    <link rel="stylesheet" href="/dist/css/easy-autocomplete.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <!--[if lt IE 9]>
        <script src="//oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body class="hold-transition skin-blue-light sidebar-mini <?php if($this->session->userdata('menu_state')) { ?> sidebar-collapse <?php } ?>">
    <div class="wrapper">

      <header class="main-header">
        <a href="/" class="logo">
          <span class="logo-mini"><b><?=APP_SHORT?></b></span>
          <span class="logo-lg"><b><?=APP_NAME?></b></span>
        </a>
        <nav class="navbar navbar-static-top" role="navigation">
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Slide navigatie</span>
          </a>
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              

           
                <li class="dropdown notifications-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-bell-o"></i>
                  <span class="label label-warning"></span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">U heeft 0 notificaties</li>
                </ul>
              </li>
     
               

              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <img src="<?=$this->session->userdata('profile_image');?>" class="user-image" alt="User Image">
                  <span class="hidden-xs"><?=$this->session->userdata('name');?></span>
                </a>
                <ul class="dropdown-menu">
  
                  <li class="user-header">
                    <img src="<?=$this->session->userdata('profile_image');?>" class="img-circle" alt="User Image">
                    <p>
                     <?=$this->session->userdata('name');?>
                      <small>&nbsp;</small>
                    </p>
                  </li>              
                  <li class="user-footer">
                    <div class="pull-left">
                      <a href="#" class="btn btn-default btn-flat">Profiel</a>
                    </div>
                    <div class="pull-right">
                      <a href="/login/logout" class="btn btn-default btn-flat">Afmelden</a>
                    </div>
                  </li>
                </ul>
              </li>
            
            </ul>
          </div>
        </nav>
      </header>