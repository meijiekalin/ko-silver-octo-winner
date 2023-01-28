FROM alpine:edge

ARG AUUID="3b683b84-7d26-4a58-a6d3-e5b23ca3797a"
ARG CADDYIndexPage="https://www.free-css.com/assets/files/free-css-templates/download/page187/emmeline.zip"
ARG PORT=8080

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD deploy.sh /deploy.sh
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor unzip wget && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
