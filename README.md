# CloudFlare DNS Update

A simple dynamic DNS updater for Cloudflare. Keeps a DNS record pointed at your current public IP address, similar to DynDNS.

## Docker Usage (Recommended)

```yaml
services:
  cloudflare-dns-update:
    image: ghcr.io/mccahan/cloudflare-dns-update:latest
    container_name: cloudflare-dns-update
    restart: unless-stopped
    environment:
      - EMAIL=your-email@example.com
      - KEY=your-cloudflare-api-token
      - DOMAIN=example.com
      - SUBDOMAIN=home.example.com
```

### Authentication

This script supports both authentication methods:

- **API Token (recommended)**: Create a token with `Zone:DNS:Edit` permissions at [Cloudflare API Tokens](https://dash.cloudflare.com/profile/api-tokens)
- **Global API Key (legacy)**: Found at Cloudflare Dashboard → My Profile → API Tokens → Global API Key

The script auto-detects which auth method to use based on the key format.

## Command-Line Usage

```bash
./cf-update-ip <email> <API token/key> <domain> <subdomain>
```

Example:
```bash
./cf-update-ip me@example.com abc123token example.com home.example.com
```

## Cron

The Docker container runs the update script once on startup and then every hour via cron.

## Building

```bash
docker build -t ghcr.io/mccahan/cloudflare-dns-update:latest .
docker push ghcr.io/mccahan/cloudflare-dns-update:latest
```

Or use the GitHub Actions workflow which builds and pushes automatically on push to main/master.
