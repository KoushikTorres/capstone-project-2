variable "ami_id" {
  default = "ami-0261755bbcb8c4a84"
}

variable "instance_type" {
  default = "t2.small"
}
variable "vpc_id" {
  type = string
}
variable "security_group_id" {
  type = string
}
variable "public_subnet_id" {
  type = string
}
variable "instance_count" {
  default = 1
}
variable "instance_name" {
  type = string
}
variable "user_data" {
  type = string
  default = null
}

variable "key_name" {
  type = string
  default = "web-apps"
}
