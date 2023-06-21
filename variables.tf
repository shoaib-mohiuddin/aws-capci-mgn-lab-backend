variable "region" {
  description = "AWS Region to work with"
  type        = string
}

# variable "tags" {
#   description = "Tags for the resources"
#   type        = map(string)
# }

variable "state_bucket_name" {
  description = "S3 bucket name to store state files"
  type        = string
}

variable "tf_ddb_table_name" {
  description = "DynamoDB table name to store lock id"
  type        = string
}

variable "kms_alias_name" {
  description = "Alias for KMS customer managed key"
  type        = string
}
