# discord-terraform-project
My Terraform infrastructure project
 
# Discord Server created & managed with Terraform (2025)

This project creates and fully configures a Discord server using **Terraform** – 100% automatically (except one tiny manual step you do once).

You will end up with:
- A real Discord server
- A "General" category
- A "general" text channel
- A permanent invite link printed in your terminal
- All secrets kept **100% safe** (never uploaded to GitHub)

Perfect for learning Terraform, Infrastructure-as-Code, or automating Discord communities!

## What you need

- Windows 11 (or Windows 10 + WSL2)
- WSL2 with Ubuntu (you already have it!)
- Git + GitHub account
- VS Code with "Remote - WSL" extension (optional but nice)
- A Discord account

## Step-by-step setup (follow exactly)

### 1. Clone this repository
```bash
git clone https://github.com/dquiros44/discord-terraform-project.git
cd discord-terraform-project
2. Create your own Discord bot (2 minutes)

Go to → https://discord.com/developers/applications
Click "New Application" → name it anything (e.g. "Terraform Bot") → Create
Left menu → Bot → Add Bot → Yes, do it!
Click Copy under the bot’s name → this is your bot token (keep it secret!)

3. Create a Discord server manually (30 seconds – only once!)

Open Discord → click the big + on the left sidebar
Choose "Create My Own" → name it → Create
Enable Developer Mode:
Discord Settings → Advanced → turn on Developer Mode

Right-click your new server icon → Copy Server ID → paste it somewhere safe

4. Invite your bot to the server

In Developer Portal → your app → OAuth2 → URL Generator
Scopes → check bot
Bot Permissions → check Administrator (easiest for now)
Copy the generated URL at the bottom
Paste it in your browser → select your server → Authorize

Your bot should now appear in the member list!
5. Add your secrets locally (never goes to GitHub!)
cp terraform.tfvars.example secrets.auto.tfvars
nano secrets.auto.tfvars
Paste your real values:
hcldiscord_token = "MTI3M...paste_your_real_bot_token_here"
server_id     = "123456789012345678"   # ← your real server ID from step 3
Save: Ctrl+O → Enter → Ctrl+X
This file is in .gitignore → 100% safe!
6. Run Terraform – watch the magic!
terraform init
terraform apply -auto-approve
You’ll get output like:
textinvite_link = "https://discord.gg/abc123xyz"
Click it → you’re in your fully automated server!
7. Want to clean up later?
terraform destroy -auto-approve
(Removes channels & invite, keeps the base server)
Project files explained
text├── provider.tf                → uses the Lucky3028/discord provider
├── variables.tf               → defines needed variables
├── main.tf                    → creates category, channel, and invite
├── terraform.tfvars.example   → template (safe to share)
├── secrets.auto.tfvars        → YOUR secrets (never committed!)
└── .gitignore                 → blocks secrets from GitHub
Safety & best practices

Never commit secrets.auto.tfvars or any *.auto.tfvars
Your bot token is like a password – keep it secret!
After everything works, you can reduce the bot’s permissions
Works on any machine – just clone + add your secrets file
