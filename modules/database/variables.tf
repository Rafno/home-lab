variable "name" {
  description = "Name to be used on all the resources as identifier"
  default     = ""
}

variable "resource_group_name" {
  description = "input resource group"
  default     = "rafnar-sandbox"
}

variable "location" {
  description = "input resource group"
  default     = "rafnar-sandbox"
}

variable "required_tags" {
  type = map
  default = {
    "environment" = "home-lab",
    "owner" = "Rafnar",
  }
}

variable "user" {
    description = ""
}
variable "pass" {
    description = ""
}