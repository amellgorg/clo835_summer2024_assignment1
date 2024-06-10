provider "aws" {
  region = "us-east-1"
}

resource "aws_ecr_repository" "app" {
  name = "my-app"
}

resource "aws_ecr_repository" "mysql" {
  name = "my-mysql"
}

resource "aws_instance" "web" {
  ami           = "ami-00beae93a2d981137" # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  subnet_id     = "subnet-0d6a1bde47cd469e4"
  security_groups = ["sg-0b639413230df0642"]

  tags = {
    Name = "WebAppInstance"
  }
}

output "instance_public_ip" {
  value = aws_instance.web.public_ip
}
