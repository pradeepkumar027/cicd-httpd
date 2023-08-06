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

variable "vpc_cidr" {
  description = "aws vpc cidr"
  type = string
}

variable "security_group_config" {
    description = "security group specification"
    type = any
}