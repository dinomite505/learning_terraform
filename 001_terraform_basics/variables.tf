/* 
variables.tf is for the declaration of variables, name, type, description, default values and additional meta data (found in .tfvars file)

variables.tf is essentially the variable declarations needed to make the module work. More specifically, the variables you want to 
be able to pass into the module for it to work the way you want it to.


EXAMPLE: 
1. Declare your variables in 'variables.tf'

variable "region" {
    type    = string
    default = "us-west-2"
}

variable "instance_type" {
    type    = string
    default = "t2.micro"
}

2. Use those variables in 'main.tf' file for your resources, modules..

# main.tf

provider "aws" {
    region = var.region
}

resource "aws_instance" "example" {
    ami           = "ami-0c55b159cbfafe1f0"
    instance_type = var.instance_type
    # ... other instance configuration ...
}

Create a .tfvars file and set specific values for your variables

# terraform.tfvars

region        = "us-east-1"
instance_type = "t3.micro"



*/

# Defining a variable for a EC2 instance type
# You can then use "t2.micro" or var.instance_type when writing resources
variable "instance_type" {
    description = "Instance type t2.micro"
    type = string
    default = "t2.micro"
}


variable "vpc_name" {
    description = "Name for the VPC"
    type        = string
}

variable "vpc_cidr" {
    description = "CIDR block for the VPC"
    type        = string
}

variable "vpc_tags" {
    description = "Tags for the VPC"
    type        = map(string)
}
