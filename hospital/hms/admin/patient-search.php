<?php
session_start();
error_reporting(0);
include('include/config.php');
if(strlen($_SESSION['id']==0)) {
    header('location:logout.php');
} else {
    // Fetch all patients from the database and convert them to JSON
    $sql = mysqli_query($con, "SELECT * FROM tblpatient");
    $patients = [];
    while ($row = mysqli_fetch_assoc($sql)) {
        $patients[] = $row;
    }
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Admin | View Patients</title>
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
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
		<link href="https://cdn.jsdelivr.net/npm/themify-icons@0.1.2/css/themify-icons.css" rel="stylesheet">

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
                                    <h1 class="mainTitle">Admin | View Patients</h1>
                                </div>
                                <ol class="breadcrumb">
                                    <li><span>Admin</span></li>
                                    <li class="active"><span>View Patients</span></li>
                                </ol>
                            </div>
                        </section>
                        <div class="container-fluid container-fullw bg-white">
                            <div class="row">
                                <div class="col-md-12">
                                    <h4 class="text-center">Search Patients</h4>
                                    <input type="text" id="searchInput" class="form-control" placeholder="Search by Name or Mobile Number">
                                    <table class="table table-hover" id="sample-table-1">
                                        <thead>
                                            <tr>
                                                <th class="center">#</th>
                                                <th>Patient Name</th>
                                                <th>Contact Number</th>
                                                <th>Gender</th>
                                                <th>Email</th>
                                                <th>Age</th>
                                                <th>Address</th>
                                                <th>Creation Date</th>
                                                <th>Updation Date</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody id="resultsTableBody">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <?php include('include/footer.php'); ?>
        
        <!-- Pass PHP array to JavaScript -->
        <script>
            const patients = <?php echo json_encode($patients); ?>; 

            document.addEventListener("DOMContentLoaded", () => {
                const searchInput = document.getElementById("searchInput");
                const resultsTableBody = document.getElementById("resultsTableBody");

                // Linear search function (applied here)
                function searchPatients(ptnt) {
                    ptnt = ptnt.toLowerCase(); // Case-insensitive search
                    resultsTableBody.innerHTML = ""; 

                    let found = false; // Track if we find a match
                    patients.forEach((patient, index) => {
                        if (
                            patient.PatientName.toLowerCase().includes(ptnt) || 
                            patient.PatientContno.includes(ptnt)
                        ) {
                            found = true;
                            // Add matching patient to the table
                            resultsTableBody.innerHTML += `
                                <tr>
                                    <td class="center">${index + 1}</td>
                                    <td>${patient.PatientName}</td>
                                    <td>${patient.PatientContno}</td>
                                    <td>${patient.PatientGender}</td>
                                    <td>${patient.PatientEmail}</td>
                                    <td>${patient.PatientAge}</td>
                                    <td>${patient.PatientAdd}</td>
                                    <td>${patient.CreationDate}</td>
                                    <td>${patient.UpdationDate}</td>
                                    <td>
                                        <a href="view-patient.php?viewid=${patient.ID}" class="btn btn-primary btn-xs" target="_blank">View</a>
                                    </td>
                                </tr>
                            `;
                        }
                    });

                    // If no results found
                    if (!found) {
                        resultsTableBody.innerHTML = `
                            <tr>
                                <td colspan="10" class="text-center">No record found for the search.</td>
                            </tr>
                        `;
                    }
                }

                // Listen for input in the search box
                searchInput.addEventListener("input", (e) => {
                    const ptnt = e.target.value;
                    searchPatients(ptnt); // Trigger search
                });
            });
        </script>
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
		<script src="vendor/select2/select2.min.js"></script>
		<script src="vendor/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
		<script src="vendor/bootstrap-timepicker/bootstrap-timepicker.min.js"></script>
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
