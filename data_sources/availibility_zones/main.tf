data "aws_availability_zones" "all" {
  all_availability_zones = true
}

output "availibility_zones" {
    value = data.aws_availability_zones.all
}