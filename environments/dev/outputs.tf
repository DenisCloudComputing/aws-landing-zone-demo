
# environments/dev/outputs.tf

output "vpc_id" {
  description = "ID du VPC dev"
  value       = module.vpc.vpc_id
}

output "web_public_ip" {
  description = "Adresse IP publique du serveur web Nginx"
  value       = module.ec2.instance_public_ip
}