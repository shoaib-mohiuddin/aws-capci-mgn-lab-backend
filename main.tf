# S3 Bucket
resource "aws_s3_bucket" "state_file_bucket" {
  bucket = "migration-lab-shoaib-tfstates"

  tags = var.tags

  lifecycle {
    prevent_destroy = true
  }
}

# Bucket versioning
resource "aws_s3_bucket_versioning" "version_my_bucket" {
  bucket = aws_s3_bucket.state_file_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Bucket SSE
resource "aws_s3_bucket_server_side_encryption_configuration" "sse_cmk" {
  bucket = aws_s3_bucket.state_file_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.kms_cmk.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

# KMS CMK
resource "aws_kms_key" "kms_cmk" {
  description = "This key is used to encrypt bucket objects"
  tags        = var.tags
}

# Alias for KMs CMK
resource "aws_kms_alias" "cmk-alias" {
  name          = "alias/migration-lab-cmk"
  target_key_id = aws_kms_key.kms_cmk.key_id
}

# DynamoDB table store state lock
resource "aws_dynamodb_table" "terraform_lock_tbl" {
  name           = "migration-lab-terraform-lock"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = var.tags
}