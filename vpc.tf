variable "aws-region" {
  type        = string  
  description = "Região da AWS"
  default     = "us-east-1"
}

terraform {

  backend "s3" {
    bucket         = "techchallengestate-g27"
    key            = "terraform-vpc/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }

  required_providers {
    
    random = {
      version = "~> 3.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.65"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_default_vpc" "vpcTechChallenge" {
  tags = {
    Name = "Default VPC to Tech Challenge"
  }
}

resource "aws_default_subnet" "subnetTechChallenge" {
  availability_zone = "us-east-1a"

  tags = {
    Name = "Default subnet for us-east-1a to Tech Challenge",
    "kubernetes.io/role/elb" = "1"
  }
}

resource "aws_default_subnet" "subnetTechChallenge2" {
  availability_zone = "us-east-1b"

  tags = {
    Name = "Default subnet for us-east-1b to Tech Challenge",
    "kubernetes.io/role/elb" = "1"
  }
}
