resource "aws_security_group" "main" {

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

resource "aws_security_group_rule" "subnet_range" {
  cidr_blocks       = ["10.0.0.0/16"]
  from_port         = 0
  to_port           = 0
  description       = "liberando trafego para toda a vpc"
  protocol          = "-1"
  security_group_id = aws_security_group.main.id
  type              = "ingress"
}
