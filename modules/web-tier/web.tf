# Create Load Balancer
resource "aws_lb" "web" {
  name               = "web-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.public.id]
}

# Create Auto Scaling Group
resource "aws_autoscaling_group" "web" {
  launch_configuration = aws_launch_configuration.web.id
  min_size             = 1
  max_size             = 3
  desired_capacity     = 2
  vpc_zone_identifier  = [aws_subnet.public.id]
}

# Create Launch Configuration
resource "aws_launch_configuration" "web" {
  image_id           = "ami-12345678"
  instance_type      = "t2.micro"
  security_groups    = [aws_security_group.web.id]
  associate_public_ip_address = true
  key_name           = "my-key"
}

# Define Security Group
resource "aws_security_group" "web" {
  vpc_id = aws_vpc.testvpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}