output "vpc_id" {
  value = module.vpc.vpc_id
}

output "web_public_ip" {
  value = module.ec2.public_ip
}

output "web_url" {
  value = "http://${module.ec2.public_ip}"
}
