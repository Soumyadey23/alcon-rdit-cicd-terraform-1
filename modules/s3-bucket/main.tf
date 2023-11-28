# Single S3 Bucket
resource "aws_s3_bucket" "s3-bucket" {
  bucket = var.s3_bucket_name
  tags = {    
    Name        = "${var.app_name}"    
  }  
}

resource "aws_s3_bucket_acl" "s3-bucket-acl" {
  bucket = aws_s3_bucket.s3-bucket.id
  acl = "private"
}

resource "aws_s3_bucket_versioning" "s3-bucket-versioning" {
  bucket = aws_s3_bucket.s3-bucket.id
  
  versioning_configuration {
    status = "Enabled"
  }
}


# For Multiple S3 Buckets
resource "aws_s3_bucket" "s3-buckets" {
  count  = length(var.s3_bucket_names)
  bucket = var.s3_bucket_names[count.index]

  tags = {    
    Name        = "${var.app_name}"       
  }  
}

resource "aws_s3_bucket_acl" "s3-buckets-acl" {
  count  = length(var.s3_bucket_names)
  bucket = aws_s3_bucket.s3-buckets[count.index].id
  acl = "private"
}

resource "aws_s3_bucket_versioning" "s3-buckets-versioning" {
  count  = length(var.s3_bucket_names)
  bucket = aws_s3_bucket.s3-buckets[count.index].id
  
  versioning_configuration {
    status = "Enabled"
  }
}
