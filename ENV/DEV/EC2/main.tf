# VPC module 
module "vpc" {
  source = "../../../module/VPC"

  vpc_cidr             = var.vpc_cidr
  tenancy              = var.tenancy
  available_zone       = var.available_zone
  available_zone2      = var.available_zone2
  vpc_tag              = var.vpc_tag
  Igw_tag              = var.Igw_tag
  public_sub_cidr      = var.public_sub_cidr
  public_sub_cidr-2     = var.public_sub_cidr2
  public_sub           = var.public_sub
  frontend_sub         = var.frontend_sub
  public_sub_route     = var.public_sub_route
  frontend_sub_cidr    = var.frontend_sub_cidr
  private_sub_route    = var.private_sub_route
  App-private_sub_cidr = var.App-private_sub_cidr
  App_sub              = var.App_sub
  elastic              = var.elastic
  Nat_Gateway          = var.Nat_Gateway
  subnet_tag           = var.subnet_tag
  route_table_tag      = var.route_table_tag
  public-rt-cidr       = var.public-rt-cidr
  name-sg              = var.name-sg
  ports                = var.ports
}

module "key" {
  source   = "../../../module/key_pair"
  key_name = var.public_key1
}


module "ec2-Bastion" {
  source              = "../../../module/EC2"
  security_group_1  = [module.vpc.security_group]
  subnet_id           = module.vpc.public_subnet_ID
  key_name1           = module.key.key_name
  associate_public_ip = true
  instance_t          = var.instance_t
  server_tag          = var.server_tag

}


module "ec2-Salary" {
  source              = "../../../module/EC2"
  security_group_1  = [module.vpc.private_security_group]
  subnet_id           = module.vpc.APP_Subnet
  key_name1           = module.key.key_name
  associate_public_ip = false
  instance_t          = var.instance_t 
  server_tag          = var.server_tag_1
 # count               = var.server_count
  #server_tag          = var.server_tag[count.index + 1]
  
}




module "ec2-Employee" {
  source              = "../../../module/EC2"
  security_group_1  = [module.vpc.private_security_group]
  subnet_id           = module.vpc.APP_Subnet
  key_name1           = module.key.key_name
  associate_public_ip = false
  instance_t          = var.instance_t 
  server_tag          = var.server_tag_2

}




module "ec2-Attendance" {
  source              = "../../../module/EC2"
  security_group_1  = [module.vpc.private_security_group]
  subnet_id           = module.vpc.APP_Subnet
  key_name1           = module.key.key_name
  associate_public_ip = false
  instance_t          = var.instance_t 
  server_tag          = var.server_tag_3

}

module "ec2-Frontend" {
  source              = "../../../module/EC2"
  security_group_1  = [module.vpc.private_security_group]
  subnet_id           = module.vpc.Frontend_Subnet
  key_name1           = module.key.key_name
  associate_public_ip = false
  instance_t          = var.instance_t
  server_tag          = var.server_tag_4



}

module "ALB" {
  source = "../../../module/Alb"
  Alb_security_group  = module.vpc.Alb_security_group
  public_subnet_ID    = module.vpc.public_subnet_ID
  vpc                 = module.vpc.vpc
  public_subnet_ID-1 = module.vpc.public_subnet_ID-1
  target_id_1          = module.ec2-Frontend.instance_id_Frontend  
  target_id_2        = module.ec2-Attendance.instance_id_Attendance
  target_id_3        = module.ec2-Salary.instance_id_Salary
  target_id_4        = module.ec2-Employee.instance_id_Employee

  
 }

