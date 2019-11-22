provider "random" {
  version = "~> 2.0"
}

provider "template" {
  version = "~> 2.0"
}

# Use AWS Terraform provider
provider "aws" {
  version             = "~> 2.1"
  region              = "${var.region}"
  allowed_account_ids = ["${var.aws_account_id}"]
}

terraform {
  backend "s3" {
    # this key must be unique for each layer!
    bucket     = "terraform-pipeline-dev"
    key        = "terraform-pipeline.tfstate"
    region  = "us-east-1"
    encrypt = "true"
  }
}

# Create EC2 instance
resource "aws_instance" "default" {
  ami                    = "${var.ami}"
  count                  = "${var.counts}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${aws_security_group.default.id}"]
  source_dest_check      = false
  instance_type          = "${var.instance_type}"

  
}

# Create Security Group for EC2
resource "aws_security_group" "default" {
  name = "terraform-default-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
