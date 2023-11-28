# RDIT Terraform Modules Repository

[Terraform](https://www.terraform.io/docs) is a tool for building, changing, and versioning infrastructure safely and efficiently. Terraform can manage existing and popular service providers as well as custom in-house solutions for RDIT.  
This is a collection of Terraform scripts and modules to build aws resources for different projects which can be used with
[Jenkins Pipelines](https://jenkins.io/doc/book/pipeline/)

  - **Technology stack**: Written in Hashicorp Terraform.
  - **Status**: This repo is intended to be an ongoing effort to collect useful Terraform scripts to build AWS resources for Alcon RDIT.


## Configuration

### Repository directory structure-
```
+ root
  + ci                      - Directory contains Continues Integration configuration with Jenkins.
    + Jenkinsfile           - Jenkinsfile respected to project.
    + parameter.properties  - Parameter properties for Jenkins with keys and values required for Terraform CLI execution.
  + modules                 - Directory contains Terraform Modules created to reuse as per projects requirements.
  + projects                - Directory contains Project files to use Terraform modules as per need in different projects.
    + sample-project        - Root directory for a Project.
      + env                 - Directory to maintain terraform project configuration for different environments
        + dev               - Directory as per Environment name.
          + backend.tf      - Terraform state management backend configuration file. 
          + terraform.tf    - Terraform variable and values as per projects requirements.
      + scripts             - Directory to keep shell/python or other scripts used to configure instances.
      + main.tf             - Terraform main.tf file with configuration of modules required for this project.
      + output.tf           - Terraform output.tf file to print/use output values of AWS resources.
      + variable.tf         - Terraform default variable file.
      + provider.tf         - Terraform file to set provider, for example - AWS.
```

### Jenkins as CI-
Jenkins Pipeline is an automation solution that lets you create simple or complex (template) pipelines via the DSL used in each pipeline. Jenkins provides two ways of developing a pipeline- Scripted and Declarative.  
We use declarative pipeline here as this pipelines provide a simplified and more friendly syntax with specific statements for defining them, without needing to learn much Groovy.  

#### Using Jenkins Shared Library variables:
The declarative way to include Shared Libraries marked Load implicitly allows Pipelines to immediately use classes or global variables defined by any such libraries. To access other shared libraries, the Jenkinsfile needs to use the @Library annotation, specifying the library’s name with branch. As following example:
```
@Library('sc_ppl_anyos_jenkins_rss_asc@dev') _
```
More information on [this Jenkins Documentations](https://www.jenkins.io/doc/book/pipeline/shared-libraries/#using-libraries)

#### Using parameters through properties file:
[.properties file](https://en.wikipedia.org/wiki/.properties) is one of the data formats for storing configuration and settings data in software projects.  

This file contains all parameters required to configure Jenkins and Terraform CLI environment to execute Terraform projects using modules with respect of multibranch strategy on different AWS account with respective environments as poc, dev, qa and prod. There will be just one file for all the environment.  

The file read in Jenkinsfile using readProperties and location should be updated in Jenkins file as following-
```
node ('cloud-rdit-mlops-linux') {
    props = readProperties (file: "ci/sharedlib/tf/parameter.properties")
}
```

### Terraform Modules-
A module is a container for multiple resources that can be used together or individually. [Modules](https://www.terraform.io/language/modules/develop) can be used to create lightweight abstractions, so that you can describe your infrastructure in terms of its architecture, rather than directly in terms of physical objects.  

#### Module List:

1. [ec2-instance](modules/ec2-instance/main.tf)
2. [security-group](modules/security-group/main.tf)
3. [load-balancer](modules/load-balancer/main.tf)


### Usage with Projects-

1. [main.tf](projects/sample-project/main.tf) : sample-project is implementation of terraform modules as per particular project requirements. This file is the main terraform file where modules are defined as following:
```
module "ec2_module" {
  source            = "../../modules/ec2-instance"
  user_data         = file("./scripts/user-data.sh")
  org_name          = var.org_name
  ...
  vpc_sg_ids        = [module.ec2_sg_module.sg_id]
}

module "ec2_sg_module" {
  source          = "../../modules/security-group"
  ...
  primary_vpc_id   = var.primary_vpc_id
}
```
We can create multiple modules just by referring modules directory location in source as in above snippet. We can also use modules with another module using output resource values predefined in modules.


2. [terraform.tfvars](projects/sample-project/env/poc/terraform.tfvars) : These file contains Parameters for terraform modules in key/value pairs. Job override all the required parameters in templates and keep default if something is not there. Though there will be diffrent terraform.tfvars for different AWS environments(poc, dev, qa and prod).  
This file should be located in "\${WORKSPACE}/projects/<project-name>/env/\${DEPLOY_PARAM_ENV}/terraform.tfvars".  

### How to execute terraform from local-
Your local machine should have [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) and [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) installed and configured with your [AWS account credentials](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys).  

1. Initialize the terraform:  
```
terraform init -input=false -no-color -reconfigure -backend-config=env/${DEPLOY_ENV}/backend.tf
```
DEVPLOY_ENV should be poc, dev, qa, prod as per environment name.  

2. Validate you configuration if required:
```
terraform validate -no-color
```

3. Create terraform plan to review and execute later:
```
terraform plan ${ACTION} -input=false -no-color -out tfplan -var-file=env/${DEPLOY_ENV}/terraform.tfvars
```
ACTION can be `blank` for apply and `destroy` for destroy as per requirements.    
DEVPLOY_ENV should be poc, dev, qa, prod as per environment name.

4. Apply above create plan to AWS:
```
terraform apply -input=false -no-color tfplan
```
Note: This step will create or delete resources as per plan creatred at step 3.


### Development and Maintenance-
For all your questions and suggession please contact - [Shekar Meduri](SHEKAR.MEDURI@Alcon.com) or [Yogesh Dhote](YogeshKumar.Dhote@Alcon.com)
