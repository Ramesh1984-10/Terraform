variable "instance_t" {
  description = "Ec2 instance type"
  default     = "t2.micro"
}

variable "public_key1" {
  description = "Public Key Name"
  type        = string
  default     = "RAM"
}


variable "server_tag" {
  description = "Public instance name"
  type        = string
  default     = "Bastion Host"

}



variable "server_tag_1" {
  description = "Salary instance name"
  type        = string
  default     = "Salary"

}


variable "server_tag_2" {
  description = "Employee instance name"
  type        = string
  default     = "Employee"

}


variable "server_tag_3" {
  description = "Attendance instance name"
  type        = string
  default     = "Attendance"

}


variable "server_tag_4" {
  description = "Frontend instance name"
  type        = string
  default     = "Frontend"

}





################################

#VPC variable

variable "vpc_cidr" {
  type        = string
  description = "main vpc cidr"
  default     = "10.0.0.0/16"
}


variable "available_zone" {
  type    = string
  default = "us-east-1a"
}

variable "available_zone2" {
  type    = string
  default = "us-east-1b"
}




variable "tenancy" {
  type    = string
  default = "default"
}

variable "vpc_tag" {
  type    = string
  default = "My-Vpc"

}

variable "Igw_tag" {
  type    = string
  default = "My-Igw"

}


variable "public_sub_cidr" {
  type    = string
  default = "10.0.1.0/24"

}

variable "public_sub_cidr2" {
  type    = string
  default = "10.0.5.0/24"

}


variable "public_sub" {
  type    = string
  default = "Public Subnet"

}


variable "public_sub2" {
  type    = string
  default = "Public Subnet2"

}



variable "frontend_sub" {
  type    = string
  default = "Frontend Subnet"

}



variable "public_sub_route" {
  type    = string
  default = "Public-Route"

}




variable "frontend_sub_cidr" {
  type    = string
  default = "10.0.2.0/24"

}



variable "private_sub_route" {
  type    = string
  default = "Private-Route"

}


variable "App-private_sub_cidr" {
  type    = string
  default = "10.0.4.0/24"

}



variable "App_sub" {
  type    = string
  default = "Application-Subnet"

}




variable "elastic" {
  type    = string
  default = "Elastic-Ip"

}




variable "subnet_tag" {
  description = "Define Subnet Names"
  type        = map(string)
  default = {
    application = "Application Subnet"
    frontend    = "Frontend Subnet"
  }
}

variable "route_table_tag" {
  description = "Define route table Names"
  type        = map(string)
  default = {
    database    = "DB-route-table"
    application = "App-route-table"
  }
}




variable "public-rt-cidr" {
  type        = string
  description = "private route table cidr and nat gateway"
  default     = "0.0.0.0/0"
}

variable "name-sg" {
  type    = string
  default = "elastic-sg"
}



variable "ports" {
  type    = list(number)
  default = [22, 80, 443]

}

variable "Nat_Gateway" {
  type    = string
  default = "Nat"

}

