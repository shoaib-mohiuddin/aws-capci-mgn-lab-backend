variable "region" {
  description = "AWS Region to work with"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
  default     = {}
}