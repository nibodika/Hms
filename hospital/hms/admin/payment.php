<?php
session_start();
error_reporting(0);
include('include/config.php');
if(strlen($_SESSION['id']) == 0) {
    header('location:logout.php');
} else {
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Payment</title>
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
                    <!-- Begin Main Content -->
                    <section id="page-title">
                        <div class="row">
                            <div class="col-sm-8">
                                <h1 class="mainTitle">Payment</h1>
                            </div>
                            <ol class="breadcrumb">
                                <li><span>Doctors</span></li>
                                <li class="active"><span>Payment</span></li>
                            </ol>
                        </div>
                    </section>
                    <h4 class="text-center">Doctors Report</h4>


                    <div class="container-fluid container-fullw bg-white">
                    <div class="row">
                        <div class="col-md-12">
                            <h5 class="text-center text-bold">Select a Date or Month to View the Payment</h5>
                            <div class="filter-section">
                                <form method="POST" action="">
                                    <div class="form-row align-items-center">
                                        <div class="form-group col-md-4">
                                            <label for="selected_date">Specific Date:</label>
                                            <input type="date" id="selected_date" name="selected_date" class="form-control">
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="selected_month">Select Month:</label>
                                            <select id="selected_month" name="selected_month" class="form-control">
                                                <option value="">Month</option>
                                                <?php
                                                for ($m = 1; $m <= 12; $m++) {
                                                    $month = str_pad($m, 2, '0', STR_PAD_LEFT);
                                                    echo "<option value='$month'>$month</option>";
                                                }
                                                ?>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="selected_year">Select Year:</label>
                                            <select id="selected_year" name="selected_year" class="form-control">
                                                <option value="">Year</option>
                                                <?php
                                                $current_year = date("Y");
                                                for ($y = $current_year; $y >= $current_year - 10; $y--) {
                                                    echo "<option value='$y'>$y</option>";
                                                }
                                                ?>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-2">
                                            <button type="submit" name="filter" class="btn btn-primary btn-block" style="margin-top: 23px;">Filter</button>
                                        </div>
                                    </div>
                                </form>
                            </div>

            <?php
            // Initialize variables
            $filter_mode = ""; 
            $query_condition = ""; 
            $display_filter = "";

            if (isset($_POST['selected_date']) && !empty($_POST['selected_date'])) {
                // Filter by specific date
                $selected_date = $_POST['selected_date'];
                $filter_mode = "date";
                $query_condition = "a.appointmentDate = '$selected_date'";
                $display_filter = "Selected Date: " . htmlentities($selected_date);
            } elseif (isset($_POST['selected_month']) && isset($_POST['selected_year']) && !empty($_POST['selected_month']) && !empty($_POST['selected_year'])) {
                // Filter by month and year
                $selected_month = $_POST['selected_month'];
                $selected_year = $_POST['selected_year'];
                $start_date = "$selected_year-$selected_month-01";
                $end_date = date("Y-m-t", strtotime($start_date));
                $filter_mode = "month";
                $query_condition = "a.appointmentDate BETWEEN '$start_date' AND '$end_date'";
                $display_filter = "Selected Month: " . htmlentities("$selected_month/$selected_year");
            }

            if (!empty($filter_mode)) {
                echo "<h5 class='text-center text-success'>$display_filter</h5>";

                // Query to fetch report based on the selected filter
                $sql = "SELECT 
                            d.id, 
                            d.specilization, 
                            d.doctorName, 
                            d.docFees, 
                            COUNT(a.doctorId) AS patientCount 
                        FROM doctors d
                        LEFT JOIN appointment a 
                        ON d.id = a.doctorId 
                        AND $query_condition
                        GROUP BY d.id, d.specilization, d.doctorName, d.docFees";

                $result = mysqli_query($con, $sql);
                $total_amount = 0; // Initialize total amount to zero
            }
            ?>

            <table class="table table-hover table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Specilization</th>
                        <th>Doctor Name</th>
                        <th>Doctor Fees</th>
                        <th>No. of Patients</th>
                        <th>Amount</th>
                    </tr>
                </thead>
                <tbody>
        <?php
        if (!empty($filter_mode) && $result && mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $amount = $row['docFees'] * $row['patientCount'];
                $total_amount += $amount;

                echo "<tr>";
                echo "<td>" . htmlentities($row['id']) . "</td>";
                echo "<td>" . htmlentities($row['specilization']) . "</td>";
                echo "<td>" . htmlentities($row['doctorName']) . "</td>";
                echo "<td>" . htmlentities($row['docFees']) . "</td>";
                echo "<td>" . htmlentities($row['patientCount']) . "</td>";
                echo "<td>" . htmlentities($amount) . "</td>";
                echo "</tr>";
            }
        } else {
            echo "<tr><td colspan='6' class='text-center'>No data found for the selected filter</td></tr>";
        }
        ?>
    </tbody>
</table>

<?php
if (!empty($filter_mode) && isset($total_amount)) {
    echo "<p class='text-right' style='font-size: 18px;'><strong>Total Amount: </strong>" . htmlentities($total_amount) . "</p>";
}
?>

                </div>
            </div>
        </div>
        <?php include('include/setting.php'); ?>
    </div>
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/modernizr/modernizr.js"></script>
    <script src="vendor/jquery-cookie/jquery.cookie.js"></script>
    <script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="vendor/switchery/switchery.min.js"></script>
    <script src="vendor/maskedinput/jquery.maskedinput.min.js"></script>
    <script src="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
    <script src="vendor/autosize/autosize.min.js"></script>
    <script src="vendor/selectFx/classie.js"></script>
    <script src="vendor/selectFx/selectFx.js"></script>
    <script src="vendor/select2/select2.min.js"></script> <script src="vendor/bootstrap-datepicker/bootstrap-datepicker.min.js"></script> <script src="vendor/bootstrap-timepicker/bootstrap-timepicker.min.js"></script> <script src="assets/js/main.js"></script> <script src="assets/js/form-elements.js"></script> <script> jQuery(document).ready(function() { Main.init(); FormElements.init(); }); </script>
</body> </html> <?php } ?> 
