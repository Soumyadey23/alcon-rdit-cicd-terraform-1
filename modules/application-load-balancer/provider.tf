provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      Org         = "${var.org_name}"
      Team        = "${var.team_name}"
      Project     = "${var.project_name}"
      Environment = "${var.aws_env}"
    }
  }
  ignore_tags {
    keys = ["PrincipalId", "Owner"]
  }

}
