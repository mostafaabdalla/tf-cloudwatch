variable "region" {
  type    = string
  default = "us-east-1"
}

variable "default_tags" {
  type = map(string)
  default = {
    "Project"     = "gdc-pcs-1011"
    "ManagedBy"   = "mostafaa.abdallaa@gmail.com"
    "Environment" = "Prod"
  }
}

variable "remedy_map" {
  type    = string
  default = "infra"
}

variable "resource_type" {
  type    = string
  default = "SES"
}

variable "resource_id" {
  type        = string
  default     = "7808359"
}