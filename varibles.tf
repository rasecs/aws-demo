# variables.tf

variable "aws_region" {
  description = "La región de AWS donde se desplegarán los recursos."
  type        = string
  # Puedes añadir un valor por defecto si quieres evitar errores futuros:
  default = "us-east-1"
}

# Declaración del CIDR de la VPC
variable "vpc_cidr" {
  description = "El bloque CIDR para la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Declaración del nombre del proyecto (para usar en tags)
variable "project_name" {
  description = "Nombre del proyecto para etiquetado"
  type        = string
  default     = "Proyecto-Demo"
}