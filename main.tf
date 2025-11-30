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