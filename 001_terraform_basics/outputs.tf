/* 
Outputs are a way to expose information about the infrastructure that was created or 
modified during the execution of a Terraform configuration. Outputs allow you to retrieve and display values that 
may be useful for other parts of your infrastructure, external tools, or for manual inspection.

DECLARATION: You can declare outputs using the `output` block (usually in main.tf or outputs.tf)
output "instance_ip" {
    value = aws_instance.example.public_ip
}

USAGE: After applying your Terraform configuration, you can use `terraform output` command to retrieve and display
all the outputs defined in the configuration file.
e.g. $ terraform output instance_ip

INTERPOLATION: The value attribute in the output block supports the same interpolation syntax as resource attributes. 
This allows you to reference attributes from other resources or data sources.
e.g. output "instance_private_ip" {
        value = aws_instance.example.private_ip
    }


NOTE: If you change the output name and use `terraform output` command it will show both old and new output name, so you would
have to use `terraform plan` and `terraform apply` to make the changes official and reduce clutter.
In case `no output` use `terraform refresh` for it to become available.
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