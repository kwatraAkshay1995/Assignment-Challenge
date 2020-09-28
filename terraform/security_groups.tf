resource "aws_security_group" "allow_http_lb" {
  name        = "allow_http_lb"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.assignment_vpc.id

  ingress {
    description = "HTTP from outside"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http_lb"
  }
}

resource "aws_security_group" "allow_http_web" {
  name        = "allow_http_web"
  description = "Allow HTTP inbound traffic through load balancer"
  vpc_id      = aws_vpc.assignment_vpc.id

  ingress {
    description = "HTTP from load balancer"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.allow_http_lb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http_web"
  }
}
