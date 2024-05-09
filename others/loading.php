<?php
// Check if the user is logged in
session_start();
if (!isset($_SESSION['username'])) {
    // Redirect to the login page if the user is not logged in
    header('Location: login.html');
    exit();
}

// Fetch the user's full name from the database based on the username
$username = $_SESSION['username'];

// Establish a database connection (replace placeholders with actual database credentials)
$servername = "localhost";
$usernameDB = "root";
$passwordDB = "";
$dbname = "sam_cricket";

// Create connection
$conn = new mysqli($servername, $usernameDB, $passwordDB, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Prepare SQL statement
$sql = "SELECT fullname FROM users WHERE username = '$username'"; // Enclose username in quotes

// Execute SQL query
$result = $conn->query($sql);

if ($result && $result->num_rows > 0) {
    // Fetch user's full name from the result
    $row = $result->fetch_assoc();
    $fullname = $row['fullname'];

    // Return user's full name as JSON response
    header('Content-Type: application/json');
    echo json_encode(array('fullname' => $fullname));
} else {
    // Handle case where user is not found in the database
    header('HTTP/1.1 500 Internal Server Error');
    echo json_encode(array('error' => 'User not found in the database'));
}

// Close connection
$conn->close();
?>
