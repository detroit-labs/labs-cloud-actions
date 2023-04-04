FROM nginx:alpine

ARG NGINX_CONFIG_PATH="Missing Required Build Arg: NGINX_CONFIG_PATH"
COPY $NGINX_CONFIG_PATH /etc/nginx/nginx.conf

WORKDIR /app
COPY ./build /app

RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache bash python3 py3-jinja2 && \
    rm -f /var/cache/apk/*.tar.gz && \
    rm -f /var/nginx/cache/*

RUN rm /app/env.js; exit 0

COPY ./action-scripts/entrypoint.sh /
COPY ./action-scripts/env.jinja2 /app
COPY ./action-scripts/generate_env.py /app

EXPOSE 8080
ENTRYPOINT ["/entrypoint.sh"]
