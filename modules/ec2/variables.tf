variable "aws_key_pair" {
  description = "AWS Key Pair"
  type        = string
}

variable "aws_subnet_id" {
  description = "AWS Subnet ID"
  type        = string
}

variable "aws_security_groups" {
  description = "AWS Security Groups"
  type        = list(any)
}

variable "cloudinit_config" {
  description = "cloudinit_config to apply to the Control Plane"
  type        = string
}

variable "tags" {
  description = "Tags"
  type        = map(any)
  default     = {}
}

variable "aws_inst_size" {
  description = "EC2 Instance Size"
  type        = string
  default     = "t2.micro"
}

variable "aws_inst_vol_size" {
  description = "EC2 Instance volume size"
  type        = number
  default     = "10"
}

variable "aws_inst_vol_type" {
  description = "EC2 instance volume type"
  type        = string
  default     = "gp3"
}
