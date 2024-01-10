# Workspaces
- every project comes with the default workspace
- you can use multiple workspaces (e.g. prod, dev) for your project needs adn environments

# Terraform Cloud
- search Terraform Cloud in your web browser
- you can also login with GitHub
- create and account (no credit cards needed)
- create an organization (you will use that name for the remote backend) 
- create a workspace that you will use mentioned above (that name will also go in for remote backend)
    - you will be prompted with 3 choices for you workflow:
    
    **Version Control Workflow:** Great for teams using Git or similar tools. Example: A team of developers collaboratively manages infrastructure code using Git. They commit changes to a shared repository triggering Terraform runs whenever code changes are pushed.

    **CLI-Driven Workflow:** Suited for users comfortable with Terraform's command line. Example: A single developer works on a personal project using Terraform commands directly in their local environment, running terraform apply or terraform plan as needed.

    **API-Driven Workflow:** Ideal for custom integrations and specialized pipelines. Example: A company has a complex CI/CD setup involving multiple tools. They use Terraform Cloud's API to trigger specific workflows, integrating Terraform runs with their custom tooling or pipeline logic.

- we're going to go with the CLI-Driven Workflow
- choose accordingly to your needs
- give your project a name and description and create it

- you will then be sent to that project
- use the the given configuration block for any .tf file where you want to run Terraform

- Use **terraform login** command to authenticate with Terraform Cloud
- With this command Terraform will generate an API token for your user and it will store that token
- Accept and then open given URL to create the token
- Choose the description for it and set the expiration date/time and make sure you save the token for future use
- Copy the token, paste it in your console and confirm with "yes" 
- If successful you will se a Terraform logo with your user


Now, in your console run **terraform init and terraform plan**


In case you have a message like "No value for required variable" for e.g. *variable = "instance_type"* located in your .tfvars file, that is because what is going to be running Terraform is a server that is a part of Terraform cloud, and that run environment is actually executing your code.
    In that case head over to your Terraform Cloud -> Workspaces & Projects -> choose your project -> Variables (on the left side)
    Category of your variables can be:
    *terraform* - e.g. variable = "instance_type" which can also be set as interpolated ( ${} )
    *environment* - e.g. your AWS credentials e.g. AWS_ACCESS_KEY and AWS_SECRET_ACCESS_KEY (you can set them as **sensitive**)

After all is set run **terraform apply**

This will take a minute, but once it's done you should have the complete state of your infrastructure on Terraform Cloud (what is added and what is destroyed). Normally, you can find all that in your *terraform.tfstate.backup* file.

On Terraform Cloud you will see all your runs, errors versions, in real time.


**Complete Workflow**

1. Login into Terraform Cloud 
2. Choose/create Organization
3. Choose/create Workspace
4. Choose your Workflow (CLI-Driven)
5. Choose name and description of the project
6. Back in your console **terraform login** (Generates API Token)
7. Generate new or use existing API Token (Save the token somewhere and Copy/Paste to your console)
8. Confirm with **yes** in the console
9. Run **terraform init** first and then **terraform plan**
10. If everything complies run **terraform apply**
11. Check your state at *State* at your TF Cloud UI
12. Clean up with **terraform destroy**
