FROM debian:stable-slim
RUN apt-get -y update && \
    apt-get -y install curl unzip less groff net-tools gnupg sudo openssh-server tcpdump apache2-utils dnsutils dnsutils stress procps && \
    apt-get autoclean

RUN echo "root:123" | chpasswd

# ssh server
RUN mkdir /var/run/sshd & \
    sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd && \
    echo "export VISIBLE=now" >> /etc/profile
ENV NOTVISIBLE="in users profile"

# ansible
RUN useradd -m ansible && echo "ansible:123" | chpasswd && \
    echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 && apt-get update && apt-get -y install ansible

# awscli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

# general configs
COPY config/sudoers /etc/sudoers

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
