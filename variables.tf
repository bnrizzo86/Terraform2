variable "counts" {
  default = 1
}

variable "region" {
  default = "us-east-1"
}

variable "account" {
  default = "977013388575"
}

variable "key_name" {
  description = "Private key name to use with instance"
  default     = "dev"
}

variable "instance_type" {
  description = "AWS instance type"
  default     = "t2.micro"
}

variable "ami" {
  description = "Base AMI to launch the instances"

 
  default = "ami-00068cd7555f543d5"
}

