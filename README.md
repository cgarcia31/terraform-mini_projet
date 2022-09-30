# terraform-mini_projet
* Verify if your amazon user can create ec2 and ebs

## Step 1
* Go to the directory app
* Modify the project_name in terraform.tfvars
* Modify the parameters of the modules in main.tf

## Step 2
* terraform init
* terraform apply --auto-approve

## Step 3 
* Get the IP output at the end of the apply command
* Go to http://IP

## Step 4
* Destroy your project
* terraform destroy --auto-approve

