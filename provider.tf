terraform {

  required_version = ">= 1.5.0"

  required_providers {
    discord = {
      source  = "Lucky3028/discord"
      version = "2.2.0"
    }
  }
}

provider "discord" {
  token = var.discord_token
}
