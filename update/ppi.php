<?php
// Database Connection
$servername = "localhost";
$username = "root";
$database = "sam_cricket";
$password = "";

// Create connection
$conn = new mysqli($servername, $username, $password, $database);
if ($conn->connect_error) {
    die('Connection Failed : ' . $conn->connect_error);
}

// Get the player name from the request
$playerName = $_GET["playerName"];

// Fetch player details from the players table
$sql = "SELECT * FROM players WHERE Name = '$playerName'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $player = $result->fetch_assoc();
    // Construct player info array
    $playerInfo = array(
        "Name" => $player["Name"],
        "Age" => $player["Age"],
        "Gender" => $player["Gender"],
        "Role" => $player["Role"],
        "Grade" => $player["Grade"]
    );
    // Return player info as JSON
    echo json_encode($playerInfo);
} else {
    echo "Player not found";
}

// Close connection
$conn->close();
?>
