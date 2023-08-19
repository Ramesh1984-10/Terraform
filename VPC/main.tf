# VPC module 
module "vpc" {
  source = "../../../module/VPC"

  vpc_cidr              = var.vpc_cidr
  tenancy               = var.tenancy
  vpc_name              = var.vpc_name
  Igw_name              = var.Igw_name
  Nat_Gateway           = var.Nat_Gateway
  public_rt_cidr        = var.public_rt_cidr
  ports                 = var.ports
  baiston_dynamic_sg    = var.baiston_dynamic
  App_dynamic_sg        = var.App_dynamic
  ALB_dynamic_sg        = var.ALB_dynamic
  public_subnet_config  = var.public_subnet_config1
  private_subnet_config = var.private_subnet_config1
  Baiston_SG_Name       = var.Baiston_SG
  Private_SG_Name       = var.Private_SG
  ALB_SG_Name           = var.ALB_SG
  ENV_Name              = var.ENV

}




