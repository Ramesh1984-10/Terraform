vpc_cidr       = "10.0.0.0/16"
tenancy        = "default"
vpc_name       = "VPC_DEV"
Igw_name       = "Internet_Gateway"
elastic        = "Elastic-Ip"
public_rt_cidr = "0.0.0.0/0"
Nat_Gateway    = "Nat"
Baiston_SG     = "Baiston_Security_Group"
Private_SG     = "Private_Security_Group"
ALB_SG         = "ALB_Security_Group"
ENV            = "DEV"

public_subnet_config1 = {
  "Public_subnet1" = {
    cidr_block        = "10.0.1.0/24"
    availability_zone = "us-east-1a"
  }
  "Public_subnet2" = {
    cidr_block        = "10.0.5.0/24"
    availability_zone = "us-east-1b"
  }
}

private_subnet_config1 = {
  "Forntend_subnet" = {
    cidr_block        = "10.0.2.0/24"
    availability_zone = "us-east-1a"
  }
  "Application_subnet" = {
    cidr_block        = "10.0.3.0/24"
    availability_zone = "us-east-1a"
  }


  "Data_Base_subnet" = {
    cidr_block        = "10.0.4.0/24"
    availability_zone = "us-east-1a"
  }
}



baiston_dynamic = {
  ingress_rules = [{
    port     = 22
    protocol = "tcp"
    },
    {
      port     = 80
      protocol = "tcp"
    },
    {
      port     = 443
      protocol = "tcp"

  }]
}


App_dynamic = {
  ingress_rules = [{
    port     = 22
    protocol = "tcp"
    },
    {
      port     = 80
      protocol = "tcp"
  }]
}



ALB_dynamic = {
  ingress_rules = [{
    port     = 80
    protocol = "tcp"
  }]
}