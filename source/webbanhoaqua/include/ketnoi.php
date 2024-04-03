<?php
	$conn = new mysqli("localhost", "root", "", "traicay");
	if ($conn->connect_error) {
		die("Kết nối cơ sở dữ liệu thất bại: " . $conn->connect_error);
	}
	
	$conn->set_charset("utf8");
	
?>