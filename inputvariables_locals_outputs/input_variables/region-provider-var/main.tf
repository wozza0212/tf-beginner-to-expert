
data "aws_ami" "all" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

output "latest_ami_id" {
  value = data.aws_ami.all.id
}



resource "aws_instance" "web" {
  ami           = data.aws_ami.all.id
  instance_type = "t3.micro"

  tags = {
    Name = "Region provider example"
  }

  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp3"
  }
}
