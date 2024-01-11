
    # Backend can be local or remote
    # backend "local"
    # To migrate from default local workspace to remote
terraform {
    cloud {
        organization = "cloud505"

        workspaces {
            name = "getting-started"
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
