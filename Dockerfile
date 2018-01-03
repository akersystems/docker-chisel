FROM alpine:3.6

ENV CHISEL_VERSION=1.2.3

RUN apk add --update --no-cache curl

RUN adduser -S chisel

RUN curl -L https://github.com/jpillora/chisel/releases/download/${CHISEL_VERSION}/chisel_linux_amd64.gz | gzip -d -c > /bin/chisel && chmod +x /bin/chisel

USER chisel

ENTRYPOINT ["/bin/chisel"]
