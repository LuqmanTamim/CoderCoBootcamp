# Terraform 

### What is Terraform?

##### Terraform is an IaC tool used for building. changing and versioning infrastructure safely and efficiently. Terraform allows us to define infrastructure as code which creates an immutable and idempotent infrastructure. Terraform is compatible with many cloud providers and services making it cloud agnostic. Terraform handles the deployment by intercating with cloud API's (application programming interface).

### Benefits of Terraform

1. Speed of Infrastructure Management
2. Low Risk of Human Errors
3. Version Control
4. Easy Collaberation Between Team Members

### Difference between TF and other tools such as Ansible and Kubernetes?

##### TF is for provisioning infrastructure and Ansible is used for configuration managment such as patches. Kubernetes on the other hand is used for orchestration so in simple terms how is the infrastructure managed on the cloud provider. The great thing is that all the tools are used together.

### Terraform architecture

### Terraform set up 

##### Installing Terraform 
1. https://developer.hashicorp.com/terraform/install
2. Download according to OS (Windows, MacOS, Linux etc)
##### Authenticating to AWS
1. aws configure on CLI
2. Enter Access Key info
##### Terraform Documentation
1. AWS TF documentation: https://registry.terraform.io/providers/hashicorp/aws/latest/docs

##### Terraform commands - Basic Usage Sequence
1. ``` terraform init ``` Used to initalise the backend
2. ``` terraform plan ``` Used to query AWS API to compare what is currently deployed on AWS versus what we have on the TF script. This commands also does a terraform refresh command 
3. ``` terraform apply -auto-approve``` Used to apply infrastructure on the cloud provider (AWS), auto approve bypasses the approval stage
4. ``` terraform destroy ``` Used to remove the infrastructure that was just provisioned 
- If you would like to destroy a specific resource such as an ec2 instance you can use 
``` terraform destroy -target aws_instance.myec2 ``` where aws_instance is the resource and myec2 is the local resource name

##### State File

1. JSON file containing information about every resource and data object provisioned on AWS.
2. Conatins sensitive info such as passwords so best practice to restrict access
3. Can be stored locally or remotely. Remote backend is best practice to allow many engineers to work on the files together, encrypt the data, and automate through pipelines.
4. Current state is the current state of the infrastructure and the desired state is what the infrastructure should be

###### Dependancy lock file
The file allows for the locking of a specific version of Terraform

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
3. To make the Terraform configuration cleaner, the script should be divided into sections such as storage, compute etc

### Variables and Outputs

##### Variable Types

Variables can be stored in a seperate file which the main.tf file will use as a refernce.

1. __*Input Variable*__: thought of as input parameters. WE can use variables to store important values in a central place instead of searching for them. If it is a repeated value and we need to change the value we can save time by just chnaging the input value. Used to define the arguments within our resource:

```
variable "instance_type" {
    description - "ec2 instance type"
    type = string
    default = "t2.micro"
}
```
and referenced by syntax: ```var.<name> ```:

```
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.instance_type
}
```

You can also get Terraform to ouput all attributes (data regarding resource found in state file) regarding the resource by outputting the resource itself

```
provider "aws" {
  region = "us-east-1"
}

resource "aws_eip" "lb" {
  domain   = "vpc"
}

output "public-ip" {
  value = aws_eip.lb         # when we do a terraform apply the attributes of the elastic ip will be presented on CLI
}
```

2. __*Local Variable*__:  used to simplify expressions and avoid repetition within a Terraform configuration file. They are primarily for internal use within a module and are not meant to be set from outside the module referenced by ```local.<name> ```:

```
locals {
  instance_count = 3
  instance_type  = "t2.micro"
}

resource "aws_instance" "example" {
  count         = local.instance_count
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = local.instance_type
}

```

3. __*Output Variable*__: used to extract information from your Terraform configurations and display it to the user on the command line. They can also be used to pass values to other modules:

```
output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.example.id
}

output "instance_public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.example.public_ip
}

```
4. Primitive Types:  

- __*string*__: A string is a sequence of characters. Strings are defined using double quotes (") or heredoc syntax for multi-line strings:

```
variable "example_string" {
  type    = string
  default = "Hello, Terraform!"
}

output "example_output" {
  value = var.example_string
}

```
- __*number*__: A number can be an integer or a number with a decimal point (floating point value):

```
variable "example_number" {
  type    = number
  default = 42
}

output "example_output" {
  value = var.example_number
}

```

- __*boolean*__: A boolean is a value that can be either true or false.

5. Sensitive data: sensitive data within the config can be marked as sensitive data by marking the variable as sensitive:

``` sensitive   = true ``` as an example:

```
variable "db_password" {
  description = "The password for the database"
  type        = string
  sensitive   = true
}

```

6. To make the config main.tf script easier to read we can use tfvar files which defines values of variables. For example instead of writting out the long AMI we can define it in tfvar then reference it in the main.tf.

##### Meta-Arguments

1. ``` depends_on ``` depends on specifies that one resource depnds on the other so it enforces the ordering in which resource is created, for example you must create an instance before creating a IAM role for an S3 bucket to access the instance.
2. ``` count ``` allows for multiple creation of resource/module from a single block. Beneficial for multiple identical resources such as provisioning 4 instances
3. ``` for each ```
4. ``` lifecycle ``` used to control terrbehaviour of resources. 
- ``` create_before_destroy ``` can help with zero downtime as terraform provisions a resource before destroying an old one
- ``` ignore_changes ``` prevents terraform from trying to revert metadata set elsewhere
- ``` prevent_destroy ``` the tag can be used to prevent deletion of critical resources in the infrastructure

### Modules

##### What is a module?
Containers for multiple resources that are used together. It is a collection of .tf and also .tf.json files that are kept in 1 directory. 

Modules are the main way to package and reuse resource configurations wit Terraform.

##### Types of Modules 
- root module: Default module containing all .tf files in the main working directory 
- child module: seperate module referred to from a .tf file


### Multiple environment

There are two main approaches: workspaces and file structure.

1. Terraform workspaces allow for managing multiple environments of infrastructure within a single configuration. Commands are as followed:
- ``` terraform workspace new <workspace-name> ```
- ``` terraform workspace select <workspace-name> ```
- ``` terraform workspace list ```
- ``` terraform workspace delete <workspace-name> ```

2. File structure: Isolate components like the stagging, dev, production etc this allows for the isolation of envrionments that dont frequently change from those that change. Example of a file structure:

```
.
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── provider.tf
├── modules/
│   └── vpc/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
└── env/
    ├── dev/
    │   ├── main.tf
    │   ├── variables.tf
    │   ├── outputs.tf
    │   └── terraform.tfvars
    ├── stage/
    │   ├── main.tf
    │   ├── variables.tf
    │   ├── outputs.tf
    │   └── terraform.tfvars
    └── prod/
        ├── main.tf
        ├── variables.tf
        ├── outputs.tf
        └── terraform.tfvars
```

### Testing Terraform code

##### Static checks

1. Built into Terraform binary:
- ``` terraform fmt ``` opininated format of indenting and structure code base etc
- ``` terraform validate ``` checks if code is using correct variables and if the variables are correct. i.e have you used boolean in the correct way 
- ``` terraform plan ``` used to indicate changes needed to config compared with the current infrastructure. Good to run often

2. external check: third party tools for testing checking 

##### Automated testing

1. Bash script
2. Terratest

##### Cross Resource Atrribute Refernces

You can use information from the state file for a resource that is dependant on another resource. Wehen cross referencing the sytax is 
<RESOURCE TYPE>.<NAME>.<ATTRIBUTE> For example if you want to create an Elastic IP and a Security group and allow the Security group to allow traffic from that elastic IP YOU CAN WRITE:

```
resource "aws_eip" "lp" {
  domain  = "vpc"
}

resource "aws_security_group" "allow_tls" {
  name        - "attribute-firewall"
}

resource "aws_security_group_ingress_ruke" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id                # this id is also taken from the state file
  cidr_ipV4         = "${aws_eip.lb.public_ip}/32                    # this will be taken from the state file, 
                                                                     # /32 IS THE CIDR block which must be added
                                                                     # ${} is the string interpolation that terrfaorm uses to get info from state # file
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}
```

w