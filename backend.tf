terraform {
    backend "s3" {
        bucket = "migration-lab-shoaib-tfstates"
        key = "migration-lab/backend/terraform.tfstates"
        region = "us-west-2"
        dynamodb_table = "migration-lab-terraform-lock"
    }
}