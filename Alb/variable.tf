variable "alb" {
    type = string
    default =  "OT-Alb"
}

variable "Alb_security_group" {}
variable "ALB_private_subnet" {}
variable "vpc" {}
variable "ALB_public_subnet" {}
# variable "taget_group_arn1" {
#     type = list (string)
#     default = [ "" ]
# }

variable "target_id_1" {
    type = string
    default = "" 
  
}

variable "target_id_2" {
    default = "" 
  
}

variable "target_id_3" {
    
    default = "" 
  
}

variable "target_id_4" {
    default = "" 
    
  
}


# variable "public_subnet_config" {
#   description = "Configuration for public subnets"
# }



#######################################################################################################
