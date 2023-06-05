region            = "us-west-2"
state_bucket_name = "capci-mgn-lab-tfstates"
tf_ddb_table_name = "terraform-lock-capci-mgn-lab"
kms_alias_name    = "capci-mgn-lab-cmk"
tags = {
  "Project"     = "capci-mgn-lab"
  "Environment" = "Dev"
}