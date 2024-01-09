terraform {
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

# Provider with region you want to deploy in
provider "aws" {
    # default or any other named profile is the one you want to use 
    # to authentificate and interact with AWS resources
    # ~/.aws/credentials to change the access and secret access keys
    # Run `aws configure` command to check if your credentials and region is correct
    profile = "default"
    region  = "eu-central-1"
}

# When you have the same provider multiple times, you have to use the "alias" argument in the configuration
#provider "aws" {
#    profile = "default"
#    region  = "us-east-1"
#    alias = "us"
#}
