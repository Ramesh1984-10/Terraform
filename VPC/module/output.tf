output "vpc" {
value = aws_vpc.main.id 
}

output "public_subnet_ID" {
   value = aws_subnet.public_subnet.id
}


output "Internet_Gateway" {
   value = aws_internet_gateway.IGW.id
  
}


output "Nat_Gateway" {
   value = aws_nat_gateway.nat.id  
}


output "DB_Subnet" {
   value = aws_subnet.db-private.id
  
}