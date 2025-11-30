provider "aws" {
  region = var.aws_region # Usa el valor de la variable


}

# In a file named providers.tf or backend.tf referencia s3 config
terraform {
  backend "s3" {
    # Name of the existing S3 bucket to store the state file
    bucket = "s3-demo-ces" 
    
    # Path within the bucket to store the state file aws-state
    key    = "state/terraformdemo.tfstate" 
    
    # Region where the S3 bucket is located
    region = "us-east-1"
    
    # Enable server-side encryption for the state file
    #encrypt = true
    
    # Enable S3 native locking to prevent concurrent operations (recommended since Terraform 1.10)
    use_lockfile = true 
    
    # Alternative legacy locking mechanism using DynamoDB (requires a pre-existing DynamoDB table)
    # dynamodb_table = "terraform-lock-table" 
  }
}


resource "aws_vpc" "mi_vpc_ejemplo" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.project_name}-VPC" # Interpolación de cadenas (mezclar texto y variables)
  }
}

# IMPORTANTE: Aquí está el nombre "subnet_publica_ejemplo" que Terraform no encontraba
resource "aws_subnet" "subnet_publica_ejemplo" {
  vpc_id                  = aws_vpc.mi_vpc_ejemplo.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags                    = { Name = "Subred-Publica-Ejemplo" }
}

# IMPORTANTE: Aquí está el nombre "igw_ejemplo"
resource "aws_internet_gateway" "igw_ejemplo" {
  vpc_id = aws_vpc.mi_vpc_ejemplo.id
  tags   = { Name = "IGW-Ejemplo" }
}