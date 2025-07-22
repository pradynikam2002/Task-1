provider "aws" {
  region = "us-east-2"
}

resource "aws_key_pair" "strapi_key" {
  key_name   = "strapi-key"
  public_key = file("${path.module}/strapi-key.pub")
}

resource "aws_security_group" "pradyumnasg" {
  name        = "pradyumnasg"
  description = "Allow HTTP and SSH"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "pradyumna-instance" {
  ami           = "ami-05fb0b8c1424f266b" # Ubuntu 22.04 us-east-2
  instance_type = "t2.micro"
  key_name      = aws_key_pair.strapi_key.key_name
  security_groups = [aws_security_group.pradyumnasg.name]

  user_data = file("${path.module}/setup.sh")

  tags = {
    Name = "pradyumna-instance"
  }
}

# Test trigger for GitHub Actions CD workflow
