# 1. create variable ec2_volume_config, which contains volume type and volume type if root block device for ec2 instance
# Create variable additional_tags, which alows the user to define additional tags on instance
# Update ec2 intsance configuration to leverage new variables

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

  tags = var.default_tags

  root_block_device {
    delete_on_termination = true
    volume_size           = var.ec2_volume_config.config.volume_size
    volume_type           = var.ec2_volume_config.config.volume_type
  }

}
