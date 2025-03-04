<?php
session_start();
error_reporting(0);
include("include/config.php");
if (isset($_POST['submit'])) {
    $uname = $_POST['username'];
    $upassword = $_POST['password'];

    $ret = mysqli_query($con, "SELECT * FROM admin WHERE username='$uname' and password='$upassword'");
    $num = mysqli_fetch_array($ret);
    if ($num > 0) {
        $_SESSION['login'] = $_POST['username'];
        $_SESSION['id'] = $num['id'];
        header("location:dashboard.php");
    } else {
        $_SESSION['errmsg'] = "Invalid username or password";
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Admin-Login</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,600" rel="stylesheet">
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/styles.css">
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
            background-image: url('assets/images/patientregister.jpg'); /* Replace with the actual image path */
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

<body>
    <div class="container">
        <!-- Side Image -->
        <div class="side-image"></div>

        <!-- Login Form -->
        <div class="login-form">
            <h2 class="text-center">Admin Login</h2>
            <form class="form-login" method="post">
                <fieldset>
                    <legend>Sign in to your account</legend>
                    <p>
                        Please enter your username and password to log in.<br />
                        <span style="color:red;"><?php echo htmlentities($_SESSION['errmsg']); ?><?php echo htmlentities($_SESSION['errmsg'] = ""); ?></span>
                    </p>
                    <div class="form-group">
                        <span class="input-icon">
                            <input type="text" class="form-control" name="username" placeholder="Username" required>
                            <i class="fa fa-user"></i>
                        </span>
                    </div>
                    <div class="form-group">
                        <span class="input-icon">
                            <input type="password" class="form-control" name="password" placeholder="Password" required>
                            <i class="fa fa-lock"></i>
                        </span>
                    </div>
                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary" name="submit">
                            Login <i class="fa fa-arrow-circle-right"></i>
                        </button>
                    </div>
                    <a href="../../index.php">Back to Home Page</a>
                </fieldset>
            </form>
			<div class="copyright text-center">
						&copy; <span class="text-bold text-uppercase">  Hospital Management System</span>
			</div>
        </div>
    </div>

    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>
