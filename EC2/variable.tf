variable "instance_t" {
  description = "Ec2 instance type"
  default = ""
}

variable "associate_public_ip" {
  default = "true"
  
}

variable "key_name1" {
  type = string
  default = ""
  
}


  
variable "security_group_1" {
    type = list(string)
    default = [""]
}


variable "private_security_group" {
  type = string
  default = ""
  
}



variable "server_names" {
  default = [""]
    
}



variable "subnet_id" {
  type = string
  default = ""
}
