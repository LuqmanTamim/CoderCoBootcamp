# Terraform 

### What is Terraform?

##### Terraform is an IaC tool used for building. changing and versioning infrastructure safely and efficiently. Terraform allows us to define infrastructure as code which creates an immutable and idempotent infrastructure. Terraform is compatible with many cloud providers and services making it cloud agnostic.

### Difference between TF and other tools such as Ansible and Kubernetes?

##### TF is for provisioning infrastructure and Ansible is used for configuration managment such as patches. Kubernetes on the other hand is used for orchestration so In simple terms how is the infrastructure managed on the cloud provider. The great thing is that all the tools are used together.

### Terraform architecture

### Terraform set up 

##### Installing Terraform 
1. https://developer.hashicorp.com/terraform/install
2. Download according to OS (Windows, MacOS, Linux etc)
##### Authenticating to AWS
1. aws configure on CLI
2. Enter Access Key info

##### Terraform commands - Basic Usage Sequence
1. ``` terraform init ``` Used to initalise the backend
2. ``` terraform plan ``` Used to query AWS API to compare what is currently deployed on AWS versus what we have on the TF script
3. ``` terraform apply ``` Used to apply infrastructure on the cloud provider (AWS)
4. ``` terraform destroy ``` Used to remove the infrastructure that was just provisioned 

##### State File

1. JSON file containing information about every resource and data object provisioned on AWS.
2. Conatins sensitive inof such as passwords so best practice to restrict access
3. Can be stored locally or remotely. Remote backend is best practice to allow many engineers to work on the files together, encrypt the data, and automate through pipelines.

##### Terraform State is the actual state of the infrastructure and Terraform Config is the new desired state of the infrastructure. We can use ``` terraform apply `` to apply this infrastructure.

##### Remote Backend
1. Terraform cloud: In the Terraform script you specify an organisation and worksapce name which allows for users to interact with the backend by applying the foolowing to the script:
``` terraform {
        backend "remote" {
            organisation = "devops-team"

            workspaces {
                name + "terraform-repositry
            }
        }
    }```

2. AWS S3 Bucket: The script must include a S3 bucket for storage of the state file and a DynamoDB for locking from accessing the file if one user is activley working on the file. 