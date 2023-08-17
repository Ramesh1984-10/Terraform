// Create a new EC2 launch configuration in PUBLIC subnet

resource "aws_instance" "public-ec2" {
  #ami                         = "ami-053b0d53c279acc90"
  ami                         = data.aws_ami.Latest_Image.id
  key_name                    = var.key_name1
  instance_type               = var.instance_t
  associate_public_ip_address = var.associate_public_ip
  subnet_id     =  var.subnet_id
  vpc_security_group_ids = var.security_group_1
  tags = {
    Name = var.server_names
  }

}



#   connection {
#       type        = "ssh"
#       user        = "ec2-user"
#       private_key = file("./${var.key_name}")
#       host        = self.public_ip
#     }

 
 
 
#   provisioner "file" {
#     source      = "./${var.key_name}"
#     destination = "/home/ec2-user/${var.key_name}"
   
#   }
#   provisioner "remote-exec" {
#     inline = ["chmod 400 ~/${var.key_name}", "sudo mkdir /tmp/ramesh"]

#   }
#   lifecycle {
#     create_before_destroy = true
#   }
#   tags = {
#     "Name" = "Bastion-Host"
#   }

# }









//Create a new EC2 launch configuration in Private subnet

# resource "aws_instance" "App_private-ec2" {
#   ami                    = data.aws_ami.Latest_Image.id
#   key_name               = var.key_name
#   instance_type          = var.instance_t
#   count = length(var.server_tag)
 
#   subnet_id              = var.private_sub_id
#   //subnet_id     = aws_subnet.private[count.index % length(aws_subnet.private)].id
#   vpc_security_group_ids = [var.private_security_group]

#   tags = {
#      Name =  var.server_tag[keys(var.server_tag)[count.index]]
#   }
# }



# resource "aws_instance" "Db_private-ec2" {
#   ami                    = data.aws_ami.amzlinux2.id
#   key_name               = var.key_name
#   instance_type          = var.instance_t
#   subnet_id              = aws_subnet.App2_private_ap_south_1b.id
#   vpc_security_group_ids = [aws_security_group.frontend-SG.id]
#   lifecycle {
#     create_before_destroy = true
#   }
#   tags = {
#      Name = "DB_instance"
#   }
# }
