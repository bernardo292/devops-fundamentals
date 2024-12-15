resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  tags = {
    Name = var.instance_name
  }

  # Optionally, add security group, storage, etc.
  security_group = var.security_group
}