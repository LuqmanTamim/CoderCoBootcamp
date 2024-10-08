# End-to-End Automation for a Python App

### This project looks to create the build and deploy stages of a CI/CD pipeline by containerising a python application, pushing an images to Elastic container registry, and deploy the image to EC2, allowing for quick deployment, management and scaling.

##### The project utilises
- AWS
- ECR
- EC2
- CDK
- IAM
- Python
- Docker
- VS Code
- Powershell
- YAML  


### Creating the Python app

VS Code was used as the IDE as it supports many programming languages and the UI is very easy to interact with.

1. First start by creating a directory to store our files
 ```
 mkdir python-image
```  

2. Then we create a python image and call it app.py

3. We can now populate the python file with 
 ```
 print("Hello World! I'm Luqman, nice to meet you. This is my first image :)")
```

4. The file should be saved using Ctrl s

5. Now we create a Docker file and name it Dockerfile

6. The Dockerfile must be built using `FROM`, `WORKDIR`, `COPY`, and `CMD` instructions
```
FROM python
WORKDIR /app
COPY . /app
CMD ["python3","app.py"]
```
`FROM`  specifies the base image to use for the Docker image that is being built   
`WORKDIR`  sets the working directory. In our case the working directory does not exsist but `WORKDIR` creates it  
`COPY`  copies the file and directory from the host machine to the filesystem of the container at the specified path. This is used to include application code and other necessary files in the Docker image 
`RUN` executes commands in a new layer on top of the current image and commit the results. It is used to install software packages and dependencies, configure the environment, and set up the image for later use.  
`CMD`  specifies the default command to run when a container is started from the image.
