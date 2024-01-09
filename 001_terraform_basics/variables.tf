/* 
variables.tf is for the declaration of variables, name, type, description, default values and additional meta data.

variables.tf is essentially the variable declarations needed to make the module work. More specifically, the variables you want to 
be able to pass into the module for it to work the way you want it to.

EXAMPLE: 

variable "region" {
    description = "AWS region"
    type        = string
}

variable "instance_type" {
    description = "Type of EC2 instance"
    type        = string
}


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
