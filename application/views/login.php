<!DOCTYPE html>
<html lang="nl">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title><?=APP_NAME?> | Log in</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <link rel="stylesheet" href="/dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="/plugins/iCheck/square/blue.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>


<body class="hold-transition login-page">

  <div class="login-box">
    <div class="login-logo">
      <a href="/"><b><?=APP_NAME?></b><?=APP_SUFFIX?></a>
    </div>
    <div class="login-box-body">
      <p class="login-box-msg">Log hier in om het systeem te kunnen gebruiken</p>

      <?php
        if(count($error) > 0){
          foreach($error as $err){
      ?>
          <p style="color: red;"><?=$err?></p>

      <?php
          }
        }
      ?>

      <form action="/login" method="post">
        <div class="form-group has-feedback">
          <input type="text" class="form-control" name="login_string" id="login_string" autocomplete="off" placeholder="Gebruikersnaam">
          <span class="glyphicon glyphicon-user form-control-feedback"></span>
        </div>
        <div class="form-group has-feedback">
          <input type="password" name="login_pass" id="login_pass"  autocomplete="off"  class="form-control" placeholder="Wachtwoord">
          <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>
        <div class="row">
          <div class="col-xs-7">
            
          </div>

          <div class="col-xs-5">
            <button type="submit" class="btn btn-primary btn-block btn-flat">Aanmelden</button>
          </div>

        </div>
      </form>


    <a href="#">Ik ben mijn wachtwoord vergeten</a><br>

  </div>

</div>



<script src="/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
