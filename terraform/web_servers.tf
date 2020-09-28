data "template_file" "user_data_apache" {
  template = file("user_data_apache.tpl")

}

data "template_file" "user_data_nginx" {
  template = file("user_data_nginx.tpl")

}
resource "aws_instance" "apache" {
  ami                         = "ami-0d34dff9857739dfa"
  associate_public_ip_address = "true"
  instance_type               = "t3.micro"
  key_name                    = "akshay-123"
  vpc_security_group_ids      = [aws_security_group.allow_http_web.id]
  subnet_id                   = aws_subnet.public_us_east_1a.id
  user_data                   = data.template_file.user_data_apache.rendered

  tags = {
    Name = "apache-instance"
  }
}

resource "aws_instance" "nginx" {
  ami                         = "ami-07ca28a220522bf0b"
  associate_public_ip_address = "true"
  instance_type               = "t3.micro"
  key_name                    = "akshay-123"
  vpc_security_group_ids      = [aws_security_group.allow_http_web.id]
  subnet_id                   = aws_subnet.public_us_east_1b.id
  user_data                   = data.template_file.user_data_nginx.rendered
  tags = {
    Name = "nginx-instance"
  }
}
