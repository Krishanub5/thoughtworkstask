**MediaWiki Deployment in Azure using Terraform**
This project describes the steps for running MediaWiki on Red Hat Linux. It elaborates how to deploy MediaWiki using Terraform in RHEL 8 virtual machine in Azure . 

**Components:**

**thoughworks_mediawiki_azure.tf** - It provides terraform snippet to deploy Azure VM and other resources.
**automate.sh** - This script performs all the activities starting from installing required packages to publish the service.
**apache-config.conf** - This is the configuration file to setup the apache server.

**Prerequisites :**

• You should have Microsoft Azure account.
• Download Terraform into your system and define the path in system environment variables.
   • Installation in Linux: 
        wget https://releases.hashicorp.com/terraform/0.14.0/terraform_0.14.0_darwin_amd64.zip 
        unzip ./ terraform_0.12.2_linux_amd64.zip –d /usr/local/bin 
   • Testing Installation: 
        terraform -v
• Download AzureCLI and install in your system.
        sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
        sudo dnf install -y https://packages.microsoft.com/config/rhel/8/packages-microsoft-prod.rpm
        sudo dnf install azure-cli
        
• Login by executing this command "az login"

• Clone the repository into your local system.
• Run terraform from the terminal
        terraform init
        terraform plan
        terraform apply
        
• Author: Krishanu Bhattacharya (krishanub5@yahoo.com)
