# Single ecr repo
resource "aws_ecr_repository" "ecr-repo" {
  name                 = var.ecr_repo_name
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}

# For Multiple ecr repos
resource "aws_ecr_repository" "ecr-repos" {
  count  = length(var.ecr_repo_names)
  name                 = var.ecr_repo_names[count.index]
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}