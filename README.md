# Discord Server Managed with Terraform

This project uses **Terraform** to automatically create and configure a Discord server (channels, roles, categories, invite links, etc.).

It's a complete Infrastructure-as-Code example for Discord – perfect for learning Terraform or automating community servers.

## Features
- Creates categories, text/voice channels, roles
- Generates a permanent invite link
- Fully idempotent (run multiple times safely – no duplicates after initial import)
- Secrets kept 100% local (never uploaded to GitHub)

## Prerequisites
- Git
- Terraform (v1.5+ recommended)
- A Discord account
- (Optional) Azure DevOps for CI/CD automation

## Local Setup (Run on Your Machine)

### 1. Clone the repository
```bash
git clone https://github.com/your-username/discord-terraform-project.git
cd discord-terraform-project

2. Create a Discord Bot

Go to https://discord.com/developers/applications
New Application → name it → Create
Left menu → Bot → Add Bot → Yes, do it!
Copy the token under the bot's username (this is your bot token – keep it secret!)

3. Create a Discord Server

In Discord, click the + icon on the left sidebar → Create My Own → name it → Create
Enable Developer Mode: Settings → Advanced → Developer Mode
Right-click the server icon → Copy Server ID → save it

4. Invite the Bot to Your Server

In Developer Portal → your app → OAuth2 > URL Generator
Scopes → check bot
Bot Permissions → check Administrator (or minimal needed permissions)
Copy the generated URL → open in browser → select your server → Authorize

5. Add Your Secrets Locally (Safe – Never Committed)

cp terraform.tfvars.example secrets.auto.tfvars
nano secrets.auto.tfvars  # or use your favorite editor

Paste your values:

discord_token = "YOUR_BOT_TOKEN_HERE"
server_id     = "YOUR_SERVER_ID_HERE"

secrets.auto.tfvars is in .gitignore → it will never be uploaded to GitHub.

6. Run Terraform
terraform init
terraform plan    # Preview changes
terraform apply   # Type "yes" when prompted (or -auto-approve for non-interactive)

Output will include an invite link – click it to join your automated server!

7. Clean Up (Optional)
terraform destroy

Optional: Full CI/CD with Azure DevOps
This repo includes an azure-pipelines.yml for automated testing and deployment using Azure DevOps.
Overview of the Automation Flow

Push to dev branch → pipeline runs on self-hosted agent
Terraform applies changes to a test Discord server (using separate test variables)
Manual approval step (email notification)
On approval → automatically merges dev into main

Setting Up Azure DevOps (High-Level Steps)

Create an Azure DevOps project and repo
Mirror this GitHub repo to Azure Repos
Set up a self-hosted agent (Linux recommended)
Create a variable group DiscordTerraformSecrets with:
GUILD_ID_TEST (test server ID)
DISCORD_BOT_TOKEN_TEST (test bot token – can be same bot)

Create an environment named TestApproval with manual approval
Grant pipeline permissions to:
Agent pool (Default or your pool)
Environment (TestApproval)
Repository contribute permission for the build service

Commit azure-pipelines.yml → pipeline auto-creates/triggers

Detailed setup commands are available in project documentation (internal notes), but the YAML is ready to use.

Project Structure

├── provider.tf              → Discord provider configuration
├── variables.tf             → Input variables
├── main.tf                  → Discord resources (channels, roles, etc.)
├── azure-pipelines.yml      → CI/CD pipeline (test → approve → merge)
├── terraform.tfvars.example → Template for local secrets
├── secrets.auto.tfvars      → Your local secrets (gitignored)
└── .gitignore               → Protects secrets

Safety Notes

Never commit secrets.auto.tfvars or any file containing tokens/server IDs
Use minimal bot permissions in production
For true idempotency: import existing resources once with terraform import

Enjoy your fully automated Discord server! 🚀


Copy the entire content above (including the code block) and save it as `README.md` in your repository. It's completely free of any private tokens, URLs, IDs, or personal details.

