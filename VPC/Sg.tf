// Create Security Group for Baiston Host 

resource "aws_security_group" "ssh-security-group" {
    name = var.name-sg
    vpc_id = aws_vpc.main.id

    dynamic "ingress" {
        for_each = var.ports
        iterator = port
        content {
          from_port = port.value
          to_port = port.value
          protocol = "tcp"
          cidr_blocks = [var.public_rt_cidr]
          
          
        }
    }
       
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.public_rt_cidr]
    ipv6_cidr_blocks = ["::/0"]
  }

   tags = {
    Name = "Baiston SG"
  }
}




resource "aws_security_group" "private-security-group" {
  name        = "Private Security Group"
  description = "Enable SSH access on Port 22"
  vpc_id      = aws_vpc.main.id
  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.public_rt_cidr]
  }
  ingress {
    description = "SSH Access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    #cidr_blocks = [var.public-rt-cidr]
    security_groups = [aws_security_group.Alb-security-group.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.public_rt_cidr]
  }
  tags = {
    Name = "Private Security Group"
  }
}


resource "aws_security_group" "Alb-security-group" {
  name        = "ALB  Security Group"
  description = "Enable http/https access on Port 80/443"
  vpc_id      =  aws_vpc.main.id
  ingress {
    description = "HTTP Access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.public_rt_cidr]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.public_rt_cidr]
  }
  tags = {
    Name = "Alb Security Group"
  }
}