FROM fedora:29
MAINTAINER HomeOffice Devops <devops@digital.homeoffice.gov.uk>

ENV CHISEL_VERSION=1.2.3

RUN dnf install curl -y && \
    curl -sL https://github.com/jpillora/chisel/releases/download/${CHISEL_VERSION}/chisel_linux_amd64.gz | gzip -d -c > /bin/chisel && \
    chmod +x /bin/chisel

USER 1000

ENTRYPOINT ["/bin/chisel"]
