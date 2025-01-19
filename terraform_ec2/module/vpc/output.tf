##

output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpc.id
}


output "publicsubnet1id" {
    description = "The ID of the public subnet"
  value         = aws_subnet.public-subnet-1.id
}

output "privatesubnet2id" {
     description = "The ID of the private subnet"
  value          = aws_subnet.private-subnet-2.id
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.gw.id
}