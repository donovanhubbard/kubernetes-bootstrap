
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-${var.ubuntu_version}-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "control_plane" {
  for_each = var.instances

  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_size
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.ssh_security_group_id, var.allow_all_local_security_group_id]
  #user_data                   = file(var.user_data_file_path)
  key_name = var.ssh_key_id

  private_ip = each.value.private_ip

  root_block_device {
    volume_size = var.storage_size
  }

  tags = {
    Name = "${each.value.name}.${var.domain_name}"
  }
}