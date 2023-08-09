resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"
    enable_dns_hostnames = true
  tags = {
    "Name" = "MY-VPC"
  }
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.main.id

  tags = {
    "Name" = "MY-IGW"
  }
  
}


// Public Subnet Creation

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.public_sub_cidr
    availability_zone = var.az
     map_public_ip_on_launch = true

     tags = {
       "Name" = "Public Subnet"
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
    Name = "Public-route"
  }
  
}


// Public route table association

resource "aws_route_table_association"  "public-RT-Association" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.Public-RT.id
}




// 2 Private  Subnets Creation

# Private subnet creation
resource "aws_subnet" "private" {
  count  = length(var.subnet_tag)
  vpc_id = aws_vpc.main.id
  #cidr_block        = element(var.private_subnet_frontend, count.index)
  cidr_block        = element(var.private_sub_cidr,count.index)
  availability_zone = var.az
  tags = {
    Name = var.subnet_tag[keys(var.subnet_tag)[count.index]]
  }
}





//App and Frontend Private Route Table creation

resource "aws_route_table" "Private-RT" {
    vpc_id = aws_vpc.main.id
    route {
        nat_gateway_id = aws_nat_gateway.nat.id
        cidr_block = var.public-rt-cidr
    }

    tags = {
    Name = "Private-route"
  }

}


//Private Route table Association


resource "aws_route_table_association" "private-RT-Association" {
    #subnet_id = aws_subnet.private.id
    count = length(var.subnet_tag)
    subnet_id      = aws_subnet.private[count.index].id
    route_table_id = aws_route_table.Private-RT.id
  
}



//Private Database Subnets Creation

# Private subnet creation
resource "aws_subnet" "db-private" {
  vpc_id = aws_vpc.main.id
  #cidr_block        = element(var.private_subnet_frontend, count.index)
  cidr_block        = var.db-private_sub_cidr
  availability_zone = var.az
  tags = {
    Name = "DB-Subnet"
  }
}




//Private Database Route Table creation

resource "aws_route_table" "DB-Private-RT" {
    vpc_id = aws_vpc.main.id
    route {
        nat_gateway_id = aws_nat_gateway.nat.id
        cidr_block = var.public-rt-cidr
    }

    tags = {
    Name = "DB-Private-route"
  }

}

// DB Private Route table Association


resource "aws_route_table_association" "DB-private-RT-Association" {
    subnet_id      = aws_subnet.db-private.id
    route_table_id = aws_route_table.DB-Private-RT.id
  
}



#Creating EIP
resource "aws_eip" "eip-for-Nat-Gateway" {
  vpc = true
}


# Creating NAT Gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip-for-Nat-Gateway.id
  subnet_id     = aws_subnet.public_subnet.id
}


// Create Security Group for Baiston Host 

resource "aws_security_group" "ssh-security-group" {
    name = "Baiston Security Group"
    vpc_id = aws_vpc.main.id

    dynamic "ingress" {
        for_each = [22,80,443]
        iterator = port
        content {
          from_port = port.value
          to_port = port.value
          protocol = "tcp"
          
        }
    }
       
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.public-rt-cidr]
    ipv6_cidr_blocks = ["::/0"]
  }
}