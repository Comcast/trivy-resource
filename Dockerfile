FROM python:alpine3.14
MAINTAINER Hari Prasad

RUN apk update && apk upgrade && \
    apk add --no-cache curl skopeo && \
    pip --no-cache install requests && \
    curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin && \
    apk del curl

COPY assets/ /opt/resource/
