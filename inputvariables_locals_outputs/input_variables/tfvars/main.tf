# Using tf vars

#To use dev tf vars use command terraform plan -var-file="dev.terraform.tfvars"
#To use prod tf vars use command terraform plan -var-file="prod.terraform.tfvars"

data "aws_ami" "example" {
  most_recent = true
  owners      = ["amazon"] # Example: Search for AMIs owned by Amazon
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
  instance_type = var.instance_type

  tags = merge(var.default_tags, {
    additional_tags = true
  })

  root_block_device {
    delete_on_termination = true
    volume_size           = var.ec2_volume_config.config.volume_size
    volume_type           = var.ec2_volume_config.config.volume_type
  }

}
