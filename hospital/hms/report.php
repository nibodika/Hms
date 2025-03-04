<?php
session_start();
include('include/config.php');
include('include/checklogin.php');
check_login();
$userId = $_SESSION['id']; 
$query = "SELECT PatientName FROM tblpatient WHERE ID = '$userId'";
$result = mysqli_query($con, $query);

if ($result && mysqli_num_rows($result) > 0) {
    $row = mysqli_fetch_assoc($result);
    $_SESSION['username'] = $row['PatientName'];
} else {
    $_SESSION['username'] = "Unknown User"; // Fallback in case the name isn't found
}
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>User | Title</title>
		<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="vendor/themify-icons/themify-icons.min.css">
		<link href="vendor/animate.css/animate.min.css" rel="stylesheet" media="screen">
		<link href="vendor/perfect-scrollbar/perfect-scrollbar.min.css" rel="stylesheet" media="screen">
		<link href="vendor/switchery/switchery.min.css" rel="stylesheet" media="screen">
		<link href="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css" rel="stylesheet" media="screen">
		<link href="vendor/select2/select2.min.css" rel="stylesheet" media="screen">
		<link href="vendor/bootstrap-datepicker/bootstrap-datepicker3.standalone.min.css" rel="stylesheet" media="screen">
		<link href="vendor/bootstrap-timepicker/bootstrap-timepicker.min.css" rel="stylesheet" media="screen">
		<link rel="stylesheet" href="assets/css/styles.css">
		<link rel="stylesheet" href="assets/css/plugins.css">
		<link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />
	</head>
	<body>
		<div id="app">
<?php include('include/sidebar.php');?>
			<div class="app-content">
<?php include('include/header.php');?>
				<div class="main-content">
					<div class="wrap-content container" id="container">
						<section id="page-title">
							<div class="row">
								<div class="col-sm-8">
									<h1 class="mainTitle">Medical Report</h1>
								</div>
								<ol class="breadcrumb">
									<li><span>User</span></li>
									<li class="active"><span>Report</span></li>
								</ol>
							</div>
						</section>
						<section id="user-report">
							<div class="row">
								<div class="col-lg-12">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h2 class="panel-title text-bold">User Medical Report</h2>
										</div>
										<div class="panel-body" style="border: 1px solid black; border-radius: 15px; margin-left: 50px; margin-top: 20px; background-color: white; font-size: 17px; padding: 10px; width: 500px; color: black;">
<?php
$query = "SELECT mh.Weight, mh.Temperature, mh.BloodPressure, mh.BloodSugar, 
                 p.PatientMedhis, p.Prescription 
          FROM tblmedicalhistory mh 
          JOIN tblpatient p ON mh.PatientID = p.ID 
          WHERE mh.PatientID = '$userId'";
$result = mysqli_query($con, $query);
if ($result && mysqli_num_rows($result) > 0) {
    $row = mysqli_fetch_assoc($result);
?>
											<p><strong>Name:</strong> <?php echo $_SESSION['username']; ?></p>
											<p><strong>Date:</strong> <?php echo date("Y-m-d"); ?></p>
											<hr>
											<p><strong>Weight:</strong> <?php echo $row['Weight']; ?> kg</p>
											<p><strong>Temperature:</strong> <?php echo $row['Temperature']; ?> °C</p>
											<p><strong>Blood Pressure:</strong> <?php echo $row['BloodPressure']; ?></p>
											<p><strong>Blood Sugar:</strong> <?php echo $row['BloodSugar']; ?> mg/dL</p>
											<p><strong>Problem Described by Patient:</strong> <?php echo $row['PatientMedhis']; ?></p>
											<p><strong>Prescription:</strong> <?php echo $row['Prescription']; ?></p>
<?php
} else {
    echo "<p>No medical history found for the user.</p>";
}
?>
										</div>
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>
			</div>
<?php include('include/footer.php');?>
<?php include('include/setting.php');?>
		</div>
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
		<script src="vendor/modernizr/modernizr.js"></script>
		<script src="vendor/jquery-cookie/jquery.cookie.js"></script>
		<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
		<script src="vendor/switchery/switchery.min.js"></script>
		<script src="assets/js/main.js"></script>
		<script src="assets/js/form-elements.js"></script>
		<script>
			jQuery(document).ready(function() {
				Main.init();
				FormElements.init();
			});
		</script>
	</body>
</html>
