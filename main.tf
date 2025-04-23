terraform {
  backend "s3" {
    bucket = "interns-backstage.io-statefile"
    key    = "project/terraform.tfstate"
    region = "ap-south-1"
  }
}

resource "aws_security_group" "ec2_sg" {
  name        = var.security_group
  description = "Security group for EC2 instance"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.allowed_ports
    content {
      from_port   = tonumber(ingress.value)
      to_port     = tonumber(ingress.value)
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name       = var.security_group
    CreatedBy  = "Backstage"
  }
}

resource "aws_instance" "ec2_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = var.enable_public_ip
  instanceId                  = var.instanceId

  tags = {
    Name       = var.instance_name
    CreatedBy  = "Backstage"
  }
}
