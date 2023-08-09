variable "vpc_cidr" {
    type = string
    description = "main vpc cidr"
    default = "10.0.0.0/16"
  
}
variable "public_sub_cidr" {
    type = string
    default = "10.0.1.0/24"
  
}

variable "private_sub_cidr" {
    type = list(string)
    default = ["10.0.2.0/24"  , "10.0.3.0/24", "10.0.4.0/24"]
  
}

variable "db-private_sub_cidr" {
    type = string
    default = "10.0.4.0/24"
  
}

variable "az" {
    type = string
    default = "us-east-1a"
}

variable "subnet_tag" {
  description = "Define Subnet Names"
  type        = map(string)
  default = {
    application      = "Application Subnet"
    frontend = "Frontend Subnet"
 }
}

variable "route_table_tag" {
  description = "Define route table Names"
  type        = map(string)
  default = {
    database      = "DB-route-table"
    application      = "App-route-table"
 }
}




variable "public-rt-cidr" {
    type = string
    description = "private route table cidr and nat gateway"
    default = "0.0.0.0/0"
}

variable "name-sg" {
  type    = string
  default = "elastic-sg"
}



variable "ports" {
  type = list(number)
  default = [22, 80, 443, 5601 , 9200]

}