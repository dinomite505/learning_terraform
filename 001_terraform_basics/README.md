# Workspaces
- every project comes with the default workspace
- you can use multiple workspaces (e.g. prod, dev) for your project needs adn environments

# Terraform Cloud
- create and account (no credit cards needed)
- create an organization (you will use that name for the remote backend) 
- create a workspace that you will use mentioned above (that name will also go in for remote backend)
    - you will be prompted with 3 choices for you workflow:
    
    **Version Control Workflow:** Great for teams using Git or similar tools. Example: A team of developers collaboratively manages infrastructure code using Git. They commit changes to a shared repository triggering Terraform runs whenever code changes are pushed.

    **CLI-Driven Workflow:** Suited for users comfortable with Terraform's command line. Example: A single developer works on a personal project using Terraform commands directly in their local environment, running terraform apply or terraform plan as needed.

    **API-Driven Workflow:** Ideal for custom integrations and specialized pipelines. Example: A company has a complex CI/CD setup involving multiple tools. They use Terraform Cloud's API to trigger specific workflows, integrating Terraform runs with their custom tooling or pipeline logic.

- choose accordingly to your needs
- give your project a name and description and create it

- you will then be sent to that project
- use the the given configuration block for any .tf file where you want to run Terraform

