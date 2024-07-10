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
1. Terraform cloud: In the Terraform script you specify an organisation and worksapce name which allows for users to interact with the backend.
2. AWS S3 Bucket: The script must include a S3 bucket for storage of the state file and a DynamoDB for locking access to the file if one user is activley working on the file. Involes a bootstapping process. Bootstrapping in this context refers to the inital set up proccess necessary to prepare the infrastructure before applying the main Terraform configuration
- First we specify the terraform script with no remote backend
- Then specify Versioned and encrypted S3 Bucket along with a DynamoDB table with hash_key = "LockID" to stop multiple user access
- ``` terraform apply ``` which will apply S3 buscket and DynamoDB table
- Now we can change the script and use S3 bucket as specified remote backend and the rest of the configuration is unchanged. Changing the backend from local to remote on AWS S3

##### Script detailing
1. When adding a resource to the script that is not already apart of the infrastructure we use ``` resource ``` as an example: 

```
resource "aws_instance" "EC2_2" {
  ami             = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.instances.name]
  user_data       = <<-EOF
              #!/bin/bash
              echo "Hello, World! I'm Luqman's second instance" > index.html
              python3 -m http.server 8080 &
              EOF
```
2. When reffering to a resource that already exsists such as an exsisting vpc we use ``` data ``` as an example when placing an instance in the default VPC and Subnet: 

```
data "aws_vpc" "default_vpc" {                                    # data block is used to reference an exsisting resource on AWS 
  default = true
}

data "aws_subnet_ids" "default_subnet" {
  vpc_id = data.aws_vpc.default_vpc.id
}
```