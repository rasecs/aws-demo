# outputs.tf

# 1. Output para ver el ID de la VPC
output "vpc_id_resultado" {
  description = "El ID único asignado por AWS a la VPC"
  value       = aws_vpc.mi_vpc_ejemplo.id
}

# 2. Output para ver el ID de la Subred Pública
output "subnet_publica_id" {
  description = "El ID de la subred pública creada"
  value       = aws_subnet.subnet_publica_ejemplo.id
}

# 3. Output para ver la IP pública (si lanzáramos una instancia, por ejemplo)
# Como ejemplo, mostraremos el ID del Internet Gateway
output "igw_id" {
  description = "El ID del Internet Gateway"
  value       = aws_internet_gateway.igw_ejemplo.id
}