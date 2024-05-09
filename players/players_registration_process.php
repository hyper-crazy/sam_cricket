<?php

// Retrieve data from HTML form
$PlayerID = $_POST['PlayerID'];
$Name = $_POST['Name'];
$Age = $_POST['Age'];
$Gender = $_POST['Gender'];
$Father = $_POST['Father'];
$Mother = $_POST['Mother'];
$PresentAddress = $_POST['PresentAddress'];
$DateOfBirth = $_POST['DateOfBirth'];
$JoinDate = $_POST['JoinDate'];
$Role = $_POST['Role'];
if ($Role === "wicket-keeper") {
    // If the role is wicket-keeper, set bowling to null
    $Batting = isset($_POST['Batting']) ? $_POST['Batting'] : null;
    $Bowling = null;
} else {
    // For other roles, handle batting and bowling normally
    $Batting = isset($_POST['Batting']) ? $_POST['Batting'] : null;
    $Bowling = isset($_POST['Bowling']) ? $_POST['Bowling'] : null;
}

$Grade = $_POST['Grade'];
$CoachID = $_POST['CoachID']; // Adding CoachID here
$Email = $_POST['Email'];
$Phone = $_POST['Phone'];

// Convert phone number to integer
$Phone = (int)$Phone;

//Database Connection
$servername = "localhost";
$username = "root";
$database = "sam_cricket";
$password = "";

// Create connection
$conn = new mysqli($servername, $username, $password, $database);
if ($conn->connect_error) {
    die('Connection Failed : '.$conn->connect_error);
} else {
    // Check if PlayerID already exists
    $check_sql = "SELECT PlayerID FROM players WHERE PlayerID = ?";
    $check_stmt = $conn->prepare($check_sql);
    $check_stmt->bind_param("i", $PlayerID);
    $check_stmt->execute();
    $check_stmt->store_result();
    if ($check_stmt->num_rows > 0) {
        // PlayerID already exists, display error message
        echo '<div style="background-color: #ffcccc; border: 1px solid #ff0000; padding: 11px; margin-bottom: 5px;
                          text-align: center; font-family: Arial, sans-serif; font-size: 16px; font-weight: slim;">';
        echo 'This PlayerID already exists. Please
              <a href="players_registration_form.html" style="text-decoration: none; color: ff3333;">
               create a new one</a>.';
        echo '</div>';
    } else {
        // PlayerID does not exist, proceed with insertion
        // Define SQL query
        $sql = "INSERT INTO players (PlayerID, Name, Age, Gender, Father, Mother, PresentAddress, DateOfBirth, JoinDate,
                                 Role, Batting, Bowling, Grade, CoachID, Email, Phone)
                   VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        // Prepare SQL statement
        $stmt = $conn->prepare($sql);
        if (!$stmt) {
            die('Prepare Failed : '.$conn->error);
        }

        // Bind parameters
        $stmt->bind_param("isissssssssssisi", $PlayerID, $Name, $Age, $Gender, $Father, $Mother, $PresentAddress,
                           $DateOfBirth, $JoinDate, $Role, $Batting, $Bowling, $Grade, $CoachID, $Email, $Phone);
                                         
        // Execute statement
        $success = $stmt->execute();
        if ($success) {
            // Create player odi performance table
            $create_player_odi_performance_sql = "CREATE TABLE player_{$PlayerID}_odi (
                MatchNo INT(10) PRIMARY KEY,
                MatchDate DATE NOT NULL,
                Innings INT(10) NOT NULL DEFAULT 0,
                Runs INT(10) NOT NULL DEFAULT 0,
                Balls INT(3) NOT NULL DEFAULT 0,
                `200s` varchar(4) NOT NULL DEFAULT 0,
                `100s` varchar(4) NOT NULL DEFAULT 0,
                `50s` varchar(4) NOT NULL DEFAULT 0,
                `6s` INT(10) NOT NULL DEFAULT 0,
                `4s` INT(10) NOT NULL DEFAULT 0,
                SR DECIMAL(5,2) NOT NULL DEFAULT 0,
                Overs INT(3) NOT NULL DEFAULT 0,
                Wickets INT(10) NOT NULL DEFAULT 0,
                RunsGiven INT(10) NOT NULL DEFAULT 0,
                ER DECIMAL(5,2) NOT NULL DEFAULT 0,
                `10w` varchar(4) NOT NULL DEFAULT 0,
                `5w` varchar(4) NOT NULL DEFAULT 0
            )";

            $conn->query($create_player_odi_performance_sql);

            // Create player t20 performance table
            $create_player_t20_performance_sql = "CREATE TABLE player_{$PlayerID}_t20 (
                MatchNo INT(10) PRIMARY KEY,
                MatchDate DATE NOT NULL,
                Innings INT(10) NOT NULL DEFAULT 0,
                Runs INT(10) NOT NULL DEFAULT 0,
                Balls INT(3) NOT NULL DEFAULT 0,
                `200s` varchar(4) NOT NULL DEFAULT 0,
                `100s` varchar(4) NOT NULL DEFAULT 0,
                `50s` varchar(4) NOT NULL DEFAULT 0,
                `6s` INT(10) NOT NULL DEFAULT 0,
                `4s` INT(10) NOT NULL DEFAULT 0,
                SR DECIMAL(5,2) NOT NULL DEFAULT 0,
                Overs INT(3) NOT NULL DEFAULT 0,
                Wickets INT(10) NOT NULL DEFAULT 0,
                RunsGiven INT(10) NOT NULL DEFAULT 0,
                ER DECIMAL(5,2) NOT NULL DEFAULT 0,
                `10w` varchar(4) NOT NULL DEFAULT 0,
                `5w` varchar(4) NOT NULL DEFAULT 0
            )";

            $conn->query($create_player_t20_performance_sql);

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

?>
