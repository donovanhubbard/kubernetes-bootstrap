variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_name" {
  type = string
}

variable "public_subnet_cidr" {
  type = string
}

variable "internet_gateway_name" {
  type = string
}

variable "my_cidr" {
  type        = string
  description = "My ip address in a cidr format"
}