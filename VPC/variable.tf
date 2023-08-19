variable "vpc_cidr" {
  type        = string
  description = "main vpc cidr"
  default     = ""
}

variable "tenancy" {
  type    = string
  default = ""
}

variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default     = ""

}

variable "Igw_name" {
  description = "Internet Gateway Name"
  type        = string
  default     = ""

}



variable "elastic" {
  description = "Elastic Ip Name"
  type        = string
  default     = ""

}






variable "public_rt_cidr" {
  type        = string
  description = "private route table cidr and nat gateway"
  default     = ""
}



variable "ports" {
  type        = list(number)
  description = "Bastion security group ports"
  default     = []

}

variable "Nat_Gateway" {
  type    = string
  default = ""

}



variable "public_subnet_config1" {
  description = "Configuration for public subnets"
  type        = map(any)
}



variable "private_subnet_config1" {
  description = "Configuration for public subnets"
  type        = map(any)

}

variable "Baiston_SG" {
  description = "Name of Bastion security Group"
  default     = ""

}

variable "Private_SG" {
  description = "Name of Bastion security Group"
  default     = ""

}


variable "ALB_SG" {
  description = "Name of ALB security Group"
  default     = ""

}

variable "ENV" {
  description = "Name of the Environmet"
  default     = ""


}

variable "baiston_dynamic" {
  type = map(any)
}

variable "App_dynamic" {
  type = map(any)
}

variable "ALB_dynamic" {
  type = map(any)
}