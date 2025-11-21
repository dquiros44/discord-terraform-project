# variables.tf
# Input: Your server's ID from Step 1
variable "server_id" {
  type        = string
  description = "ID of the existing Discord server to manage"
  # Example: "123456789012345678"
}

variable "discord_token" {
  type      = string
  sensitive = true
}

variable "server_name" {
  type    = string
  default = "My Terraform Server"
}