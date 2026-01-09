#!/bin/sh
set -e

# Default PORT to 8080 if not set (Cloud Run sets this)
PORT=${PORT:-8080}

# Create a temporary nginx config that uses the PORT variable
cat > /etc/nginx/conf.d/default.conf <<EOF
server {
    listen $PORT default_server;
    listen [::]:\$PORT default_server;
    server_name _;

    root /usr/share/nginx/html;
    index index.html;

    location / {
        try_files \$uri \$uri/ =404;
    }
}
EOF

# Start nginx in foreground
exec nginx -g "daemon off;"
