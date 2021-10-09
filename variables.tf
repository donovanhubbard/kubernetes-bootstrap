variable "domain_name" {
  type = string
}
variable "hosted_zone_id" {
  type = string
}

variable "base_ami_id" {
  type = string
}
variable "instance_size" {
  type = string
}
variable "subnet_id" {
  type = string
}
variable "storage_size" {
  type = number
}
variable "security_group_ids" {
  type = list(string)
}
variable "user_data_file_path" {
  type = string
}
variable "ssh_key_name" {
  type = string
}


# Instance specific values
variable "control_plane_host_name" {
  type = string
}
variable "control_plane_ip" {
  type = string
}

variable "worker1_host_name" {
  type = string
}
variable "worker1_ip" {
  type = string
}

variable "worker2_host_name" {
  type = string
}
variable "worker2_ip" {
  type = string
}