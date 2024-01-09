# Note: Terraform treats multiple .tf files in a directory as one
# You can find all providers and resource type example at Terraform Registry


# Using locals
locals {
    project_name = "Terraform Practice"
}

# EC2 instance resource
resource "aws_instance" "app_server" {
    ami           = "ami-024f768332f080c5e"
    # Input variable
    instance_type = var.instance_type
    # OR instance_type = "t2.micro"
    # VPC and subnet crucial to EC2 creation
    subnet_id = "subnet-08128763d7b03f928"
    tags = {
    # Using string interpolation to insert the local value into the configuration ($ sign followed by curly braces)
    Name = "My_App_Instance-${local.project_name}"
    }
}

/*
MODULES:
A Terraform modules is a collection of reusable Terraform configurations that represent a set of resources or infrastructure
components that can be managed together as a single unit.

Terraform modules typically consist of:

INPUT VARIABLES:
    Input variables are parameters that allow users of the module to provide specific values when they use the module.
    They serve as a way to customize the behavior of the module for different use cases.

RESOURCE DEFINITIONS:
    A module defines the resources it creates or manages, allowing you to encapsulate complex infrastructure
    configurations into rusable components.

LOCAL VALUES (Optional)
    Used to define intermediate values or calculations within the module's configuration. They are named values and they serve the
    purpose of reducing duplication of the same value, increasing code radability. Locals are scoped only within a module (unlike input variables)

DATA SOURCES (Optional)
    Data sources enable you to retrieve information about existing resources or data form external sources

PROVISIONERS (Optional)
    Provisioners are used to execute scripts or commands on resources after they are created or updated. While they can be used
    within a module, it is generally recommended to avoid using provisioners unless there is no other alternative

SUBMODULES (Optional)
    A Terraform module can also include other submodules, allowing for modular composition and reuse. Submodules are nested modules
    within the main module which can be used to create a more granular and flexible component structure

...
*/

# AWS VPC module with Subnets
module "vpc" {
    source = "terraform-aws-modules/vpc/aws"

    name = var.vpc_name
    cidr = var.vpc_cidr

    azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
    private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

    enable_nat_gateway = true
    enable_vpn_gateway = true

    tags = var.vpc_tags
}

# INITIALIZATION:
# This command is typically run whenever you:
    # Start a new Terraform project in a directory.
    # Work in a different Terraform configuration directory for the first time.
    # Introduce new modules in your configuration.
    # Update the version of the Terraform CLI you are using.
# Remember, Terraform configurations are often organized into multiple directories, each representing a separate environment or set of resources. 
# You should run terraform init in each directory that contains its own Terraform configuration to ensure your environment is properly configured.
    # !!Before doing `terraform init` command make sure you're in the correct forlder you want to execute the .tf file!!
# Notice the .terraform.lock.hcl file which gets created after running terraform init. This file records specific versions of modules or providers in use.


# VALIDATION (and FMT):
# Command `terraform fmt` (format) it's there to ensure a standart style accross Terraform files (e.g. indentations)
# Command `terraform validate` checks for the presence of required attributes in Terraform code but might not validate the contents of certain attributes.



# PLAN:
# After Initialization and Validation, you can generate an execution plan that shows what actions Terraform will take to reach the desired state.
# Command `terraform plan` allows you to review the changes before applying them to your infrastructure.
    # You can also use the `-out` option with this command to save that plan.
    # (+) next to the resources means that these will be created upon `apply`


# APPLY:
# If the execution plan looks correct, you can apply the changes to your infrastructure with `terraform apply`.
# Terraform will create, modify or destroy resources as needed to achieve the desired state.
# You can use `terraform apply -auto-approve` to skip the process where you need to enter "yes"

    # Idempotent - if you define something (e.g. resources), and you use `terraform apply` again it won't create new extra resources,
    # but only what you've defined.
    # Every time you run `terraform apply` it is running `validate` to check you configuration
    # (~) next to the resources and (>) between them tells you what is going to be updated (keep it in place and modify it)

# DESTROY:
# The `terraform destroy` command is a convenient way to destroy all remote objects managed by a particular Terraform configuration.
# While you typically don't want to destroy long-living objects in production environment, Terraform is sometimes used to manage
# ephemeral infrastructure for development purposes, so that's why 'destroy' is a good way to clean up those temporary objects once you're done with your work
# You can use:
#   `terraform apply -destroy` - initiates the destruction of the infrastructure defined in your Terraform configuration
#   `terraform plan -destroy` - a speculative destroy plan, to see what the effect of destroying would be
#


/*
Once a resource is created, a terraform.tfstate file will be created definig all resources and properties that were defined in `terraform plan`,
and every time why APPLY new changes, that file will change and define the current state of the infrastructure
*/
# There's also a terraform.tfstate.backup file in case we lose the original file

