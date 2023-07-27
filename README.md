
# Deploying Next.js Application to AWS Amplify using Terraform




## Overview
This project demonstrates how to deploy a Next.js application to AWS Amplify using Terraform. AWS Amplify is a fully managed continuous deployment and hosting service provided by Amazon Web Services. Terraform is an open-source infrastructure as code (IaC) tool that allows you to define and manage your cloud infrastructure in a declarative manner.

## Prerequisites
Before getting started, ensure you have the following prerequisites:

1. AWS Account: You need an AWS account to deploy the application using Amplify.
2. AWS CLI: Install and configure the AWS Command Line Interface on your local machine.
3. Terraform: Install Terraform on your local machine.
4. Next.js Application: Have a Next.js application ready to be deployed.


* Please note that providing access keys and secret keys during the AWS CLI configuration step is necessary to enable Terraform to interact with your AWS account and deploy the infrastructure.


## Getting Started
1. Clone the repository:
https://github.com/Phani9997/react.git

cd terraform-amplify-nextjs

2. Initialize Terraform:
terraform init

3. Deploy the Amplify application:

terraform plan

4. If the plan looks good, apply the changes:

terraform apply

5. Destroying the Infrastructure

terraform destroy



