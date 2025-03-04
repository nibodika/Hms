<?php
session_start();
include("include/config.php");
error_reporting(0);

if (isset($_POST['submit'])) {
    $uname = $_POST['username'];
    $dpassword = md5($_POST['password']);
    $ret = mysqli_query($con, "SELECT * FROM doctors WHERE docEmail='$uname' and password='$dpassword'");
    $num = mysqli_fetch_array($ret);
    if ($num > 0) {
        $_SESSION['dlogin'] = $_POST['username'];
        $_SESSION['id'] = $num['id'];
        $uid = $num['id'];
        $uip = $_SERVER['REMOTE_ADDR'];
        $status = 1;
        $log = mysqli_query($con, "insert into doctorslog(uid,username,userip,status) values('$uid','$uname','$uip','$status')");

        header("location:dashboard.php");
    } else {
        $uip = $_SERVER['REMOTE_ADDR'];
        $status = 0;
        mysqli_query($con, "insert into doctorslog(username,userip,status) values('$uname','$uip','$status')");
        echo "<script>alert('Invalid username or password');</script>";
        echo "<script>window.location.href='index.php'</script>";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Doctor Login</title>
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="vendor/themify-icons/themify-icons.min.css">
    <link href="vendor/animate.css/animate.min.css" rel="stylesheet" media="screen">
    <link href="vendor/perfect-scrollbar/perfect-scrollbar.min.css" rel="stylesheet" media="screen">
    <link href="vendor/switchery/switchery.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/plugins.css">
    <link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            min-height: 100vh;
            align-items: center;
            justify-content: center;
            background-color: skyblue;
        }

        .container {
            display: flex;
            max-width: 850px;
            width: 100%;
            background: #fff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        .side-image {
            width: 50%;
            background-image: url('assets/images/patientregister.jpg'); 
            background-size: cover;
            background-position: center;
        }

        .login-form {
            width: 50%;
            padding: 30px;
        }

        .form-login {
            width: 100%;
        }

        .form-login h2 {
            margin-bottom: 20px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-actions {
            margin-top: 20px;
        }

        .form-actions .btn {
            width: 100%;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body class="login">
    <div class="container">
        <div class="side-image"></div>
        <div class="login-form">
            <div class="logo margin-top-30">
                <a href="../../index.php">
                    <h2 class="text-center">HMS | Doctor Login</h2>
                </a>
            </div>
            <div class="box-login">
                <form class="form-login" method="post">
                    <fieldset>
                        <legend>Sign in to your account</legend>
                        <p>
                            Please enter your name and password to log in.<br />
                            <span style="color:red;"><?php echo $_SESSION['errmsg']; ?><?php echo $_SESSION['errmsg'] = ""; ?></span>
                        </p>
                        <div class="form-group">
                            <span class="input-icon">
                                <input type="text" class="form-control" name="username" placeholder="Email" required>
                                <i class="fa fa-user"></i>
                            </span>
                        </div>
                        <div class="form-group form-actions">
                            <span class="input-icon">
                                <input type="password" class="form-control password" name="password" placeholder="Password" required>
                                <i class="fa fa-lock"></i>
                            </span>
                            <a href="forgot-password.php">Forgot Password ?</a>
                        </div>
                        <div class="form-actions">
                            <button type="submit" class="btn btn-primary pull-right" name="submit">
                                Login <i class="fa fa-arrow-circle-right"></i>
                            </button>
                        </div>
                    </fieldset>
                </form>
                <div class="copyright text-center">
						&copy; <span class="text-bold text-uppercase">  Hospital Management System</span>
				</div>
            </div>
        </div>
    </div>
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/modernizr/modernizr.js"></script>
    <script src="vendor/jquery-cookie/jquery.cookie.js"></script>
    <script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="vendor/switchery/switchery.min.js"></script>
    <script src="vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="assets/js/main.js"></script>
    <script src="assets/js/login.js"></script>
    <script>
        jQuery(document).ready(function() {
            Main.init();
            Login.init();
        });
    </script>
</body>
</html>
