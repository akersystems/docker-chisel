FROM golang:alpine AS build
WORKDIR /go/src/github.com/jpillora

RUN apk update
RUN apk add git

ENV CHISEL_VERSION=1.3.1
ENV CGO_ENABLED 0

RUN go get github.com/jpillora/chisel && \
    cd chisel && \
    git checkout ${CHISEL_VERSION} && \
    go build -ldflags "-X github.com/jpillora/chisel/share.BuildVersion=${CHISEL_VERSION}"

FROM alpine
COPY --from=build /go/src/github.com/jpillora/chisel/chisel /chisel

USER 1000

ENTRYPOINT ["/chisel"]
