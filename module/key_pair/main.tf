// Dynamically created SSH key pair

resource "tls_private_key" "Tkey" {
  algorithm = "RSA"
}

resource "aws_key_pair" "Public_key" {
  key_name   =  var.key_name
  public_key = tls_private_key.Tkey.public_key_openssh
}

resource "local_file" "TF_key" {
  content = tls_private_key.Tkey.private_key_pem
  #sensitive_content = tls_private_key.key.private_key_pem
  filename        = "Tkey2"
  #file_permission = "0400"
}
