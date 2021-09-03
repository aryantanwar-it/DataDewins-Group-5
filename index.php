<?php
$host = 'db';
$user = 'group5';
$pass = 'pass5';
$conn = new mysqli($host, $user, $pass);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} else {
    echo "MySQL Version : ",$conn->server_info;
}
?>