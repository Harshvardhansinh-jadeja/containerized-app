# output "endpoint" {
#   value  = aws_rds_cluster.gen-postgresql.endpoint
# }


output "endpoint" {
  value = aws_db_instance.gen-rds.endpoint
}