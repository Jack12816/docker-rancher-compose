# Set base image.
FROM alpine:latest

MAINTAINER Dominik Hahn <dominik@monostream.com>

# Define rancher-compose version
ENV RANCHER_COMPOSE_VERSION=v0.12.5

# Install dependencies and rancher-compose
RUN apk add --quiet --no-cache ca-certificates curl unzip && \
    curl -sSl https://s3-eu-west-1.amazonaws.com/jack12816/public/pastes/rancher-compose-patch-250-sysctls-linux-amd64 > /usr/local/bin/rancher-compose && \
    chmod +x /usr/local/bin/rancher-compose && \
    rm -rf /var/cache/apk/*

# Set working directory
WORKDIR /workspace

# Copy upgrade script
COPY ["upgrade.sh", "./"]

# Executing defaults
CMD ["/bin/sh"]
