output "repository_url" {
  value = aws_ecr_repository.gen-repo.repository_url
}

output "repo_name" {
  value = aws_ecr_repository.gen-repo.name
}