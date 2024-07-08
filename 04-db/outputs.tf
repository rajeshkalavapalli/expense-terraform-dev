# locals {
#   db_subnet_id = element(split(",", data.aws_ssm_parameter.database_subnet_ids.value), 0)
# }

# output "subnet_id" {
#     value = local.db_subnet_id
#     sensitive = true
# }