terraform {
    # Backend can be local or remote
    # backend "local"
    # To migrate from default local workspace to remote
    backend "remote" {    
        hostname = "app.terraform.io"
        organization = "cloud505"

    workspaces {
        name = "getting-started"
        }
    
}
    required_providers {
    aws = {
        source  = "hashicorp/aws"
        # It is recommended to use the latest version of AWS
        version = "~> 5.31.0"
        }
    }

    # This is the minimum version of Terraform CLI to apply the configuration
    required_version = ">= 1.2.0"
}
