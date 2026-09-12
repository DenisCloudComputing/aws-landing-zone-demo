# modules/ec2/main.tf

# Récupère automatiquement la dernière AMI Amazon Linux 2023 officielle
data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

# Groupe de sécurité (Firewall virtuel)
resource "aws_security_group" "web" {
  name        = "${var.project_name}-web-sg"
  description = "Autorise le trafic HTTP et SSH entrant"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP depuis Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH pour administration"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # En production, restreindre à votre IP
  }

  egress {
    description = "Trafic sortant illimité"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-web-sg"
  }
}

# Instance EC2
resource "aws_instance" "web" {
  ami                         = data.aws_ami.amazon_linux_2023.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.web.id]
  associate_public_ip_address = true

  # Script de démarrage automatisé (User Data)
  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y nginx
              systemctl start nginx
              systemctl enable nginx
              echo "Nginx est installé et en cours d'exécution sur l'instance EC2" > /usr/share/nginx/html/index.html
              EOF

  tags = {
    Name = "${var.project_name}-web"
  }
}
    