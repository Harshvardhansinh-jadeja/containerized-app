module "harshvardhan-repo" {
  source = "./modules/ecr"
  name = var.ecr_repo
  force_delete = false
}

# # resource "null_resource" "run_comand_one" {
# #   depends_on = [ module.harshvardhan-repo]
# #   provisioner "local-exec" {
# #     command = "bash ./ecr.sh  ${var.region} ${var.profile} ${var.account_id} ${var.local-image} ${module.harshvardhan-repo.repository_url}"
# #   }
# # }

# # resource "null_resource" "run_comand_one" {
# #   depends_on = [ module.harshvardhan-repo ]
# #   provisioner "local-exec" {
# #     command = <<-EOT
# #        aws ecr get-login-password --region ${var.region} --profile ${var.profile} | docker login --username AWS --password-stdin ${var.account_id}.dkr.ecr.${var.region}.amazonaws.com
# #   EOT
# #   }

# # }


# # resource "null_resource" "run_comand_two" {
# #   depends_on = [null_resource.run_comand_one]

# #   provisioner "local-exec" {
# #     command = <<-EOT
# #       docker build -t ${var.local-image} ../auth
# #   EOT
# #   }
# # }
# # resource "null_resource" "run_comand_three" {
# #   depends_on = [ null_resource.run_comand_two]

# #   provisioner "local-exec" {
# #     command = <<-EOT
# #        docker tag ${var.local-image}:latest ${module.harshvardhan-repo.repository_url}
# #   EOT
# #   }
# # }
# # resource "null_resource" "run_comand_four" {
# #   depends_on = [ null_resource.run_comand_three ]

# #   provisioner "local-exec" {
# #     command = <<-EOT
# #       docker push ${module.harshvardhan-repo.repository_url}
# #        EOT
# #   }
# # }

# # REmove this file if not needed