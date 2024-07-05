resource "aws_ssm_parameter" "db" {
  name  = "/${var.project_name}/${var.environment}/db"
  type  = "String"
  value = module.db.Sg_id
}

resource "aws_ssm_parameter" "backend" {
  name  = "/${var.project_name}/${var.environment}/backend"
  type  = "String"
  value = module.backend.Sg_id
}

resource "aws_ssm_parameter" "frontend" {
  name  = "/${var.project_name}/${var.environment}/frontend"
  type  = "String"
  value = module.frontend.Sg_id
}

