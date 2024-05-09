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
$sqlodiPlayerID = "SELECT PlayerID FROM players WHERE Name = '$playerName'";
$resultodiPlayerID = $conn->query($sqlodiPlayerID);

if ($resultodiPlayerID) {
    if ($resultodiPlayerID->num_rows > 0) {
        $row = $resultodiPlayerID->fetch_assoc();
        $odiplayerID = $row["PlayerID"];
        
        // Construct odi table name
        $odiTableName = "player_" . $odiplayerID . "_odi";
        
        // Fetch odi statistics from the corresponding table
        $sql = "SELECT MAX(MatchNo) AS odiMatchNo,
                       MAX(Innings) AS odiInnings,
                       SUM(Runs) AS odiRuns,
                       SUM(Runs) / MAX(Innings) AS odiAverage,
                       SUM(CASE WHEN `200s` = 'Yes' THEN 1 ELSE 0 END) AS odid_hun,
                       SUM(CASE WHEN `100s` = 'Yes' THEN 1 ELSE 0 END) AS odihun,
                       SUM(CASE WHEN `50s` = 'Yes' THEN 1 ELSE 0 END) AS odih_hun,
                       SUM(`6s`) AS odiSixes,
                       SUM(`4s`) AS odiFours,
                       SUM(SR) / MAX(Innings) AS odiSR,
                       SUM(Overs) AS odiOvers,
                       SUM(Wickets) AS odiWickets,
                       SUM(ER) / MAX(MatchNo) AS odiER,
                       SUM(CASE WHEN `10w` = 'Yes' THEN 1 ELSE 0 END) AS oditen_w,
                       SUM(CASE WHEN `5w` = 'Yes' THEN 1 ELSE 0 END) AS odifive_w
                FROM $odiTableName";



        $result = $conn->query($sql);

        if ($result) {
            if ($result->num_rows > 0) {
                $odiStats = $result->fetch_assoc();
                // Return odi stats as JSON
                echo json_encode($odiStats);
            } else {
                // If no odi statistics found for this player, return JSON error message
                echo json_encode(array("error" => "odi statistics not found for this player"));
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
