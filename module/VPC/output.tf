output "vpc" {
  value = aws_vpc.main.id
}

output "public_subnet_ID" {
  value = aws_subnet.public_subnet.id
}

output "public_subnet_ID-1" {
  value = aws_subnet.public-subnet-1.id
}






output "Internet_Gateway" {
  value = aws_internet_gateway.IGW.id

}


output "Nat_Gateway" {
  value = aws_nat_gateway.nat.id
}


output "APP_Subnet" {
  value = aws_subnet.App-Sub.id

}

output "Frontend_Subnet" {
  value = aws_subnet.frontend_subnet.id

}

output "security_group" {
  value = aws_security_group.ssh-security-group.id
}

output "private_security_group" {
  value = aws_security_group.private-security-group.id

}

output "frontend_sub_id" {
  value = aws_subnet.frontend_subnet.id

}

output "Alb_security_group" {
  value = aws_security_group.Alb-security-group.id
}