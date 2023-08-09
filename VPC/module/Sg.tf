# // Create Security Group for Baiston Host 

# resource "aws_security_group" "ssh-security-group" {
#     name = "Baiston Security Group"
#     vpc_id = aws_vpc.main.id

#     dynamic "ingress" {
#         for_each = [22,80,443]
#         iterator = port
#         content {
#           from_port = port.value
#           to_port = port.value
#           protocol = "tcp"
          
#         }
#     }
       
#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = [var.public-rt-cidr]
#     ipv6_cidr_blocks = ["::/0"]
#   }
# }

# creating security group
resource "aws_security_group" "allow_tls" {
  vpc_id = var.vpc_cidr
  name        = var.name-sg
  description = "Allow TLS inbound traffic"
  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = [var.public-rt-cidr]
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