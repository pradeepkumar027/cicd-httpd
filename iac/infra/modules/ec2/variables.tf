variable "environment" {
  description = "environment"
  type = string
}

variable "resource_owner" {
  description = "resource owner"
  type = string
}

variable "vpc_id" {
  description = "aws vpc id"
  type = string
}

variable "ec2_instance_names" {
  description = "list of ec2 instance names"
  type = list(string)
}

variable "ami_id" {
  description = "ami id"
  type = string
}

variable "instance_type" {
  description = "ec2 instance type"
  type = string
  default = "t2.medium"
}

variable "key_name" {
  description = "ec2 ssh keypair name"
  type = string
}

variable "vpc_security_group_ids" {
  description = "vpc security group ids"
  type = list(string)
}