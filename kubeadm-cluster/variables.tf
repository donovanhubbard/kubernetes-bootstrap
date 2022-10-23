variable "ubuntu_version" {
  type        = string
  description = "like `focal-20.04`"
}

variable "instance_size" {
  type = string
}

variable "storage_size" {
  type        = number
  description = "root block device size in gb"
}

variable "ssh_key_id" {
  type = string
}

variable "ssh_security_group_id" {
  type = string
}

variable "allow_all_local_security_group_id" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "instances" {
  type        = map(any)
  description = ""
}