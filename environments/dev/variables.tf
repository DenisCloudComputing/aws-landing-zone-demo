
# environments/dev/variables.tf

variable "aws_region" {
  description = "Région AWS pour le déploiement"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nom du projet"
  type        = string
  default     = "landing-zone"
}

variable "environment" {
  description = "Environnement"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "Bloc d'adresses CIDR du VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_type" {
  description = "Taille du serveur EC2"
  type        = string
  default     = "t3.micro"
}