# Create VPC
resource "aws_vpc" "testvpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
}

# Create Public Subnet
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.testvpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
}

# Create Private Subnet
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.testvpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"
}

# Create Internet Gateway
resource "aws_internet_gateway" "testgw" {
  vpc_id = aws_vpc.testvpc.id
}

# Create Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.testvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.testgw.id
  }
}