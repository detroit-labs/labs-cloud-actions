FROM nginx:alpine

WORKDIR /app
COPY ./build /app

RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache bash nginx python3 py3-jinja2 && \
    rm -f /var/cache/apk/*.tar.gz && \
    rm -f /var/nginx/cache/*

RUN rm /app/env.js

COPY ./action-scripts/entrypoint.sh /
COPY ./action-scripts/nginx.conf /etc/nginx/nginx.conf
COPY ./action-scripts/env.jinja2 /app
COPY ./action-scripts/generate_env.py /app

EXPOSE 8080
ENTRYPOINT ["/entrypoint.sh"]
