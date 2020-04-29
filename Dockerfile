FROM debian:stable-slim
RUN apt-get -y update
RUN apt-get -y install tcpdump python3 python3-pip apache2-utils dnsutils dnsutils
RUN pip3 install --user awscli
ADD scripts/env.sh /usr/local/bin
CMD /usr/local/bin/env.sh
