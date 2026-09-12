
# environments/dev/main.tf

# Appel du module VPC
module "vpc" {
  source       = "../../modules/vpc"
  vpc_cidr     = var.vpc_cidr
  project_name = var.project_name
  environment  = var.environment
}

# Appel du module EC2
module "ec2" {
  source        = "../../modules/ec2"
  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.vpc.public_subnet_ids[0] # Utilise le premier subnet public
  instance_type = var.instance_type
  project_name  = var.project_name
  environment   = var.environment
}