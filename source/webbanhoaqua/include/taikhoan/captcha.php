<?php
	// session_start();
	// $captcha=imagecreatefromgif('nencaptcha.gif');
	
	// $mauden=imagecolorallocate($captcha,0,0,0);
	// $mautrang=imagecolorallocate($captcha,225,225,225);
	
	// $font="Vnarial.ttf";
	// $string = md5(microtime() . time());
	// $text=substr($string,0,8);
	// $_SESSION['maxacnhan']=$text;
	
	// imagettftext($captcha,15,0,20,27,$mautrang,$font,$text);
	// imagepng($captcha);
		
	// imagedestroy($captcha);
	session_start();

	$width = 100; // chiều rộng của captcha
	$height = 30; // chiều cao của captcha
	$characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'; // chuỗi ký tự cho captcha
	$characters_length = strlen($characters);
	$captcha = imagecreate($width, $height); // tạo ảnh captcha mới

	// Thiết lập màu nền cho ảnh captcha
	$background_color = imagecolorallocate($captcha, 255, 255, 255);
	imagefill($captcha, 0, 0, $background_color);

	// Thiết lập màu chữ cho ảnh captcha
	$text_color = imagecolorallocate($captcha, 0, 0, 0);

	// Tạo chuỗi captcha ngẫu nhiên
	$captcha_string = '';
	for ($i = 0; $i < 6; $i++) {
		$captcha_string .= $characters[rand(0, $characters_length - 1)];
	}

	$_SESSION['maxacnhan'] = $captcha_string; // Lưu captcha vào session

	// Vẽ captcha lên ảnh
	$font_size = 14; // Kích thước font chữ
	$text_box = imagettfbbox($font_size, 0, 'Vnarial.ttf', $captcha_string);
	$x = ($width - $text_box[2]) / 2;
	$y = ($height - $text_box[5]) / 2;
	imagettftext($captcha, $font_size, 0, $x, $y, $text_color, 'Vnarial.ttf', $captcha_string);

	// Output captcha dưới dạng ảnh PNG
	header('Content-type: image/png');
	imagepng($captcha);

	// Giải phóng bộ nhớ sau khi sử dụng ảnh captcha
	imagedestroy($captcha);
?>