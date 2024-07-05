module "db" {
  source = "../../expense-terraform-sg"
  project_name = var.project_name
  sg_description = var.sg_description
  environment = var.environment
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = var.common_tags
  sg_name = "db"

}

module "backend" {
  source = "../../expense-terraform-sg"
  project_name = var.project_name
  sg_description = "sg for backend"
  environment = var.environment
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = var.common_tags
  sg_name = "backend"

}

module "frontend" {
  source = "../../expense-terraform-sg"
  project_name = var.project_name
  sg_description = "sg for frontend"
  environment = var.environment
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = var.common_tags
  sg_name = "fronend"

}

# db is accepting connection from backend 
resource "aws_security_group_rule" "db_backend" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  source_security_group_id = module.backend.Sg_id
  security_group_id = module.db.Sg_id
}


#backend is accepting connection from frontend 
resource "aws_security_group_rule" "backend_frontend" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id = module.frontend.Sg_id # from where it accepting 
  security_group_id = module.backend.Sg_id # what we creating 
} 

#backend is accepting connection from frontend 
resource "aws_security_group_rule" "frontend_public" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp" 
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.frontend.Sg_id # what we creating 
} 

