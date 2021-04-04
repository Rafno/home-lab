variable "required_tags" {
  type = map
  default = {
    "environment" = "home-lab",
    "owner" = "Rafnar",
  }
}
variable "USER" {
    description = "USER"
}
variable "PASSWORD" {
    description = "PASSWORD"
}