# VPC module 
module "vpc" {
  source = "../../../module/VPC"

  vpc_cidr              = var.vpc_cidr
  tenancy               = var.tenancy
  vpc_name              = var.vpc_name
  Igw_name              = var.Igw_name
  Nat_Gateway           = var.Nat_Gateway
  public_rt_cidr        = var.public_rt_cidr
  name-sg               = var.name-sg
  ports                 = var.ports
  public_subnet_config  = var.public_subnet_config1
  private_subnet_config = var.private_subnet_config1
}