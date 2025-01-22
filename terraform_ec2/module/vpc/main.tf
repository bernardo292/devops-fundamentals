## VPC

resource "aws_vpc" "main" {
  cidr_block = var.cidr_block_vpc
instance_tenancy = var.instance_tenancy

  tags = {
    Name = var.aws_vpc_name
  }
}

###############

resource "aws_subnet" "public-subnet-1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_block_public_subnet1
  availability_zone = var.bi1
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.vpc-name1}-public-subnet-1"
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_block_public_subnet2
  availability_zone = var.bi2
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.vpc-name2}-public-subnet-2"
  }
}

resource "aws_subnet" "private-subnet-1" {
  vpc_id     = aws_vpc.main.id
  cidr_block =var.cidr_block_private_subnet1
  availability_zone = var.bi1
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.vpc_name1}-private-subnet-1"
  }
}

resource "aws_subnet" "private-subnet-2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_block_private_subnet2
  availability_zone = var.bi2
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.vpc_name2}-private-subnet-2"
  }
}

###############
## Internet  gateway

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.name_igw
  }
}

###############
# Route table

resource "aws_route_table" "route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.cidr_block_route_table
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = var.route_table_name
  }
}

###############
# Route table association

resource "aws_route_table_association" "public-1" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.route.id
}

resource "aws_route_table_association" "public-2" {
  subnet_id     = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.route.id
}

###############
##########################