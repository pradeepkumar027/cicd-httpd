locals {
  ssh_security_group_config = {
    name        = "ssh-ec2-sg-${var.region}"
    description = "security group to allow ssh"
    ingress_config = {
      "ssh_22" = {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
        ipv6_cidr_blocks = ["::/0"]
      }
    }
    egress_config = {
      "all_ports" = {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
      }
    }
  }

  httpd_security_group_config = {
    name        = "httpd-ec2-sg-${var.region}"
    description = "security group to allow http port 80"
    ingress_config = {
      "http_80" = {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
        ipv6_cidr_blocks = ["::/0"]
      }
    }
    egress_config = {}
  }
}