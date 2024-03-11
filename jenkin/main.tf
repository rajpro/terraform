provider "aws" {
  region = var.region
}


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "jenkinMaster" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  key_name = "niser"

  security_groups = [ "JenkinSecurity" ]

  associate_public_ip_address = true

  root_block_device {
    volume_size = "30"
    volume_type = "gp2"
  }

  tags = {
    Name = "JenkinMaster"
  }
}

resource "aws_instance" "jenkinNode" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  key_name = "niser"

  security_groups = [ "JenkinSecurity" ]

  associate_public_ip_address = true

  root_block_device {
    volume_size = "30"
    volume_type = "gp2"
  }

  tags = {
    Name = "JenkinNode"
  }
}