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

variable "security_group_ids" {
  type = list(string)
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