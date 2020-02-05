FROM alpine:3.7

RUN apk add mysql-client bash jq

COPY dump /usr/local/bin/dump
RUN chmod 755 /usr/local/bin/dump
COPY targets /targets

ENTRYPOINT 'dump'
