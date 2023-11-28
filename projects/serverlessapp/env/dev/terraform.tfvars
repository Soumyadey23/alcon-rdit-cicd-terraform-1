# provider and general info
aws_region      = "us-east-1"
aws_env         = "dev"
org_name        = "alcon"
team_name       = "rdit"
project_name    = "mlops"
app_name        = "serverlessapp"
aws_backup      = "Enabled"

# s3 bucket info
#Single S3 Bucket Variable with Actual Name
s3_bucket_name  =  "alcon-rdit-serverlessapp-frontend1-dev-us-east-1"

#Multiple S3 Buckets Variable with Actual Name
s3_bucket_names  =  ["alcon-rdit-serverlessapp-frontend2-dev-us-east-1", "alcon-rdit-serverlessapp-frontend3-dev-us-east-1"]

# ECR repository Info
#Single ECR repository with Actual Name
ecr_repo_name  =  "serverlessapp-repo-dev-1"

#Multiple ECR repositories with Actual Name
ecr_repo_names  =  ["serverlessapp-repo-dev-2", "serverlessapp-repo-dev-3"]