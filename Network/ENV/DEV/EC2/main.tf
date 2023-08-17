# VPC module 
module "vpc" {
  source = "../../../module/VPC"

  vpc_cidr             = var.vpc_cidr
  tenancy              = var.tenancy
  public_subnet_config      = var.public_subnet_config1
  private_subnet_config     = var.private_subnet_config1
 }

 
module "key" {
  source   = "../../../module/key_pair"
  key_name = var.public_key1
}


module "ec2-Bastion" {
  source              = "../../../module/EC2"
  security_group_1  = [module.vpc.security_group]
  subnet_id           = module.vpc.Public_sunbets[0]
  key_name1           = module.key.key_name
  associate_public_ip = true
  instance_t          = var.instance_t
  server_names        = var.server_tag

}


module "ec2-Application_instances" {
  source              = "../../../module/EC2"
  security_group_1  = [module.vpc.private_security_group]
  subnet_id           = module.vpc.Private_sunbets[1]
  key_name1           = module.key.key_name
  associate_public_ip = false
  instance_t          = var.instance_t 
  for_each           = var.instance_names
  server_names          = each.value
  
}


module "ec2-Frontend" {
  source              = "../../../module/EC2"
  security_group_1  = [module.vpc.private_security_group]
  subnet_id           = module.vpc.Private_sunbets[2]
  key_name1           = module.key.key_name
  associate_public_ip = false
  instance_t          = var.instance_t
  server_names          = var.instance_name



 }

# module "ALB" {
#   source = "../../../module/Alb"
#   Alb_security_group  = module.vpc.Alb_security_group
#   public_subnet_ID    = module.vpc.public_subnet_ID
#   vpc                 = module.vpc.vpc
#   public_subnet_ID-1 = module.vpc.public_subnet_ID-1
#   target_id_1          = module.ec2-Frontend.instance_id_Frontend  
#   target_id_2        = module.ec2-Attendance.instance_id_Attendance
#   target_id_3        = module.ec2-Salary.instance_id_Salary
#   target_id_4        = module.ec2-Employee.instance_id_Employee

  
#  }

