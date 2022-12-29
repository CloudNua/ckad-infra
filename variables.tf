variable "profile" {
  description = "Profile name for AWS provider authentication."
  type        = string
}

variable "region" {
  description = "Default region for AWS provider."
  type        = string
}

variable "aws_access_key" {
  description = "AWS access key."
  type        = string
}

variable "aws_secret_key" {
  description = "AWS secret key."
  type        = string
}

variable "lab_solution_url" {
  description = "URL to the lab solution archive."
  type        = string
}

variable "lab_solution_username" {
  description = "Username to access the lab solution archive."
  type        = string
}

variable "lab_solution_password" {
  description = "Password to access the lab solution archive."
  type        = string
}

variable "enable_registry" {
  description = "Whether or not to automatically configure a local registry (Lab 3.2)"
  type        = bool
  default     = false
}

variable "vpc_cidr" {
  description = "AWS VPC cidr range"
  type        = string
}

variable "subnet_cidr" {
  description = "AWS Subnet cidr range"
  type        = string
}

variable "subnet_az" {
  description = "AWS Subent availability zone"
  type        = string
}

variable "ec2_instance_type" {
  description = "EC2 instance size"
  type        = string
}

variable "ec2_vol_size" {
  description = "EC2 instance volume size"
  type        = number
}

variable "ec2_vol_type" {
  description = "EC2 instance volume type"
  type        = string
}