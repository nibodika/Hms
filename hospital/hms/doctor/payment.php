<?php
session_start();
error_reporting(0);
include('include/config.php');
if(strlen($_SESSION['id']==0)) {
    header('location:logout.php');
} else {
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Doctor | Manage Patients</title>
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
<?php include('include/sidebar.php'); ?>
<div class="app-content">
<?php include('include/header.php'); ?>
<div class="main-content">
<div class="wrap-content container" id="container">
    <section id="page-title">
        <div class="row">
            <div class="col-sm-8">
                <h1 class="mainTitle">Earnings</h1>
            </div>
            <ol class="breadcrumb">
                <li><span>Doctor</span></li>
                <li class="active"><span>Payment</span></li>
            </ol>
        </div>
    </section>
    <section id="manage-patients">
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Patient Name</th>
                                <th>Email</th>
                                <th>Gender</th>
                                <th>Medical History</th>
                                <th>Creation Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            // Get the Docid of the current logged-in doctor
                            $docid = $_SESSION['id'];

                            // SQL query to fetch patient details matching the current doctor's Docid
                            $query = mysqli_query($con, "SELECT PatientName, PatientEmail, PatientGender, PatientMedhis, CreationDate FROM tblpatient WHERE Docid='$docid'");

                            $cnt = 1; // Counter for numbering rows
                            while ($row = mysqli_fetch_array($query)) {
                                echo "<tr>";
                                echo "<td>" . $cnt . "</td>";
                                echo "<td>" . htmlspecialchars($row['PatientName']) . "</td>";
                                echo "<td>" . htmlspecialchars($row['PatientEmail']) . "</td>";
                                echo "<td>" . htmlspecialchars($row['PatientGender']) . "</td>";
                                echo "<td>" . htmlspecialchars($row['PatientMedhis']) . "</td>";
                                echo "<td>" . htmlspecialchars($row['CreationDate']) . "</td>";
                                echo "</tr>";
                                $cnt++;
                            }
                            ?>
                        </tbody>
                    </table>
                        <!---->
                        <div class="total-fee">
    <h4>Total Earnings:</h4>
    <?php
    // Fetch the doctor's consultation fee
    $docFeesQuery = mysqli_query($con, "SELECT docFees FROM doctors WHERE id='$docid'");
    $docFeesRow = mysqli_fetch_array($docFeesQuery);
    $docFees = $docFeesRow['docFees'];

    // Count the number of patients assigned to this doctor
    $patientCountQuery = mysqli_query($con, "SELECT COUNT(*) AS patientCount FROM tblpatient WHERE Docid='$docid'");
    $patientCountRow = mysqli_fetch_array($patientCountQuery);
    $patientCount = $patientCountRow['patientCount'];

    // Calculate total earnings
    $totalEarnings = $docFees * $patientCount;

    // Display total earnings
    echo "<p  style='font-size: 17px; color: black;'>Your total earnings are: <strong>Rs. " . number_format($totalEarnings, 2) . "</strong></p>";
    ?>
</div>
                </div>
            </div>
        </div>
    </div>
</section>
</div>
</div>
</div>
</div>
<?php include('include/footer.php'); ?>
<?php include('include/setting.php'); ?>
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
<?php } ?>
