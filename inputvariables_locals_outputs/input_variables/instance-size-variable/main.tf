# Create variable named ec2 instance type that specifies type if ec2 instance
# type string and default to t2.micro

# Add validation to ensure either t2.micro or t3.micro, return error if anything else used

# cReate two addtiional variables for ec2 volume type and ec2 volume size

# create ec2 instance that uses these variables

# To chnge variable in the plan use command 
# terraform plan -var instance_type=t3.4xla 

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

  tags = {
    Name = "using variables"
  }

  root_block_device {
    delete_on_termination = true
    volume_size           = var.volume_size
    volume_type           = var.volume_type
  }
}
