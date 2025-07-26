resource "aws_instance" "webserver" {
    ami = var.ami
    instance_type = var.instancetype
    vpc_security_group_ids = [for secuiritygroup in aws_security_group.server : secuiritygroup.id]
    tags = var.tags
}
resource "aws_security_group" "server" {
  for_each    = var.secuirity_group_rules
  name        = "allow-${each.key}"
  description = "allow traffic from-${each.key}"
  ingress {
    from_port   = each.value.from_port
    to_port     = each.value.to_port
    protocol    = each.value.protocol
    cidr_blocks = each.value.cidr_blocks
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Name" = "allow_${each.key}"
  }
  
}