CloudFlare DNS Update
---

I built this script to run on a Raspberry Pi at my home to keep a CloudFlare DNS record pointed at my home IP address updated, much the same way one would use a dynamic IP service like DynDNS.

Command-Line or Cron Usage
-----

To run, create a cronjob (mine runs every 4 hours, which is probably too often) to run the following:

`./cf-update-ip <cloudflare email address> <cloudflare API key> <domain> <subdomain>`

E.g. if you wanted to update myhome.mydomain.com you might run:

`./cf-update-ip me@mydomain.com abcdefabcfed123123123123 mydomain.com myhome.mydomain.com`

Portainer Usage
-----

This package includes a Docker image that runs this script once per hour, ideal for running on a Portainer (or other Docker) host to keep your IP address up to date. To install, use the following Docker Compose configuration, either replacing the configuration values in the config or adding corresponding environment variables.

```
services:
  cf-ip:
    image: mccahan/cloudflare-dyndns-update
    environment:
      - EMAIL=${EMAIL}
      - KEY=${KEY}
      - DOMAIN=${DOMAIN}
      - SUBDOMAIN=${SUBDOMAIN}
```

Build and Deploy
-----

```sh
export DOCKER_DEFAULT_PLATFORM=linux/amd64
docker build -t mccahan/cloudflare-dyndns-update:latest .
docker push mccahan/cloudflare-dyndns-update:latest
```
