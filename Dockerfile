FROM debian:stable-slim
RUN apt-get -y update && \
    apt-get -y install tcpdump python3 python3-pip apache2-utils dnsutils dnsutils stress procps && \
    apt-get autoclean && \
    pip3 install --user awscli
COPY scripts/env.sh /usr/local/bin
