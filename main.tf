# VPC module 
module "vpc" {
    source = "./VPC/module"
    vpc_cidr = var.vpc_cidr
    public_sub_cidr = var.public_sub_cidr
    az  = var.az
    private_sub_cidr = var.private_sub_cidr
    db-private_sub_cidr = var.db-private_sub_cidr
    subnet_tag = var.subnet_tag
    public-rt-cidr = var.public-rt-cidr

}
 