# This is an anti-pattern. Do not use in production.
FROM golang:alpine AS builder

LABEL maintainer="nico@meisenzahl.org"

WORKDIR /app

ENV CGO_ENABLED=0
ADD src/ .
RUN apk --update add redis \
  && go build -o sample-app

EXPOSE 3000

ENTRYPOINT ["./sample-app"]
