variable "vpc_cidr" {
  description = "main vpc cidr"
  default     = ""
}


variable "available_zone" {
  type    = string
  default = ""
}

variable "available_zone2" {
  type    = string
  default = ""
}


variable "tenancy" {
  default = ""
}

variable "vpc_tag" {
  type    = string
  default = ""

}

variable "Igw_tag" {
  type    = string
  default = ""

}


variable "public_sub_cidr" {
  type    = string
  default = ""

}

variable "public_sub_cidr-2" {
  type    = string
  default = ""

}


variable "public_sub" {
  type    = string
  default = ""

}


variable "public_sub2" {
  type    = string
  default = ""

}


variable "frontend_sub" {
  type    = string
  default = ""

}



variable "public_sub_route" {
  type    = string
  default = ""

}




variable "frontend_sub_cidr" {
  type    = string
  default = ""

}



variable "private_sub_route" {
  type    = string
  default = ""

}


variable "App-private_sub_cidr" {
  type    = string
  default = ""

}



variable "App_sub" {
  type    = string
  default = ""

}



variable "db_route" {
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



variable "subnet_tag" {
  description = "Define Subnet Names"
  default     = "public"
}

variable "route_table_tag" {
  description = "Define route table Names"
  default     = ""
}




variable "public-rt-cidr" {
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