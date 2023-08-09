variable "vpc_cidr" {
    type = string
    description = "main vpc cidr"
  
}
variable "public_sub_cidr" {
    type = string
  
}

variable "private_sub_cidr" {
    type = list(string)
  
}

variable "db-private_sub_cidr" {
    type = string
  
}

variable "az" {
    type = string
}

variable "subnet_tag" {
  description = "Define Subnet Names"
  type        = map(string)
}


variable "public-rt-cidr" {
    type = string
    description = "private route table cidr and nat gateway"
  
}

