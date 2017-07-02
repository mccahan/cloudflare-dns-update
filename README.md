CloudFlare DNS Update
---

I built this script to run on a Raspberry Pi at my home to keep a CloudFlare DNS record pointed at my home IP address updated, much the same way one would use a dynamic IP service like DynDNS.

Usage
-----

To run, create a cronjob (mine runs every 4 hours, which is probably too often) to run the following:

`./cf-update-ip <cloudflare email address> <cloudflare API key> <domain> <subdomain>`

E.g. if you wanted to update myhome.mydomain.com you might run:

`./cf-update-ip me@mydomain.com abcdefabcfed123123123123 mydomain.com myhome.mydomain.com`
