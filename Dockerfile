FROM python:3.6.4-alpine3.7

ENV LANG C.UTF-8

COPY packages/twistcli /usr/local/bin/twistcli

RUN apk update && \
    apk add docker nodejs git && \
    pip install requests && \
    npm install codefresh -g && \
    chmod +x /usr/local/bin/twistcli
    addgroup -g 1000 -S twistlock && \
    adduser -u 1000 -S twistlock -G twistlock

USER twistlock

COPY script/twistlock-cli.py /twistlock-cli.py

CMD [""]
