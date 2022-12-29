data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "node" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.aws_inst_size
  key_name      = var.aws_key_pair
  user_data     = var.cloudinit_config

  subnet_id                   = var.aws_subnet_id
  vpc_security_group_ids      = var.aws_security_groups
  associate_public_ip_address = true

  root_block_device {
    volume_size           = var.aws_inst_vol_size
    volume_type           = var.aws_inst_vol_type
    delete_on_termination = true

    tags = var.tags
  }

  tags = var.tags
}