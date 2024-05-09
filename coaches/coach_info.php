<?php
// Database Connection
$servername = "localhost";
$username = "root";
$database = "sam_cricket";
$password = "";

// Create connection
$conn = new mysqli($servername, $username, $password, $database);
if ($conn->connect_error) {
    die('Connection Failed : '.$conn->connect_error);
}

// Get the search term from the request
$coachName = $_GET["coachName"];

// SQL to fetch coach details
$sql = "SELECT Name, Age, Gender, Grade, DateOfBirth, Email, Phone FROM coaches WHERE Name LIKE '%$coachName%'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Output coach details
    while ($row = $result->fetch_assoc()) {
        // Get coach details
        $coachName = $row["Name"];
        $age = $row["Age"];
        $gender = $row["Gender"];
        $grade = $row["Grade"];
        $dob = $row["DateOfBirth"];
        $email = $row["Email"];
        $phone = $row["Phone"]; // Assuming the phone number is stored as a string

        // Output coach details as JSON
        $coachDetails = array(
            "Name" => $coachName,
            "Age" => $age,
            "Gender" => $gender,
            "Grade" => $grade,
            "DateOfBirth" => $dob,
            "Email" => $email,
            "Phone" => $phone
        );
        echo json_encode($coachDetails);
    }
} else {
    echo json_encode(array("error" => "No coach found"));
}

// Close connection
$conn->close();
?>
