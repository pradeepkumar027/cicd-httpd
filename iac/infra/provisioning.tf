module "create_ssh_security_group" {
  source = "./modules/sg"

  security_group_config = local.ssh_security_group_config
  vpc_id                = var.vpc_id
  vpc_cidr              = var.vpc_cidr

  environment    = var.environment
  resource_owner = var.resource_owner
}

module "create_httpd_security_group" {
  source = "./modules/sg"

  security_group_config = local.httpd_security_group_config
  vpc_id                = var.vpc_id
  vpc_cidr              = var.vpc_cidr

  environment    = var.environment
  resource_owner = var.resource_owner
}

module "create_httpd_ec2_instance" {
  source = "./modules/ec2"

  ec2_instance_names = [
    "httpd-${var.environment}-${var.region}"
  ]

  ami_id = var.ami_id
  key_name = "ssh-keypair"

  vpc_id                = var.vpc_id
  vpc_security_group_ids = [module.create_ssh_security_group.security_group_id, module.create_httpd_security_group.security_group_id]

  environment    = var.environment
  resource_owner = var.resource_owner
}