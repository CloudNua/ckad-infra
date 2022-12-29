# Network Requirements:
# - Don’t use 192.168 network for nodes
# - No firewall

# System Requirements
# - 2 CPU
# - 8G memory
# - 20G+ disk on control plane node
# - Disable swap
# - Disable SELinux and AppArmor

module "base" {
  source = "./modules/base"

  aws_vpc_cidr        = var.vpc_cidr
  aws_vpc_subnet_cidr = var.subnet_cidr
  aws_vpc_az_zone     = var.subnet_az
}

module "worker_node" {
  source = "./modules/ec2"

  aws_key_pair        = aws_key_pair.key.id
  aws_security_groups = [module.base.security_group_id]
  aws_subnet_id       = module.base.subnet_id
  cloudinit_config    = data.cloudinit_config.workerNode.rendered

  aws_inst_size     = var.ec2_instance_type
  aws_inst_vol_size = var.ec2_vol_size
  aws_inst_vol_type = var.ec2_vol_type

  tags = {
    Name = "workerNode"
  }
}

module "control_plane" {
  source = "./modules/ec2"

  aws_key_pair        = aws_key_pair.key.id
  aws_security_groups = [module.base.security_group_id]
  aws_subnet_id       = module.base.subnet_id
  cloudinit_config    = data.cloudinit_config.controlPlane.rendered

  aws_inst_size     = var.ec2_instance_type
  aws_inst_vol_size = var.ec2_vol_size
  aws_inst_vol_type = var.ec2_vol_type

  tags = {
    Name = "controlPlane"
  }

  depends_on = [module.worker_node]
}