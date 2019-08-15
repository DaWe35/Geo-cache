<?php
/*
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
*/

require 'CONFIG.php';


if ($_SERVER['PHP_AUTH_USER'] != $http_user || $_SERVER['PHP_AUTH_PW'] != $http_pass) {
    header('WWW-Authenticate: Basic realm="My Realm"');
    header('HTTP/1.0 401 Unauthorized');
    exit();
}

if (empty($_GET['address'])) {
    exit('Empty address');
}


$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$address = mysqli_real_escape_string($conn, $_GET['address']); // thats old, I'm lazy to change, but next time use PDO pls

$sql = "SELECT lat, lon FROM coords WHERE address = '$address' LIMIT 1";
$result = $conn->query($sql);
$jsonarr = array();

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $jsonarr = $row;
} else {
	$coords = getCoordinates($address);
	if (!$coords[0]) {
		$lat = $jsonarr['lat'] = (string)$coords[1];
		$lon = $jsonarr['lon'] = (string)$coords[2];
	} else {
		exit($coords[0]);
	}

    $sql = "INSERT INTO `coords` (`address`, `lat`, `lon`) VALUES ('$address', '$lat', '$lon')";
    
    if ($conn->query($sql) === FALSE) {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
    
    $conn->close();

}

header('Content-Type: application/json');
print json_encode($jsonarr);

function getCoordinates($address){
	global $api_key;
	$address = urlencode($address);
	$cordurl = "https://maps.google.com/maps/api/geocode/json?sensor=false&key=".$api_key."&address=" . $address;
	$response = file_get_contents($cordurl);
	$json = json_decode($response,true);
	$error = false;
	
	if (isset($json['results'][0])) {
		$lat = $json['results'][0]['geometry']['location']['lat'];
		$lng = $json['results'][0]['geometry']['location']['lng'];
	} else {
		$error = 'No result';
	}
	
	if (isset($json['error_message'])) {
		$error = $json['error_message'];
	}
 
	return array($error, $lat, $lng);
}