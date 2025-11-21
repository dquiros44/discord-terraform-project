# variables.tf
variable "discord_token" {
  type      = string
  sensitive = true
}

variable "server_name" {
  type    = string
  default = "My Terraform Server"
}