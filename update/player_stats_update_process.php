<?php

// Database connection parameters
$servername = "localhost";
$username = "root";
$password = ""; // Assuming no password is set for the root user
$dbname = "sam_cricket";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch values from the form
$Format = $_POST['Format'];
$PlayerID = $_POST['PlayerID'];
$Name = $_POST['Name'];
$MatchNo = $_POST['MatchNo'];
$MatchDate = $_POST['MatchDate'];
$Performance = $_POST['Performance'];

// Determine the table name based on format
$tableName = "player_" . $PlayerID . "_" . $Format;

// Initialize variables for batting and bowling fields
$innings = $runs = $balls = $dcentury = $century = $hCentury = $sixes = $fours = $overs = $wickets = $runsgiven = $ten_w = $five_w = 0;
$SR = 0.00;
$ER = 0.00;

// Check performance type and fetch corresponding values
if ($Performance === "Batting" || $Performance === "All_Round") {
    $innings = $_POST['Innings'];
    $runs = $_POST['Runs'];
    $balls = $_POST['Balls'];
    
    $dcentury = $_POST['DoubleCentury'];
    $century = $_POST['Century'];
    $hCentury = $_POST['HalfCentury'];
    $sixes = $_POST['Sixes'];
    $fours = $_POST['Fours'];
    $SR = $_POST['SR'];
}


if ($Performance === "Bowling" || $Performance === "All_Round") {
    $overs = $_POST['Overs'];
    $wickets = $_POST['Wickets'];
    $runsgiven = $_POST['RunsGiven'];
    $ER = $_POST['ER'];
    $ten_w = $_POST['ten_w'];
    $five_w = $_POST['five_w'];
}

// Prepare SQL statement
$sql = "INSERT INTO $tableName (MatchNo, MatchDate, Innings, Runs, Balls, 200s, 100s, 50s, 6s, 4s, SR, Overs, Wickets, RunsGiven, ER, 10w, 5w) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("isiiisssiidiiidss", $MatchNo, $MatchDate, $innings, $runs, $balls, $dcentury, $century, $hCentury, $sixes, $fours, $SR, $overs, $wickets, $runsgiven, $ER, $ten_w, $five_w);

// Execute statement
if ($stmt->execute()) {
    // Redirect to a success page
    header("Location: ../others/registration_successful.html");
    exit; // Terminate script execution after redirect
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Close connection
$conn->close();
?>
