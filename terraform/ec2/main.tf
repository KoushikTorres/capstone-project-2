resource "aws_instance" "ec2" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [var.security_group_id]
  subnet_id     = var.public_subnet_id
  key_name = "var.key_name"
    tags = {
    Name = var.instance_name
    user_data = var.user_data
  
  }

}