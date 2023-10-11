FROM python:alpine3.18
MAINTAINER Hari Prasad

COPY assets/ /opt/resource/
COPY --from=aquasec/trivy:latest /usr/local/bin/trivy /usr/local/bin/

RUN apk update && apk upgrade && \
    apk add --no-cache skopeo && \
    pip --no-cache install requests && \
    chmod +x /opt/resource/*

