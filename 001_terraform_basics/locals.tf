/* DEFINITION:
    - A local value assigns a name to an expressions so you can use the name multiple times within a module.
    - Used to define intermediate values or calculations within the module's configuration
    - In Terraform, locals blocks allow you to define local variables within your configuration.

    - They are evaluated on the local machine during the teraform execution and are not stored in the state file or shared with 
    remote backedns, meaning they are calculated inside of the configuration and scoped just to their module (locally), Input variables
    on the other hand can be scoped globally.

BENEFITS:
    -Terraform locals can be re-used multiple times in the terraform configuration file.
    - When you use locals within the terraform locals you need to update its value once and it should reflect 
    all over the place where it is referred.

WHERE TO PLACE YOUR LOCAL BLOCKS: 
    - Placing them in locals.tf file or in .tfvars file to make sure where you can find them
    - Placing them in the same file as the resources that are going to reference it 
    (e.g. if you have if you have a bunch of local values that are going to be used for networking and you have a 
    networking.tf file you can put it there so you don't have to go to a different file and manipulate those values)

SYNTAX:
    - declaring with "locals" keyword and then curly braces makes a block
    - the key is going to be the name of the local value (the way you refer to it)
    - within that block you can put key value pairs
    - value can be pretty much anything and complex like a list, a map, a set, a custom object
    - these local variables can then e referenced elswhere in the configuration using the `local.` prefix
    (local. + the name(the key of the key value pair withing your local's block) )
    - you can declare multiple different local blocks as long as they're all in the same directory

USE CASES:
    - if you want to set a consistent metadata tags throughout your entire configuration for resources
    (e.g. create a local value that is a map of tags and then refer to that local value in all the resources
    that need tags. In case you need to update those tags you update them in one place)
    - if you want to create names for all different resources in your configuration
    (e.g. you can set a prefix that submit through a variable and then append whatever name you want to that prefix)


*/