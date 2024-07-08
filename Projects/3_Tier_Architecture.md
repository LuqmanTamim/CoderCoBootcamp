# 3 tier architecture using a LAMP stack (Linux, Apache, MySQL, PHP)

### Introduction

##### This project looks to deploy a Dynamic WorPress site onto an EC2 instance using a LAMP stack. The site will be secured due to the configuring of a VPC, Subnet, Security Group, InternetGateway, Route tables creating a highly secure, high performace and scalable WordPress site.

### What is a LAMP stack?

##### A LAMP stack is a group of software, which is open-source, and are installed on an instance. Together they allow the EC2 instance to host a dynamic website and in this case, WordPress. LAMP stands for Linux as the OS, Apacahe for the web server, MySQL for the database and PHP used as a server-side scripting language.

##### The data will be stored in MariaDB databse which will replace MySQL due to it's opensource nature, better performance and increased scalability and security. 

### What is WordPress?

##### WordPress is a open-source content management software (CMS) Which allows users to create, organise and publish content on the web. It is easy to use and integrates well with a LAMP stack.

## Steps for Creating EC2 instance, VPC, Subnet, Security group, Key Pair, Internet Gateway and Route table

### Step 1 - Creating an IAM user

If you already have a IAM user with admin permission thatr you can use than skip to Step 2

1. Login to the console and in the search bar on the top right search IAM
2. On the left tab nagivate to Access managament > Users > Toggle Create user
- Name the user a descriptive name such as "Admin-'YourName'"
- Toggle Next > Attach policies directly, and attch the AdministratorAccess policy
- Toggle Next > Create user
- Login to the user that was just created

### Step 2 - Create a Key Pair

A key pair

1. Navigate to the EC2 console
2. In the left-hand pane Toggle Key Pairs under Network & Security
3. Toggle Create key pair
- Insert a descriptive name such as "WordPress-KeyPair"
- Choose RSA for Key pair type
- Toggle on .pem as we will be using SSH to securely access the EC2 instance (.ppk is for putty use i.e for Windows 10 and lower)
- Toggle Create key pair
- Save the Key pair in a directory that is memorable as we will have tpo access the directory when SSHing into the EC2 instance

### Step 3 - Create a VPC

1. Navigate to the search bar and type and access the VPC console
2. Toggle Create VPC 
3. Configure the settings:
- Toggle VPC only for Resources to Create
- Name the VPC with a descriptive name "WordPress-VPC"
- IPv4 CIDR block: 10.0.0.0/16
- IPv6 CIDR block: No IPv6 CIDR block
- Toggle Create VPC

### Step 4 - Create a Subnet

1. Navigate to the VPC console
2. On the left pane toggle Subnets under Virtual private cloud
3. Toggle Create subnet
4. Configure the settings:
- Select the VPC that was created from the VPC ID drop down list
- Enter a Subnet name such as "WordPress-Subnet"
- Choose any Availability Zone
- To reduce the amount of IP addresses choose the IPv4 subnet CIDR block to be 10.0.0.0/24
- Toggle Create subnet

### Step 5 - Create an Internet Gateway

1. Navigate to the VPC console
2. On the left pane toggle Internet gateways under Virtual private cloud
3. Toggle Create internet gateway
4. Configure the settings:
- Insert a name tag such as "WordPress-IGW"
- Toggle Create internet gateway
- Toggle Actions > Attach to VPC
- Select the VPC that was created and toggle Attach Internet Gateway

### Step 6 - Create a Route Table

1. Navigate to the VPC console
2. On the left pane toggle Route tables under Virtual private cloud
3. Toggle Create route table s
4. Configure the settings:
- Name the Route table such as "WordPress-RT"
- Select the VPC that was created i.e WorPress-VPC
5. Toggle Route table check box
6. Toggle Actions > Edit subnet associations
7. Attach WordPress-Subnet and toggle Save associations
8. Toggle Route table check box
9. Toggle Actions > Edit routes
10. Toggle Add route > Destination > 0.0.0.0/0
11. Toggle Target > Internet Gateway that was created WordPress-IGW
12. Toggle Save changes

### Step 7 - Create a Security Group

Security Group acts as a Firewall at the instance level and will only allow inbound and outbound traffic according to what rules are applied.

1. Access the EC2 console
2. In the left pane under Network & Security toggle Security Groups
3. Toggle Create security group
4. Configure the settings:
- Enter a descriptive name such as "WordPress-EC2-SG"
- For the Description write: Security Group for EC2 instance to host WordPress site
- For VPC attach the VPC that was created WordPress-VPC
5. On inbound rules Toggle add rule:
-  Toggle type > SHH (Port 22) , Source > Anywhere-IPv4, CIDR blocks > 0.0.0.0/0
-  Toggle type > HTTP (Port 80) , Source > Anywhere-IPv4, CIDR blocks > 0.0.0.0/0
-  Toggle type > HTTPS (Port 443) , Source > Anywhere-IPv4, CIDR blocks > 0.0.0.0/0

### Step 8 - Create the EC2 instance

1. Access the EC2 console
2. On the Launch instance section, toggle Launch instance
3. Configure the settings:
- Name the instance WordPress-EC2
- AMI > Amazon Linux (OS)
- Instance type > t2.micro (Free tier eligilble) 
- Key pair > WordPress-KeyPair
- Network settings > Edit , VPC > WordPress-VPC
, Subnet > WordPress-Subnet, Auto-assign public IP > Enable , Firewall (security groups) > Select existing security group > WordPress-EC2-SG
- Toggle Launch instance


## Steps for SHH into EC2 instance