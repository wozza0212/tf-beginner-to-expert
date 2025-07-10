data "aws_ami" "example" {
  most_recent = true
  owners      = ["amazon"]  # Example: Search for AMIs owned by Amazon
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"] # Example: Search for Amazon Linux 2 AMIs
  }
}

output "latest_ami_id" {
  value = data.aws_ami.example.id
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.example.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }

  root_block_device {
    delete_on_termination = true
    volume_size = 10
    volume_type = "gp3"
  }
}
