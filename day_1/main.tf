provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "DayOne" {
  count = 2
  ami = "ami-03f4878755434977f"
  instance_type = "t2.micro"
  security_groups = ["terraform"]
  tags = {
    Name: "Testing${count.index + 1}"
  }
  key_name = "niser"
  associate_public_ip_address = true
  root_block_device {
    volume_type = "gp2"
    volume_size = "30"
  }
}