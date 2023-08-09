vpc_cidr           = "192.168.0.0/16"
public_sub_cidr = "192.168.1.0/24"

az                 = "us-east-1b"

private_sub_cidr = ["192.168.2.0/24"  , "192.168.3.0/24"]
db-private_sub_cidr = "192.168.4.0/24"


subnet_tag = {
  #database      = "Database Subnet"
  application      = "Application Subnet"
  frontend = "Frontend Subnet"
}

public-rt-cidr = "0.0.0.0/0"

# ssh-location = "0.0.0.0/0"


