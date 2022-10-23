module "kubeadm-cluster" {
  source = "./kubeadm-cluster"

  ubuntu_version                    = var.ubuntu_version
  instance_size                     = var.instance_size
  storage_size                      = var.storage_size
  subnet_id                         = module.network.public_subnet_id
  ssh_security_group_id             = module.network.ssh_security_group_id
  allow_all_local_security_group_id = module.network.allow_local_security_group_id
  ssh_key_id                        = var.ssh_key_id
  domain_name                       = var.domain_name

  instances = var.instances
}

module "network" {
  source = "./network"

  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr

  internet_gateway_name = var.internet_gateway_name

  public_subnet_name = var.public_subnet_name
  public_subnet_cidr = var.public_subnet_cidr

  my_cidr = var.my_cidr
}