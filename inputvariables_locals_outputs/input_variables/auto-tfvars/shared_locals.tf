locals {
  local_tags = merge(var.default_tags, {
    added_locally = true,
  })

  instance_type = "t3.micro"
}
