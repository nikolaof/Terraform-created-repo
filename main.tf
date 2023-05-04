variable "repo" {
  type = string
  default = "Terraform-created-repo"
}

resource "github_repository" "terraform_homework" {
  name =  var.repo
  description = "This repo is created using Terraform for homework on Terraform"
  visibility = "public"
  auto_init   = true
}

resource "github_branch" "dev" {
  repository = var.repo
  branch     = "dev"
  source_branch = "main"
  depends_on = [
    github_repository.terraform_homework
  ]
}

resource "github_branch_default" "default"{
  repository = var.repo
  branch     = github_branch.dev.branch
}
