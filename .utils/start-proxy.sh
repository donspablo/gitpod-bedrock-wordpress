#!/usr/bin/env bash
bash ./.utils/message.sh info "Starting reverse proxy..."
docker rm bedrock-docker-http-proxy
docker run -d --restart=always \
  -v /var/run/docker.sock:/tmp/docker.sock:ro \
  -v ~/.dinghy/certs:/etc/nginx/certs \
  -p 8000:80 -p 4430:443 \
  -p 19322:19322/udp \
  -e DNS_IP=127.0.0.1 \
  -e CONTAINER_NAME=bedrock-docker-http-proxy \
  --name bedrock-docker-http-proxy \
  codekitchen/dinghy-http-proxy