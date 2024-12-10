resource "aws_instance" "instance" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.micro" 

  vpc_security_group_ids = [aws_security_group.instance_sg.id]

  key_name = "your-key-pair-name"

  tags = {
    Name = "bernardo"
  }
}