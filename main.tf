# main.tf — Manages channels, category, and invite on EXISTING server


# Create a "General" category
resource "discord_category_channel" "general" {
  name      = "General"
  server_id = var.server_id
  position  = 0
}

# Create a "general" text channel under the category
resource "discord_text_channel" "general" {
  name                   = "general"
  server_id              = var.server_id
  category               = discord_category_channel.general.id
  position               = 0
  sync_perms_with_category = true
}

# Create a permanent invite to the general channel
resource "discord_invite" "permanent" {
  channel_id = discord_text_channel.general.id
  max_age    = 0   # Never expires
  max_uses   = 0   # Unlimited uses
}

# Output the invite link (for easy joining/sharing)
output "invite_link" {
  value       = "https://discord.gg/${discord_invite.permanent.code}"
  description = "Permanent invite to your Terraform-managed server"
}