# data "aws_vpc" "selected" {
#     id = "vpc-00482913dc02d2068"
# }

# output "vpc_tags" {
#     value = data.aws_vpc.selected.tags
# }

# output "vpc_cidr" {
#     value = data.aws_vpc.selected.cidr_block
# }

data "aws_vpc" "default" {
  tags = {
    Name = "default-vpc"
  }
}

output "vpc_cidr" {
  value = data.aws_vpc.default.cidr_block
}

output "vpc_id" {
  value = data.aws_vpc.default.id
}
