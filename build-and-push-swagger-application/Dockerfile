FROM swaggerapi/swagger-ui
VOLUME /tmp
ARG URLS_PRIMARY_NAME
ENV URLS_PRIMARY_NAME=${URLS_PRIMARY_NAME:-"Missing-Primary"}
ARG URLS
ENV URLS=${URLS:-"Missing-URLS"}
COPY ./ /usr/share/nginx/html/spec/