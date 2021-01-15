#!/bin/sh -e
#
# Create Certificates for use in Apache httpd
#
certbot certonly -m {{ domain_mail }} --standalone --non-interactive --agree-tos -d {{ site_domain }}
