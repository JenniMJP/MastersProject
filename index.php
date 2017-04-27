<?php
require_once 'database.php';

if ($_POST) {
 // Start the session
 //session_start();
 // Store ID
 $_SESSION['uname'] = $_POST['txt_uname_email'];
}

if($user->is_loggedin()!="")
{
 $user->redirect('home.php');
}

if(isset($_POST['btn-login']))
{
 $uname = $_POST['txt_uname_email'];
 $umail = $_POST['txt_uname_email'];
 $upass = $_POST['txt_password'];

 if($user->login($uname,$umail,$upass))
 {

    $user->redirect('consent_form.php');
 }
 else
 {
  $error = "Wrong Details !";
 } 
}

xxx
?>

<!DOCTYPE html>

<html>
<head>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>The Inner Compass</title>

<link rel="stylesheet" href="css/style.css" type="text/css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
	
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>

<script type="text/javascript" src="js/innercompass.js"></script>
	
</head>
<body>
<header>
<img id="logo"  src="img/Logo-lrg.png" alt="Inner Compass"></a></a>
</header>

<div class="container">
     <div class="form-container">
        <form method="post">
            <h4>Sign in</h4><hr />
            <?php
            if(isset($error))
            {
                  ?>
                  <div class="alert alert-danger">
                      <i class="glyphicon glyphicon-warning-sign"></i> &nbsp; <?php echo $error; ?> !
                  </div>
                  <?php
            }
            ?>
            <div class="form-group">
             <input type="text" class="form-control input-sm" name="txt_uname_email" placeholder=" Username or E mail ID" required />
            </div>
            <div class="form-group">
             <input type="password" class="form-control input-sm" name="txt_password" placeholder="Your Password" required />
            </div>
            <div class="clearfix"></div><hr />
  
            <div class="form-group">
             <button type="submit" name="btn-login" class="btn btn-block btn-success">
                 <i class="glyphicon glyphicon-log-in"></i>&nbsp;SIGN IN
                </button>
            </div>
            <br />
            <label><a href="signup.php">Register</a></label>
        </form>
       </div>
 </div>
</body>
</html>

