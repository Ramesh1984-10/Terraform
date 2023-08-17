variable "alb" {
    type = string
    default =  "OT-Alb"
}

variable "Alb_security_group" {}
variable "public_subnet_ID" {}
variable "vpc" {}
variable "public_subnet_ID-1" {}
variable "taget_group_arn1" {
    type = list (string)
    default = [ "" ]
}

variable "target_id_1" {
    type = string
    default = "" 
  
}

variable "target_id_2" {
    type = string
    default = "" 
  
}

variable "target_id_3" {
    type = string
    default = "" 
  
}

variable "target_id_4" {
    type = string
    default = "" 
  
}





#######################################################################################################
