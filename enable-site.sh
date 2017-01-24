#!/bin/bash

if [[ -f /etc/nginx/sites-enabled/$1 ]]; then
    echo "Site $1 already enabled"
else
  if [[ -f /etc/nginx/sites-available/$1 ]]; then
    ln -s /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled/
    sudo systemctl reload nginx
  else
    echo "Could not find site $1"
  fi
fi
