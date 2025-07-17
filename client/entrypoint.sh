#!/bin/sh
# Replace the placeholder in env.js with the actual backend URL from ConfigMap
sed -i "s|REACT_APP_API_URL|$REACT_APP_API_URL|g" /usr/share/nginx/html/static/js/main*.js
# Start Nginx
nginx -g "daemon off;"