<?php
// Database Connection
$servername = "localhost";
$username = "root";
$password = "";
$database = "sam_cricket"; // Change this to your actual database name

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if player_id and format are set and not empty
if (isset($_GET['player_id']) && !empty($_GET['player_id']) && isset($_GET['format']) && !empty($_GET['format'])) {
    $PlayerId = $_GET['player_id'];
    $Format = $_GET['format'];

    // Prepare and execute SQL query to fetch player's name
    $stmt = $conn->prepare("SELECT Name, Role FROM players WHERE PlayerID = ?");
    $stmt->bind_param("i", $PlayerId);
    $stmt->execute();
    $result = $stmt->get_result();

    // Prepare response array
    $response = array();

    // Check if result is not empty
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $response['Name'] = $row['Name'];
        $response['Role'] = $row['Role'];
    }

    // Close statement
    $stmt->close();

    // Determine the appropriate table name based on the format
    $table = "player_" . $PlayerId . "_" . $Format;

    // Prepare and execute SQL query to fetch maximum match number
    $stmt = $conn->prepare("SELECT MAX(MatchNo) AS MaxMatchNo, MAX(Innings) AS MaxInnings FROM $table");
    $stmt->execute();
    $result = $stmt->get_result();

    // Check if result is not empty
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $response['MatchNo'] = $row['MaxMatchNo'];
        $response['Innings'] = $row['MaxInnings'];
    }

    // Close statement and database connection
    $stmt->close();
    $conn->close();

    // Send JSON response
    header('Content-Type: application/json');
    echo json_encode($response);
} else {
    // If player_id or format is not set or empty, return an empty array
    echo json_encode([]);
}
?>
