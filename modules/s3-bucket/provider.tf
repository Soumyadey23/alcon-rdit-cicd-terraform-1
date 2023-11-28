provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {      
      Project     = "${var.project_name}"      
      Environment = "${var.aws_env}"
      AWS_BACKUP = "${var.aws_backup}"
    }
  }
  ignore_tags {
    keys = ["PrincipalId", "Owner"]
  }
}
