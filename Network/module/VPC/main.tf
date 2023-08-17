resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = var.tenancy
  enable_dns_hostnames = true
  tags = {
    "Name" = var.vpc_name  
    }
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.main.id

  tags = {
    "Name" = "${aws_vpc.main.tags.Name}-${var.Igw_name}"
    
      }

}


// Public Subnet Creation



resource "aws_subnet" "public_subnets" {
  for_each = var.public_subnet_config

  vpc_id     = aws_vpc.main.id
  cidr_block = each.value.cidr_block
  availability_zone = each.value.availability_zone

  map_public_ip_on_launch = true

  tags = {
    Name = "${aws_vpc.main.tags.Name}-${each.key}"
  }
}


resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${aws_vpc.main.tags.Name}-Public_route_table"
  }
  
}



resource "aws_route" "public_route" {
  for_each = "${aws_subnet.public_subnets}"

  route_table_id = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"#var.public_rt_cidr
  gateway_id = aws_internet_gateway.IGW.id

  depends_on = [ aws_subnet.public_subnets ]
  
}




resource "aws_route_table_association" "public_association" {
  for_each = "${aws_subnet.public_subnets}"

  subnet_id      = each.value.id
  route_table_id = aws_route_table.public_route_table.id
}


// Private Subnet Creation


resource "aws_subnet" "private_subnets" {
  for_each = var.private_subnet_config

  vpc_id     = aws_vpc.main.id
  cidr_block = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = {
    Name = "${aws_vpc.main.tags.Name}-${each.key}"
  }
}


resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${aws_vpc.main.tags.Name}-Private_route_table"
  }
  
}



resource "aws_route" "private_route" {
  route_table_id = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"#var.public_rt_cidr
  nat_gateway_id = aws_nat_gateway.nat.id
}




resource "aws_route_table_association" "private_association" {
  for_each = "${aws_subnet.private_subnets}"
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private_route_table.id
}



#Creating EIP
resource "aws_eip" "elasticip" {
  domain = "vpc"
}


#Attach Nat Gateway with 1st Public Subnet


#Creating NAT Gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.elasticip.id
  subnet_id     = aws_subnet.public_subnets["Public_subnet1"].id

  tags = {
    Name = var.Nat_Gateway
  }
}

