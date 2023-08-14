# VPC module 
module "vpc" {
  source              = "../../../module/VPC"
  vpc_cidr            = var.vpc_cidr
  tenancy             = var.tenancy
  available_zone      = var.available_zone
  vpc_tag             = var.vpc_tag
  Igw_tag             = var.Igw_tag
  public_sub_cidr     = var.public_sub_cidr
  public_sub          = var.public_sub
  frontend_sub        = var.frontend_sub
  public_sub_route    = var.public_sub_route
  frontend_sub_cidr    = var.frontend_sub_cidr
  private_sub_route   = var.private_sub_route
  App-private_sub_cidr = var.App-private_sub_cidr
  App_sub              = var.App_sub
  db_route            = var.db_route
  elastic             = var.elastic
  Nat_Gateway         = var.Nat_Gateway
  subnet_tag          = var.subnet_tag
  route_table_tag     = var.route_table_tag
  public-rt-cidr      = var.public-rt-cidr
  name-sg             = var.name-sg
  ports               = var.ports
}

# module "ec2" {
#   source           = "../../../module/EC2"
#   public_subnet_ID = module.vpc.public_subnet_ID
#   security_group   = module.vpc.security_group
#   private_sub_id   = module.vpc.private_sub_id


# }

# module "ec2-1" {
#   source           = "../../../module/EC2"
#   private_security_group   = module.vpc.private_security_group
#   private_sub_id   = module.vpc.private_sub_id


#}