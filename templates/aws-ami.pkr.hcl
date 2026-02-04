packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "aws_access_key" {
  type        = string
  description = "AWS access key ID"
  sensitive   = true
}

variable "aws_secret_key" {
  type        = string
  description = "AWS secret access key"
  sensitive   = true
}

source "amazon-ebs" "ubuntu" {
  ami_name      = "crane-golden-linux-aws-2"
  instance_type = "t4g.micro"
  region        = "us-west-2"
  access_key    = var.aws_access_key
  secret_key    = var.aws_secret_key
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-arm64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}

build {
  name = "crane-golden-image-build"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]
}
