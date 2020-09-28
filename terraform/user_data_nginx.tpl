#!/bin/bash
echo "<!DOCTYPE html>
<html>
<head>
<title>Nginx Website</title>
</head>
<body>

<h1>Hello Credit Saison World - running on Nginx - on port 80</h1>

<p>Following steps are taken to configure Nginx Webserver</p>

<h2>First Screenshot</h2>

<img src="https://d1acywhlz0j6l9.cloudfront.net/nginx/screen-shot1.PNG" alt="nginx first screenshot">

<h2>Second Screenshot</h2>

<img src="https://d1acywhlz0j6l9.cloudfront.net/nginx/screen-shot2.PNG" alt="nginx second screenshot">

<h2>Third Screenshot</h2>

<img src="https://d1acywhlz0j6l9.cloudfront.net/nginx/screen-shot3.PNG" alt="nginx third screenshot">


</body>
</html>" > /web/usr/share/nginx/html/index.html

systemctl restart nginx
