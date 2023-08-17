variable "vpc_cidr" {
  type        = string
  description = "main vpc cidr"
  default     = "10.0.0.0/16"
}




variable "tenancy" {
  type    = string
  default = "default"
}

variable "vpc_name" {
  type    = string
  default = "VPC_DEV"

}

variable "Igw_name" {
  type    = string
  default = "Internet_Gateway"

}



variable "elastic" {
  type    = string
  default = "Elastic-Ip"

}






variable "public_rt_cidr" {
  type        = string
  description = "private route table cidr and nat gateway"
  default     = "0.0.0.0/0"
}

variable "name-sg" {
  type    = string
  default = "bastion-sg"
}



variable "ports" {
  type    = list(number)
  default = [22, 80, 443]

}

variable "Nat_Gateway" {
  type    = string
  default = "Nat"

}



variable "public_subnet_config1" {
  description = "Configuration for public subnets"
  type        = map(any)
  default = {
    "Public_subnet1" = {
      cidr_block        = "10.0.1.0/24"
      availability_zone = "us-east-1a"
    }
    "Public_subnet2" = {
      cidr_block        = "10.0.5.0/24"
      availability_zone = "us-east-1b"
    }
  }
}



variable "private_subnet_config1" {
  description = "Configuration for public subnets"
  type        = map(any)
  default = {
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
}

