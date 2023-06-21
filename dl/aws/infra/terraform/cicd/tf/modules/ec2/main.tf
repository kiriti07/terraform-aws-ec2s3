
resource "aws_vpc" "example" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_security_group" "example" {
  name        = var.security_group_name
  description = "Example Security Group"

  vpc_id = aws_vpc.example.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_launch_template" "example" {
  name          = "example-launch-template"
  image_id      = "ami-xxxxxxxx"
  instance_type = var.instance_type

  network_interfaces {
    device_index         = 0
    subnet_id            = aws_vpc.example.default_subnet_id
    associate_public_ip  = true
    security_group_ids   = [aws_security_group.example.id]
  }
}

resource "aws_instance" "example" {

  launch_template {
    id      = aws_launch_template.example.id
    version = "$Latest"
  }
  
  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name      = "example-key"
  subnet_id     = aws_vpc.example.default_subnet_id

  vpc_security_group_ids = [aws_security_group.example.id]

  user_data = <<-EOF
    #!/bin/bash
    echo "Instance created!"
  EOF
}

output "instance_ip" {
  value = aws_instance.example.public_ip
}

