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

// Get the search term from the request
$playerName = $_GET["playerName"];

// SQL to fetch player suggestions
$sql = "SELECT Name FROM players WHERE Name LIKE '". $playerName[0]."%' AND Name LIKE '%$playerName%'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Output suggestions
    echo '<ul class="suggestion-list">';
    while ($row = $result->fetch_assoc()) {
        echo '<li class="suggestion-item">' . $row["Name"] . '</li>';
    }
    echo '</ul>';
} else {
    echo "No suggestions";
}

// Close connection
$conn->close();
?>
