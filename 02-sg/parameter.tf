resource "aws_ssm_parameter" "db" {
  name  = "/${var.project_name}/${var.environment}/db"
  type  = "String"
  value = module.db.Sg_id
}

resource "aws_ssm_parameter" "backend_sg_id" {
  name  = "/${var.project_name}/${var.environment}/backend_sg_id"
  type  = "String"
  value = module.backend.Sg_id
}

resource "aws_ssm_parameter" "frontend_sg_id" {
  name  = "/${var.project_name}/${var.environment}/frontend_sg_id"
  type  = "String"
  value = module.frontend.Sg_id
}

resource "aws_ssm_parameter" "bastion_sg_id" {
  name  = "/${var.project_name}/${var.environment}/bastion_sg_id"
  type  = "String"
  value = module.bastion.Sg_id
}

resource "aws_ssm_parameter" "ansible_sg-id" {
  name  = "/${var.project_name}/${var.environment}/ansible_sg_id"
  type  = "String"
  value = module.ansible.Sg_id
}