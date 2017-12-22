FROM alpine:3.6

RUN apk add --update curl
RUN curl -L https://github.com/jpillora/chisel/releases/download/1.2.3/chisel_linux_amd64.gz | gzip -d -c > /bin/chisel && chmod +x /bin/chisel

ENTRYPOINT ["/bin/chisel"]
