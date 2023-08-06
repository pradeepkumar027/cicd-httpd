data "aws_vpc" "vpc" {
  id = var.vpc_id
}

resource "aws_security_group" "security_group" {
  name = var.security_group_config.name
  description = var.security_group_config.description
  vpc_id = data.aws_vpc.vpc.id

  tags = {
    name        = var.security_group_config.name
    Name        = var.security_group_config.name
    environment = var.environment
    resource_owner = var.resource_owner
  }
}

resource "aws_security_group_rule" "ingress" {
  for_each = var.security_group_config.ingress_config
  type              = "ingress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  ipv6_cidr_blocks  = each.value.ipv6_cidr_blocks
  security_group_id  = aws_security_group.security_group.id
}

resource "aws_security_group_rule" "egress" {
  for_each = var.security_group_config.egress_config
  type              = "egress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  ipv6_cidr_blocks  = each.value.ipv6_cidr_blocks
  security_group_id  = aws_security_group.security_group.id
}