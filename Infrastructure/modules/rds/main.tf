# # This is only RDS instance not cluster's
resource "aws_db_instance" "gen-rds" {
  # depends_on= [aws_db_parameter_group.postgresql_param_group]
  identifier           = var.name
  instance_class       = var.instance_class
  storage_type         = var.storage_type
  engine               = var.engine
  skip_final_snapshot  = var.skip_final_snapshot
  apply_immediately    = var.apply_immediately
  publicly_accessible  = var.public_access
  username             = var.username
  password             = var.password
  db_name              = var.db_name
  allocated_storage    = var.storage
  db_subnet_group_name = var.subnet_grp_name
  tags = {
    "Name" = var.name
  }
  vpc_security_group_ids = var.vpc_sg
}


//turn on logging for cloudwatch logs.
# resource "aws_rds_cluster" "gen-postgresql" {
#   depends_on = [ aws_rds_cluster_parameter_group.postgresql_param_group ]
#   cluster_identifier      = var.name
#   engine                  = "postgres"
#   engine_version          = "15.4"
#   availability_zones      = ["us-west-2a", "us-west-2b", "us-west-2c"]
#   database_name           = "auth"
#   skip_final_snapshot = true
#   master_username         = "Harshvardhansinh"
#   master_password         = "Harshvardhansinh1234$"
#   apply_immediately = true
#   db_cluster_instance_class = "db.m5d.large"
#   allocated_storage = 20
#   vpc_security_group_ids = var.vpc_sg
#   enabled_cloudwatch_logs_exports = [ "postgresql" ]
#   storage_type = "gp3"
#   db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.postgresql_param_group.name
#   # db_cluster_parameter_group_name = aws_rds_cluster_parameter_group
#   # db_instance_parameter_group_name = 
#   db_subnet_group_name = var.subnet_grp_name
#   # engine_mode = "serverless"
#    tags = {
#         "Name" = var.name
#     }
# }

//use db_cluster_parameter_group
//use Updated parameter pgaudit.role to rds_pgaudit with apply method immediate
# resource "aws_db_parameter_group" "postgresql_param_group" {
#   name   = "rds"
#   family = "postgres15"

#   parameter {
#     name  = "log_min_duration_statement"
#     value = 0
#     apply_method = "immediate"
#   }
#   parameter {
#     name  = "log_min_duration_sample"
#     value = 0
#     apply_method = "immediate"
#   }
# }


//add shared_preloaded_library with pgaudit.
//log_statemnet all, role rds_pgaudit
# resource "aws_rds_cluster_parameter_group" "postgresql_param_group" {
#   name   = "rds"
#   family = "postgres15"

#    parameter {
#     name  = "log_min_duration_statement"
#     value = 0
#     apply_method = "immediate"
#   }
# }



# pgaudit.log -> all

# role -> role_pgaudit
# shared_preloaded library -> pgaudit
# extension create role create.
# cloudwatch-> log exports in postgresql log



# WORKING THINGS

# 1. Showing everything query as well as values provided
# log_statement -> all

# 2. showing query but not value which user entered
#    another thing not logged and something about role.
# pgaudit.log -> all 
# shared_preloaded_librari -> yes -> pgaudit

# 3.
# 2. showing query but not value which user entered
# pgaudit.log -> all 
# shared_preloaded_librariyes -> pgaudit
# role -> set


# ROLE is used for LOG:AUDIT 



# SELECT
# gss_authenticated, encrypted
# FROM
# pg_catalog.pg_stat_gssapi
# WHERE pid = pg_backend_pid()",<not logged>
# 2024-03-18 06:57:07 UTC:10.0.2.203(49136):Harshvardhansinh@auth:[1053]:LOG: AUDIT: SESSION,8,1,READ,SELECT,,,"
# SELECT
# roles.oid as id, roles.rolname as name,
# roles.rolsuper as is_superuser,
# CASE WHEN roles.rolsuper THEN true ELSE roles.rolcreaterole END as
# can_create_role,
# CASE WHEN roles.rolsuper THEN true
# ELSE roles.rolcreatedb END as can_create_db,
# CASE WHEN 'pg_signal_backend'=ANY(ARRAY(WITH RECURSIVE cte AS (
# SELECT pg_roles.oid,pg_roles.rolname FROM pg_roles
# WHERE pg_roles.oid = roles.oid
# UNION ALL
# SELECT m.roleid,pgr.rolname FROM cte cte_1
# JOIN pg_auth_members m ON m.member = cte_1.oid
# JOIN pg_roles pgr ON pgr.oid = m.roleid)
# SELECT rolname FROM cte)) THEN True
# ELSE False END as can_signal_backend
# FROM
# pg_catalog.pg_roles as roles
# WHERE
# rolname = current_user",<not logged>
# 2024-03-18 06:57:07 UTC:10.0.2.203(49146):Harshvardhansinh@auth:[1054]:LOG: AUDIT: SESSION,8,1,READ,SELECT,,,"
# SELECT
# roles.oid as id, roles.rolname as name,
# roles.rolsuper as is_superuser,
# CASE WHEN roles.rolsuper THEN true ELSE roles.rolcreaterole END as
# can_create_role,
# CASE WHEN roles.rolsuper THEN true
# ELSE roles.rolcreatedb END as can_create_db,
# CASE WHEN 'pg_signal_backend'=ANY(ARRAY(WITH RECURSIVE cte AS (
# SELECT pg_roles.oid,pg_roles.rolname FROM pg_roles
# WHERE pg_roles.oid = roles.oid
# UNION ALL
# SELECT m.roleid,pgr.rolname FROM cte cte_1
# JOIN pg_auth_members m ON m.member = cte_1.oid
# JOIN pg_roles pgr ON pgr.oid = m.roleid)
# SELECT rolname FROM cte)) THEN True
# ELSE False END as can_signal_backend
# FROM
# pg_catalog.pg_roles as roles
# WHERE
# rolname = current_user",<not logged>
# 2024-03-18 06:57:08 UTC:10.0.2.203(49136):Harshvardhansinh@auth:[1053]:LOG: AUDIT: SESSION,9,1,READ,SELECT,,,"SELECT
# x.oid, pg_catalog.pg_get_userbyid(extowner) AS owner,
# x.extname AS name, n.nspname AS schema,
# x.extrelocatable AS relocatable, x.extversion AS version,
# e.comment
# FROM
# pg_catalog.pg_extension x
# LEFT JOIN pg_catalog.pg_namespace n ON x.extnamespace=n.oid
# JOIN pg_catalog.pg_available_extensions() e(name, default_version, comment) ON x.extname=e.name ORDER BY x.extname
# ",<not logged>