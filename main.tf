# main.tf – Manages Discord server: roles, voice channels, category, text channel, invite, permissions
# ═══════════════════════════════════════════════════════════
# NEW: "canales de texto" category at the very top + 3 text channelss
# ═══════════════════════════════════════════════════════════
resource "discord_category_channel" "text_channels" {
  name      = "canales de texto"
  server_id = var.server_id
  position  = 1                     # forces it to the topp
}

resource "discord_text_channel" "busco" {
  name      = "busco"
  server_id = var.server_id
  category  = discord_category_channel.text_channels.id
  position  = 0
  topic     = "Pacha se para"
}

resource "discord_text_channel" "pareja" {
  name      = "pareja"
  server_id = var.server_id
  category  = discord_category_channel.text_channels.id
  position  = 1
  topic     = "pasen ig"
}

resource "discord_text_channel" "uwu" {
  name      = "uwu"
  server_id = var.server_id
  category  = discord_category_channel.text_channels.id
  position  = 2
  topic     = "el ultimo que se sale es gay"
}


# Existing "General" category (for organization)
resource "discord_category_channel" "general" {
  name      = "General"
  server_id = var.server_id
  position  = 3
}

# Existing "general" text channel (under category)
resource "discord_text_channel" "general" {
  name                   = "general"
  server_id              = var.server_id
  category               = discord_category_channel.general.id
  position               = 0
  sync_perms_with_category = true
}

# Permanent invite to the general text channel
resource "discord_invite" "permanent" {
  channel_id = discord_text_channel.general.id
  max_age    = 0   # never expires
  max_uses   = 0   # unlimited
}

# Output the invite link
output "invite_link" {
  value       = "https://discord.gg/${discord_invite.permanent.code}"
  description = "Permanent invite to your Terraform-managed server"
}

# === 10 Custom Roles (colors as decimal RGB numbers) ===
# Admin role (full admin powers)
resource "discord_role" "admin" {
  name         = "Admin"
  color        = 16711680  # #FF0000 Red
  permissions  = 2147483647  # Administrator (full access)
  server_id    = var.server_id
  hoist        = true  # Show role in member list
  mentionable  = true
}

# Him role
resource "discord_role" "him" {
  name         = "Him"
  color        = 65280  # #00FF00 Green
  permissions  = 1048576  # Basic: Read messages, connect, speak
  server_id    = var.server_id
  hoist        = true
  mentionable  = true
}

# Piedrera role
resource "discord_role" "piedrera" {
  name         = "Piedrera"
  color        = 255  # #0000FF Blue
  permissions  = 1048576
  server_id    = var.server_id
  hoist        = true
  mentionable  = true
}

# Nero role
resource "discord_role" "nero" {
  name         = "Nero"
  color        = 65535  # #FFFF00 Yellow
  permissions  = 1048576
  server_id    = var.server_id
  hoist        = true
  mentionable  = true
}

# Cock Big? role
resource "discord_role" "cock_big" {
  name         = "Cock Big?"
  color        = 16711935  # #FF00FF Magenta
  permissions  = 1048576
  server_id    = var.server_id
  hoist        = true
  mentionable  = true
}

# Dealer role
resource "discord_role" "dealer" {
  name         = "Dealer"
  color        = 16776960  # #00FFFF Cyan (aqua)
  permissions  = 1048576
  server_id    = var.server_id
  hoist        = true
  mentionable  = true
}

# Papu role
resource "discord_role" "papu" {
  name         = "Papu"
  color        = 16753920  # #FFA500 Orange
  permissions  = 1048576
  server_id    = var.server_id
  hoist        = true
  mentionable  = true
}

# Pot Dealer role
resource "discord_role" "pot_dealer" {
  name         = "Pot Dealer"
  color        = 8388736  # #800080 Purple
  permissions  = 1048576
  server_id    = var.server_id
  hoist        = true
  mentionable  = true
}

# Grim's Side Hoe role
resource "discord_role" "grims_side_hoe" {
  name         = "Grim's Side Hoe"
  color        = 8421504  # #808080 Gray
  permissions  = 1048576
  server_id    = var.server_id
  hoist        = true
  mentionable  = true
}

# OG role
resource "discord_role" "og" {
  name         = "OG"
  color        = 15132390  # #FFD700 Gold
  permissions  = 1048576
  server_id    = var.server_id
  hoist        = true
  mentionable  = true
}

# === 6 Voice Channels (under General category) ===
# Adminss – PRIVATE: Only Admin role can view/connect
resource "discord_voice_channel" "adminss" {
  name      = "Adminss"
  server_id = var.server_id
  category  = discord_category_channel.general.id
  position  = 1
  bitrate   = 64000  # Standard bitrate
  user_limit = 99  # Almost unlimited
}

# femboy team – Open to all
resource "discord_voice_channel" "femboy_team" {
  name      = "femboy team"
  server_id = var.server_id
  category  = discord_category_channel.general.id
  position  = 2
  bitrate   = 64000
  user_limit = 99
}

# tilin – Open to alls
resource "discord_voice_channel" "tilin" {
  name      = "tilin"
  server_id = var.server_id
  category  = discord_category_channel.general.id
  position  = 3
  bitrate   = 64000
  user_limit = 99
}

# papu channel – Open to all
resource "discord_voice_channel" "papu_channel" {
  name      = "papu channel"
  server_id = var.server_id
  category  = discord_category_channel.general.id
  position  = 4
  bitrate   = 64000
  user_limit = 99
}

# MPGA 2025 – Open to all
resource "discord_voice_channel" "mpga_2025" {
  name      = "MPGA 2025"
  server_id = var.server_id
  category  = discord_category_channel.general.id
  position  = 5
  bitrate   = 64000
  user_limit = 99
}

# gay-team – Open to all
resource "discord_voice_channel" "gay_team" {
  name      = "gay-team"
  server_id = var.server_id
  category  = discord_category_channel.general.id
  position  = 6
  bitrate   = 64000
  user_limit = 99
}

# === Private Permissions for Adminss Voice Channel ===
# Deny VIEW_CHANNEL to @everyone (hide from non-admins)
resource "discord_channel_permission" "adminss_everyone_deny" {
  channel_id   = discord_voice_channel.adminss.id
  overwrite_id = var.server_id  # @everyone = server ID
  type         = "role"
  deny         = 1024  # VIEW_CHANNEL bitmask
  depends_on   = [discord_voice_channel.adminss]
}

# Allow full voice access to Admin role
resource "discord_channel_permission" "adminss_admin_allow" {
  channel_id   = discord_voice_channel.adminss.id
  overwrite_id = discord_role.admin.id
  type         = "role"
  allow        = 3501760  # VIEW_CHANNEL (1024) + CONNECT (1048576) + SPEAK (2097152) + USE_VAD (33554432) + PRIORITY_SPEAKER (256)
  depends_on   = [discord_voice_channel.adminss, discord_role.admin]
}

##========>> AQUI TERMINA EL main.tf <<========##

