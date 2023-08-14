resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = var.tenancy
  enable_dns_hostnames = true
  tags = {
    "Name" = var.vpc_tag
  }
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.main.id

  tags = {
    "Name" = var.Igw_tag
  }

}


// Public Subnet Creation

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_sub_cidr
  availability_zone       = var.available_zone
  map_public_ip_on_launch = true

  tags = {
    "Name" = var.public_sub
  }

}

resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_sub_cidr-2
  availability_zone       = var.available_zone2
  tags = {
    Name = "Pub-Sub-1"
  }
}





//Public Route Table creation

resource "aws_route_table" "Public-RT" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = var.public-rt-cidr
    gateway_id = aws_internet_gateway.IGW.id
  }

  tags = {
    Name = var.public_sub_route
  }

}


// Public route table association

resource "aws_route_table_association" "public-RT-Association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.Public-RT.id
}

// Public-1 route table association

resource "aws_route_table_association" "public-RT-Association-1" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.Public-RT.id
}




# Private Frontend subnet creation
resource "aws_subnet" "frontend_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.frontend_sub_cidr
  availability_zone = var.available_zone

  tags = {
    "Name" = var.frontend_sub
  }

}







//Private App Subnets Creation

# Private subnet creation
resource "aws_subnet" "App-Sub" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.App-private_sub_cidr
  availability_zone = var.available_zone
  tags = {
    Name = var.App_sub
  }
}




//App and Frontend Private Route Table creation

resource "aws_route_table" "Private-RT" {
  vpc_id = aws_vpc.main.id
  route {
    nat_gateway_id = aws_nat_gateway.nat.id
    cidr_block     = var.public-rt-cidr
  }

  tags = {
    Name = var.private_sub_route
  }

}


//Private Route table Association


resource "aws_route_table_association" "private-RT-Association" {
  subnet_id = aws_subnet.frontend_subnet.id
  route_table_id = aws_route_table.Private-RT.id

}

//  Private Route table Association


resource "aws_route_table_association" "App-private-RT-Association" {
  subnet_id      = aws_subnet.App-Sub.id
  route_table_id = aws_route_table.Private-RT.id

}



#Creating EIP
resource "aws_eip" "elasticip" {
  domain = "vpc"
  #   tags = {
  #     Name = var.elastic
  #   }
}


# Creating NAT Gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.elasticip.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = var.Nat_Gateway
  }
}


########################################################################################





# Create Route Table and Add Public Route
# terraform aws create route table


# resource "aws_route_table" "Public-RT" {
#   vpc_id = aws_vpc.vpc.id
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.MY_IGW.id

#   }
#   tags = {
#     Name = "Public-route"
#   }
# }


# Associate Public Subnet 1 to "Public Route Table"
# terraform aws associate subnet with route table

# resource "aws_route_table_association" "public-RT-assocation" {
#   count          = length(var.public_subnet_cidrs)
#   subnet_id      = element(aws_subnet.public-subnet-1[*].id, count.index)
#   route_table_id = aws_route_table.Public-RT.id
# }





# # Private subnet creation
# resource "aws_subnet" "private_app" {
#   count  = length(var.private_subnet_app)
#   vpc_id = aws_vpc.main.id
#   #cidr_block        = element(var.private_subnet_app, count.index)
#   cidr_block        = var.private_subnet_app[count.index]
#   availability_zone = element(var.azs, count.index)

#   tags = {
#     Name = "App Subnet ${count.index + 1}"
#   }
# }
