resource "aws_instance" "web" {
  count = length(var.ec2_instance_names)
  ami           = var.ami_id
  instance_type = var.instance_type

  key_name = var.key_name

  vpc_security_group_ids = var.vpc_security_group_ids

  user_data = <<EOF
#!/bin/bash
yum update
EOF

  tags = {
    Name        = var.ec2_instance_names[count.index]
    environment = var.environment
    resource_owner = var.resource_owner
  }
}