resource "aws_ssm_parameter" "lb_arn" {
  name  = "/containers-ecs/lb/id"
  value = aws_lb.main.arn
  type  = "string"
}

resource "aws_ssm_parameter" "lb_listener" {
  name  = "/containers-ecs/lb/listener"
  value = aws_lb_listener.main.arn
  type  = "string"
}
