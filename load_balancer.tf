resource "aws_security_group" "lb" {

  name = format("%-load-balancer", var.project_name)

  vpc_id = data.aws_ssm_parameter.vpc.value

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

}

resource "aws_security_group_rule" "ingress_80" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 80
  to_port           = 80
  description       = "liberando a porta 80"
  protocol          = "-1"
  security_group_id = aws_security_group.lb.id
  type              = "ingress"
}

resource "aws_security_group_rule" "ingress_443" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 443
  to_port           = 443
  description       = "liberando a porta 443"
  protocol          = "-1"
  security_group_id = aws_security_group.lb.id
  type              = "ingress"
}

resource "aws_lb" "main" {
  name               = format("%-ingress", var.project_name)
  internal           = var.load_balancer_internal
  load_balancer_type = var.load_balancer_type
  security_groups    = [aws_security_group.lb.id]
  subnets = [
    data.aws_ssm_parameter.subnet_public_1a,
    data.aws_ssm_parameter.subnet_public_1b,
    data.aws_ssm_parameter.subnet_public_1c
  ]

  enable_deletion_protection       = false
  enable_cross_zone_load_balancing = false

  tags = {
    Environment = "Dev"
  }
}

resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type = "fixed-reponse"
    fixed_response {
      content_type = "text/plain"
      message_body = "container-ecs"
      status_code  = "200"
    }
  }
}
