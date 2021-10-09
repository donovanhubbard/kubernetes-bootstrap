

resource "aws_instance" "control_plane" {
  ami                         = var.base_ami_id
  instance_type               = var.instance_size
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  security_groups             = var.security_group_ids
  user_data                   = file(var.user_data_file_path)
  key_name                    = var.ssh_key_name

  private_ip = var.control_plane_ip

  root_block_device {
    volume_size = var.storage_size
  }

  tags = {
    Name = "${var.control_plane_host_name}.${var.domain_name}"
  }
}

resource "aws_instance" "worker1" {
  ami                         = var.base_ami_id
  instance_type               = var.instance_size
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  security_groups             = var.security_group_ids
  user_data                   = file(var.user_data_file_path)
  key_name                    = var.ssh_key_name

  private_ip = var.worker1_ip

  root_block_device {
    volume_size = var.storage_size
  }

  tags = {
    Name = "${var.worker1_host_name}.${var.domain_name}"
  }
}

resource "aws_instance" "worker2" {
  ami                         = var.base_ami_id
  instance_type               = var.instance_size
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  security_groups             = var.security_group_ids
  user_data                   = file(var.user_data_file_path)
  key_name                    = var.ssh_key_name

  private_ip = var.worker2_ip

  root_block_device {
    volume_size = var.storage_size
  }

  tags = {
    Name = "${var.worker2_host_name}.${var.domain_name}"
  }
}
