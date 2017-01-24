#!/bin/bash

if [[ -f /etc/nginx/sites-enabled/$1 ]]; then
    unlink /etc/nginx/sites-enabled/$1
    sudo systemctl reload nginx
else
    echo "Site $1 is not enabled"
fi
