variable "region" {
  description = "aws region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "environment"
  type        = string
}

variable "resource_owner" {
  description = "resource owner"
  type        = string
}

variable "vpc_id" {
  description = "aws vpc id"
  type        = string
}

variable "vpc_cidr" {
  description = "aws vpc cidr"
  type        = string
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