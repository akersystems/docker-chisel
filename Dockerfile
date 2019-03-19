FROM golang:1.11 AS build
WORKDIR /go/src/github.com/jpillora

ENV CHISEL_VERSION=1.3.1

RUN go get github.com/jpillora/chisel && \
    cd chisel && \
    git checkout ${CHISEL_VERSION} && \
    go build -ldflags "-X github.com/jpillora/chisel/share.BuildVersion=${CHISEL_VERSION}"

FROM fedora:30
COPY --from=build /go/src/github.com/jpillora/chisel/chisel /chisel

USER 1000

ENTRYPOINT ["/chisel"]
