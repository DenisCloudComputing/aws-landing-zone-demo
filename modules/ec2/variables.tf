
# modules/ec2/variables.tf

variable "vpc_id" {
  description = "ID du VPC ou déployer l'instance"
  type        = string
}

variable "subnet_id" {
  description = "ID du subnet pour l'instance"
  type        = string
}

variable "instance_type" {
  description = "Taille de l'instance EC2"
  type        = string
  default     = "t3.micro"
}

variable "project_name" {
  description = "Nom du projet"
  type        = string
}

variable "environment" {
  description = "Environnement"
  type        = string
}