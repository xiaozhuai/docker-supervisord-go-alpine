FROM golang:alpine AS builder

ENV GO111MODULE on
ENV CGO_ENABLED 0

RUN apk --no-cache add git gcc

RUN set -ex \
    && mkdir /code \
    && cd /code \
    && git clone https://github.com/ochinchina/supervisord \
    && cd /code/supervisord \
    && go build -tags release -a -o supervisord

FROM alpine:latest

COPY --from=builder /code/supervisord/supervisord /usr/bin/supervisord
COPY supervisord.conf /etc/supervisord.conf

RUN set -ex \
    && apk --no-cache add tzdata \
    && mkdir /etc/supervisor.d

ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
