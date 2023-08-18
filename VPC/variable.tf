variable "vpc_cidr" {
  description = "main vpc cidr"
  default     = ""
}


variable "tenancy" {
  default = ""
}

variable "vpc_name" {
  type    = string
  default = ""

}

variable "Igw_name" {
  type    = string
  default = ""

}


variable "elastic" {
  type    = string
  default = ""

}

variable "Nat_Gateway" {
  type    = string
  default = ""

}



variable "public_rt_cidr" {
  type        = string
  description = "private route table cidr and nat gateway"
  default     = ""
}

variable "name-sg" {
  type    = string
  default = ""
}



variable "ports" {
  default = ""
  

}


#######################################


variable "public_subnet_config" {
  description = "Configuration for public subnets"
}


variable "private_subnet_config" {
  description = "Configuration for public subnets"
}



variable "Baiston_SG_Name" {
  description = "Name of Bastion security Group"
     
}


variable "Private_SG_Name" {
  description = "Name of Private security Group"
  
}

variable "ALB_SG_Name" {
  description = "Name of ALB security Group"
  
}


variable "ENV_Name" {
  description = "Name of the Environmet"
  
}