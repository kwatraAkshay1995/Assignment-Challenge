#!/bin/bash
echo "<!DOCTYPE html>
<html>
<head>
<title>Apache Website</title>
</head>
<body>

<h1>Hello Credit Saison World – running on Apache – on port 80</h1>

<p>Following steps are taken to configure Apache Webserver</p>

<h2>First Screenshot</h2>

<img src="https://d1acywhlz0j6l9.cloudfront.net/apache/screen-shot1.PNG" alt="apache first screenshot">

<h2>Second Screenshot</h2>

<img src="https://d1acywhlz0j6l9.cloudfront.net/apache/screen-shot2.PNG" alt="apache second screenshot">

<h2>Third Screenshot</h2>

<img src="https://d1acywhlz0j6l9.cloudfront.net/apache/screen-shot3.PNG" alt="apache third screenshot">


</body>
</html>" > /web/var/www/html/index.html

systemctl restart httpd
