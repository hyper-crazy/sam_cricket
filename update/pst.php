<?php
// Database Connection
$servername = "localhost";
$username = "root";
$database = "sam_cricket";
$password = "";

// Create connection
$conn = new mysqli($servername, $username, $password, $database);
if ($conn->connect_error) {
    // If connection fails, return JSON error message
    echo json_encode(array("error" => "Connection failed: " . $conn->connect_error));
    exit();
}

// Check if playerName parameter is provided
if (!isset($_GET["playerName"])) {
    // If playerName parameter is missing, return JSON error message
    echo json_encode(array("error" => "Player name parameter is missing"));
    exit();
}

// Get the player name from the request
$playerName = $_GET["playerName"];

// Fetch player ID from the players table
$sqlt20PlayerID = "SELECT PlayerID FROM players WHERE Name = '$playerName'";
$resultt20PlayerID = $conn->query($sqlt20PlayerID);

if ($resultt20PlayerID) {
    if ($resultt20PlayerID->num_rows > 0) {
        $row = $resultt20PlayerID->fetch_assoc();
        $t20playerID = $row["PlayerID"];
        
        // Construct T20 table name
        $t20TableName = "player_" . $t20playerID . "_t20";
        
        // Fetch T20 statistics from the corresponding table
        $sql = "SELECT MAX(MatchNo) AS t20MatchNo,
                       MAX(Innings) AS t20Innings,
                       SUM(Runs) AS t20Runs,
                       SUM(Runs) / MAX(Innings) AS t20Average,
                       SUM(CASE WHEN `200s` = 'Yes' THEN 1 ELSE 0 END) AS t20d_hun,
                       SUM(CASE WHEN `100s` = 'Yes' THEN 1 ELSE 0 END) AS t20hun,
                       SUM(CASE WHEN `50s` = 'Yes' THEN 1 ELSE 0 END) AS t20h_hun,
                       SUM(`6s`) AS t20Sixes,
                       SUM(`4s`) AS t20Fours,
                       SUM(SR) / MAX(Innings) AS t20SR,
                       SUM(Overs) AS t20Overs,
                       SUM(Wickets) AS t20Wickets,
                       SUM(ER) / MAX(MatchNo) AS t20ER,
                       SUM(CASE WHEN `10w` = 'Yes' THEN 1 ELSE 0 END) AS t20ten_w,
                       SUM(CASE WHEN `5w` = 'Yes' THEN 1 ELSE 0 END) AS t20five_w
                FROM $t20TableName";
        $result = $conn->query($sql);

        if ($result) {
            if ($result->num_rows > 0) {
                $t20Stats = $result->fetch_assoc();
                // Return T20 stats as JSON
                echo json_encode($t20Stats);
            } else {
                // If no T20 statistics found for this player, return JSON error message
                echo json_encode(array("error" => "T20 statistics not found for this player"));
            }
        } else {
            // If query execution fails, return JSON error message
            echo json_encode(array("error" => "Query execution error: " . $conn->error));
        }
    } else {
        // If player not found, return JSON error message
        echo json_encode(array("error" => "Player not found"));
    }
} else {
    // If query execution fails, return JSON error message
    echo json_encode(array("error" => "Query execution error: " . $conn->error));
}

// Close connection
$conn->close();
?>
