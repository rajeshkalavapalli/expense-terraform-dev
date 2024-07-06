module "bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"
  ami = data.aws_ami.expense.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.bastion_sg_id.value]
  subnet_id              = local.public_subnet_id

  tags = merge(
    var.common_tags,
    {
        Name="${var.project_name}-${var.environment}-bastion"
    }
  )
}