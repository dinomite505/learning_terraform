terraform {
    cloud {
        organization = "cloud505"

        workspaces {
            name = "provisioners"
            }
    }


    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 5.31.0"
        }
    }

    required_version = ">= 1.2.0"

}

provider "aws" {
    region = "eu-central-1"
}

resource "aws_instance" "my_server" {
    ami           = "ami-024f768332f080c5e"
    instance_type = "t2.micro"
    
    tags = {
        Name= "MyServer"
    }
}