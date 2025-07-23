variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t2.micro"

  validation {
    condition     = var.instance_type == "t2.micro" || var.instance_type == "t3.micro"
    error_message = "Only supports t2.micro and t3.micro"
  }
}

variable "volume_size" {
  description = "size of instance"
  type        = number
  default     = 10
}

variable "volume_type" {
  description = "tyoe of instance"
  type        = string
  default     = "gp3"
}
