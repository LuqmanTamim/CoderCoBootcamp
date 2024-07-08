# 3 tier architecture using a LAMP stack (Linux, Apache, MySQL, PHP)

### Introduction

##### This project looks to deploy a Dynamic WorPress site onto an EC2 instance using a LAMP stack. The site will be secured due to the configuring of a VPC, Subnet, Security Group, InternetGateway, Route tables creating a highly secure, high performace and scalable WordPress site.

### What is a LAMP stack?

##### A LAMP stack is a group of software, which is open-source, and are installed on an instance. Together they allow the EC2 instance to host a dynamic website and in this case, WordPress. LAMP stands for Linux as the OS, Apacahe for the web server, MySQL for the database and PHP used as a server-side scripting language.

##### The data will be stored in MariaDB databse which will replace MySQL due to it's opensource nature, better performance and increased scalability and security. 

### What is WordPress?

##### WordPress is a open-source content management software (CMS) Which allows users to create, organise and publish content on the web. It is easy to use and integrates well with a LAMP stack.

## Steps 

### Step 1 - Creating an IAM user

If you already have a IAM user with admin permission thatr you can use than skip to Step 2

- Login to the console and in the search bar on the top right search IAM
- On the left tab nagivate to Access managament > Users > Toggle Create user
- Name the user
- Toggle Next > Attach policies directly, and attch the AdministratorAccess policy
- Toggle Next > Create user
- Login to the user that was just created

### Step 2 - Create a Key Pair

- Navigate to the EC2 console
- In the left-hand pane Toggle Key Pairs under Network & Security
- Toggle Create key pair
- Insert a descriptive name such as "WordPress-KeyPair"
- Choose RSA for Key pair type
- Toggle on .pem as we will be using SSH to securely access the EC2 instance (.ppk is for putty use i.e for Windows 10 and lower)
- Toggle Create key pair
- Save the Key pair in a directory that is memorable as we will have tpo access the directory when SSHing into the EC2 instance

