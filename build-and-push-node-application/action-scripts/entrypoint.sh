#!/usr/bin/env sh

###################################################################################################################
# Used on startup of the Docker container
###################################################################################################################

echo "Generating env.js and cleaning up unnecessary files"
python3 /app/generate_env.py > /app/env.js
rm -f /app/generate_env.py /app/env.jinja2

echo "Starting nginx"
/usr/sbin/nginx
