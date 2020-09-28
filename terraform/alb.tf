resource "aws_lb_target_group" "web_target_group" {
  health_check {
    interval            = 10
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  name        = "assignment-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.assignment_vpc.id
}

resource "aws_lb_target_group_attachment" "apache_alb_target_group_attachment" {
  target_group_arn = aws_lb_target_group.web_target_group.arn
  target_id        = aws_instance.apache.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "nginx_alb_target_group_attachment" {
  target_group_arn = aws_lb_target_group.web_target_group.arn
  target_id        = aws_instance.nginx.id
  port             = 80
}

resource "aws_lb" "assignment_alb" {
  name     = "assignment-alb"
  internal = false

  security_groups = [aws_security_group.allow_http_lb.id]

  subnets = [
    aws_subnet.public_us_east_1a.id,
    aws_subnet.public_us_east_1b.id
  ]

  tags = {
    Name = "assignment-alb"
  }

  ip_address_type    = "ipv4"
  load_balancer_type = "application"
}

resource "aws_lb_listener" "assignment_alb_listner" {
  load_balancer_arn = aws_lb.assignment_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_target_group.arn
  }
}
