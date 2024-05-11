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
$playerName = $_GET["playerName"];

// SQL to fetch player details
$sql = "SELECT Name, Age, Gender, Father, Mother, Role, Batting, Bowling, Grade, DateOfBirth, Email, Phone FROM players WHERE Name LIKE '%$playerName%'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Output player details
    while ($row = $result->fetch_assoc()) {
        $playerName = $row["Name"];
        $age = $row["Age"];
        $gender = $row["Gender"];
        $father = $row["Father"];
        $mother = $row["Mother"];
        $role = $row["Role"];
        $BatH = $row["Batting"];
        $BowlH = $row["Bowling"];
        $grade = $row["Grade"];
        $dob = $row["DateOfBirth"];
        $email = $row["Email"];
        $phone = $row["Phone"]; // Assuming the phone number is stored as a string

        // Output player details as JSON
        $playerDetails = array(
            "Name" => $playerName,
            "Age" => $age,
            "Gender" => $gender,
            "Father" => $father,
            "Mother" => $mother,
            "Role" => $role,
            "BatH" => $BatH,
            "BowlH" => $BowlH,
            "Grade" => $grade,
            "DateOfBirth" => $dob,
            "Email" => $email,
            "Phone" => $phone
        );
        echo json_encode($playerDetails);
    }
} else {
    echo json_encode(array("error" => "No player found"));
}

// Close connection
$conn->close();
?>
