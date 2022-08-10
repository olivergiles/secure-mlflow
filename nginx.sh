#!/bin/bash -x
envsubst '${PORT}' < /app/nginx.conf.template > /etc/nginx/nginx.conf

htpasswd -b -c /etc/nginx/.htpasswd ${MLFLOW_TRACKING_USERNAME} ${MLFLOW_TRACKING_PASSWORD}

exec nginx -g "daemon off;"
