<?php

// Retrieve data from HTML form
$CoachID = $_POST['CoachID'];
$Name = $_POST['Name'];
$Age = $_POST['Age'];
$Gender = $_POST['Gender'];
$DateOfBirth = $_POST['DateOfBirth'];
$JoinDate = $_POST['JoinDate'];
$Grade = $_POST['Grade'];
$Email = $_POST['Email'];
$Phone = $_POST['Phone'];

// Convert phone number to integer
$Phone = (int)$Phone;

// Database Connection
$servername = "localhost";
$username = "root";
$database = "sam_cricket";
$password = "";

// Create connection
$conn = new mysqli($servername, $username, $password, $database);
if ($conn->connect_error) {
    die('Connection Failed : '.$conn->connect_error);
} else {
    // Check if CoachID already exists
    $check_sql = "SELECT CoachID FROM coaches WHERE CoachID = ?";
    $check_stmt = $conn->prepare($check_sql);
    $check_stmt->bind_param("i", $CoachID);
    $check_stmt->execute();
    $check_stmt->store_result();
    if ($check_stmt->num_rows > 0) {
        // CoachID already exists, display error message with link
        echo '<div style="background-color: #ffcccc; border: 1px solid #ff0000; padding: 15px; margin-bottom: 5px;
                   text-align: center; font-family: Arial, sans-serif; font-size: 20px; font-weight: slim;">';
        echo 'This CoachID already exists. Please
              <a href="coaches_registration_form.html" style="text-decoration: none; color: ff3333;">create new</a>.';
        echo '</div>';
    } else {
        // CoachID does not exist, proceed with insertion
        // Define SQL query
        $sql = "INSERT INTO coaches (CoachID, Name, Age, Gender, DateOfBirth, JoinDate, Grade, Email, Phone)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        // Prepare SQL statement
        $stmt = $conn->prepare($sql);
        if (!$stmt) {
            die('Prepare Failed : '.$conn->error);
        }

        // Bind parameters
        $stmt->bind_param("isisssssi", $CoachID, $Name, $Age, $Gender, $DateOfBirth, $JoinDate, $Grade, $Email, $Phone);

        // Execute statement
        $success = $stmt->execute();
        if ($success) {
            // Redirect back to the form with a success message
            header("Location: ../others/registration_successful.html");
            exit; // Terminate script execution after redirect
        } else {
            die('Execution Failed : '.$stmt->error);
        }

        // Close statement
        $stmt->close();
    }

    // Close check statement
    $check_stmt->close();
}

// Close connection
$conn->close();
