output "instance_id_Frontend" {
    value = aws_instance.public-ec2.id
  
}

output "instance_id_Salary" {
    value = aws_instance.public-ec2.id
    #value = keys({for net in aws_instance.public-ec2: net.id => net.id})
  
}

output "instance_id_Attendance" {
    value = aws_instance.public-ec2.id
  
}



output "instance_id_Employee" {
    value = aws_instance.public-ec2.id
  
}