# You can use `terraform output` command to retrieve and display all the outputs defined in the configuration file
# In case `no output` use `terraform refresh` for it to become available
/* 
If you change the output name and use `terraform output` command it will show both old and new output name, so you would
have to use `terraform plan` and `terraform apply` to make the changes official and reduce clutter
*/


# Using output value to display the public IP address of EC2 instance
output "public_ip" {
    # You can also add the description argument to inform the module user what is contained in the output
    description = "The public IP of the app_server"
    value = aws_instance.app_server.public_ip
}


output "vpc_id" {
    description = "VPC ID of app_server"
    value = module.vpc.vpc_id
}

output "public_subnets" {
    description = "Public subnets ID of app_server VPC"
    value = module.vpc.public_subnets
}