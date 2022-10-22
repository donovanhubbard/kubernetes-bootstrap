variable "ubuntu_version" {
  type        = string
  description = "like `focal-20.04`"
}

variable "instance_size" {
  type = string
}

variable "storage_size" {
  type = number
}

variable "ssh_key_id" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "instances" {
  type = map(any)
}

variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "internet_gateway_name" {
  type = string
}

variable "public_subnet_name" {
  type = string
}

variable "public_subnet_cidr" {
  type = string
}

variable "my_cidr" {
  type = string
}