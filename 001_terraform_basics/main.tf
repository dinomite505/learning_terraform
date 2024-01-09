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
