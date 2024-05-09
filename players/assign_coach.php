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

// Check if grade is set and not empty
if (isset($_GET['grade']) && !empty($_GET['grade'])) {
    $grade = $_GET['grade'];
    
    // Prepare SQL statement to fetch coaches based on grade
    $stmt = $conn->prepare("SELECT CoachID, Name FROM coaches WHERE Grade = ?");
    $stmt->bind_param("s", $grade);
    $stmt->execute();
    $result = $stmt->get_result();

    // Fetch coaches as associative array
    $coaches = [];
    while ($row = $result->fetch_assoc()) {
        $coaches[] = [
            'id' => $row['CoachID'],
            'name' => $row['Name']
        ];
    }

    // Close statement and connection
    $stmt->close();
    $conn->close();

    // Return coaches as JSON
    echo json_encode($coaches);
} else {
    // If grade is not set or empty, return an empty array
    echo json_encode([]);
}
