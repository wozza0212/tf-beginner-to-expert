variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "instance type"
}

variable "ec2_volume_config" {
  type = map(object({
    volume_size = number
    volume_type = string
  }))

  # default = {
  #   config = {
  #     volume_size = 10
  #     volume_type = "gp3"
  # } }

}

variable "default_tags" {
  type = map(string)

}
