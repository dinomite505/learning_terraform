
# Provider with region you want to deploy in

    # default or any other named profile is the one you want to use 
    # to authentificate and interact with AWS resources
    # ~/.aws/credentials to change the access and secret access keys
    # Run `aws configure` command to check if your credentials and region is correct


provider "aws" {
    region     = "eu-central-1"

}
# When you have the same provider multiple times, you have to use the "alias" argument in the configuration
#provider "aws" {
#    profile = "default"
#    region  = "us-east-1"
#    alias = "us"
#}
