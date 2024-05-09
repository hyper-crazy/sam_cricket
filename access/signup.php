<?php
// Connect to the database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "sam_cricket";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// Get form data
$email = $_POST['email'];
$username = $_POST['username'];
$fullname = $_POST['fullname'];
$password = $_POST['password'];

// Check if the username already exists
$sql_check_username = "SELECT * FROM users WHERE username = '$username'";
$result_check_username = $conn->query($sql_check_username);

if ($result_check_username->num_rows > 0) {
  // Username already exists, redirect to signup_failed.html
  header("Location: ../others/signup_error.html");
  exit();
}

// Insert user data into the database
$sql_insert_user = "INSERT INTO users (email, username, fullname, password) VALUES ('$email', '$username', '$fullname', '$password')";

if ($conn->query($sql_insert_user) === TRUE) {
  header("Location: ../others/signup_success.html");
} else {
  echo "Error: " . $sql_insert_user . "<br>" . $conn->error;
}

$conn->close();
?>
