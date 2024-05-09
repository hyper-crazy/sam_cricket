<?php
session_start();

// Connect to the database
$servername = "localhost";
$usernameDB = "root";
$passwordDB = "";
$dbname = "sam_cricket";

$conn = new mysqli($servername, $usernameDB, $passwordDB, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get form data
$usernameForm = $_POST['username'];
$passwordForm = $_POST['password'];

// Query database for user (case-sensitive)
$sql = "SELECT * FROM users WHERE BINARY username=?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $usernameForm);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    // User found
    $user = $result->fetch_assoc();
    $passwordFromDB = $user['password'];
    
    // Verify password
    if ($passwordForm === $passwordFromDB) {
        // Password is correct, set session and redirect to homepage
        $_SESSION['username'] = $usernameForm;
        header("Location: ../others/loading.html");
        exit(); // Always exit after header redirect
    } else {
      header("Location: ../others/error_password.html");
    }
} else { 
    header("Location: ../others/error_user.html");
}

$stmt->close();
$conn->close();
?>
