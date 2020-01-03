<?php

$apiusername = 'Your VROffice Username';
$apipassword = 'Your VROffice Passsword';

$im1 = file_get_contents('image1.jpg');
$imdata1 = base64_encode($im1);


$im2 = file_get_contents('image2.jpg');
$imdata2 = base64_encode($im2);    


$url = 'https://www.vrofficeplace.com/admin/api/faceapi.php';

//The data you want to send via POST
$fields = [
    'username'      => $apiusername,
    'password' => $apipassword,
    'image1'         => $imdata1,
    'image2'    =>      $imdata2
];

$fields_string = http_build_query($fields);

$ch = curl_init();

curl_setopt($ch,CURLOPT_URL, $url);
curl_setopt($ch,CURLOPT_POST, true);
curl_setopt($ch,CURLOPT_POSTFIELDS, $fields_string);

curl_setopt($ch,CURLOPT_RETURNTRANSFER, true); 


$result = curl_exec($ch);
echo $result;

?>
