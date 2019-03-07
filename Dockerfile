FROM fedora:29
MAINTAINER HomeOffice Devops <devops@digital.homeoffice.gov.uk>

ENV CHISEL_VERSION=1.3.1

RUN dnf install curl -y && \
    curl -sL https://github.com/jpillora/chisel/releases/download/${CHISEL_VERSION}/chisel_linux_amd64.gz | gzip -d -c > /bin/chisel && \
    chmod +x /bin/chisel && \
    groupadd -g 1000 chisel && \
    useradd -g chisel -u 1000 chisel

USER 1000

ENTRYPOINT ["/bin/chisel"]
