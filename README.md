
CICD JENKINS PIPELINE FOR TERRAFORM:

PREREQUISITES:
	TAKE AWS EC2 INSTANCE (UBUNTU) VM/ ANY OS (REDHAT, LINUX etc..):
•	Install/setup 
	JAVA, JENKINS, TERRAFORM
•	GIVE SUDO PERMISSIONS
•	SETUP AWS CONFIGURATION DETAILS (AWS ACCESS KEY ID AND SECRET ACCESS KEY) IN JENKINS GLOBAL CREDENTIALS (UNDER MANAGE JENKINS SECTION) OR YOU CAN DIRECTLY GIVE THE CREDENTIALS IN JENKINS PIPELINE USING UNDER ENVIRONMENT VARIABLES BLOCK
•	CREATE IAM ROLE AND ATTACH TO EC2 INSTANCE WITH ( NECESSARY ACCESS PREMISSIONS: FOR EXAMPLE- EC2 INSTANCE)


BEFORE INSTALL THE JAVA, TERRAFORM AND JENKINS… 
   THE COMMANDS TO IMPLEMENT ARE:
	Switch to root user 
	Sudo apt-get update- it will update the any packages day-to-day released one’s 
After updating
To install the java:
	Sudo apt install openjdk-17-jdk -y 
@@Java url@@
To install the terraform:
	 wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
	echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
	sudo apt update && sudo apt install terraform
  after installing check for the terraform to be installed or not by the following:
	terraform - - version         
           ##terra url##
To install Jenkins:
This is the Debian package repository of Jenkins to automate installation and upgrade. To use this repository, first add the key to your     system(for the Weekly Release Line):
	sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian/jenkins.io-2023.key
Then add a Jenkins apt repository entry:
	echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
    https://pkg.jenkins.io/debian binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null
Update your local package index, then finally install Jenkins:
	sudo apt-get update
     sudo apt-get install fontconfig openjdk-17-jre
     sudo apt-get install Jenkins
after successful installation of Jenkins, the status of Jenkins showing like this:
	systemctl status jenkins
       @@ jenkins status@@
The default password path for Jenkins is 
	 /var/jenkins_home/secrets/initialAdminPassword
Initialize this path and take the password that is created and login into jenkins using URL(eg:- 34.201.119.151:8080) and then reset the username and password according to your wish 
 Jenkins runs on port 8080, so open the security groups on instance and open the port 8080 for endpoint access of Jenkins .
      @@ security grups@@

Jenkins dashboard:
@@ jenkins dashboard@@


After setup completed, create Jenkins pipeline, before that we need some plugins to be installed as well as some credentials settings to be set:
In manage Jenkins (Plugins) option is there: 1.git
                                                                       2. terraform

@@ jenkins plugins##
We configure/setup the aws credentials on Jenkins, so that Jenkins will know on where and on which platform to access:
  @@ jenkins credentials@@   
We can give the credentials details via through pipeline also using the ENVIRONMENT VARIABLES.
Then
Create a pipeline for terraform infrastructure setup on AWS cloud platform:
                    @@jenkins pileline##
Here I set up the every needed step to setup infra using terraform through the Jenkins pipeline, let’s break the jenkine pipeline in brief:

               GITCHECKOUT: under this stage, we give the github url, where our terraform configuration code is present
                                        Here in my case I used terraform modules approach to create the infra(ec2 instance) 


@@ github terra##
After everything is setup apply and save the pipeline and run the pipeline and you can track the process on console output… if any errors occurred you can track through console output. 
## terra console@@
