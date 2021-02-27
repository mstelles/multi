FROM debian:stable-slim
RUN apt-get -y update && \
    apt-get -y install sudo openssh-server netcat bind9utils fping && \
    apt-get autoclean

RUN echo "root:123" | chpasswd

# ssh server
RUN mkdir /var/run/sshd & \
    sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd && \
    echo "export VISIBLE=now" >> /etc/profile
ENV NOTVISIBLE="in users profile"


# general configs
COPY config/sudoers /etc/sudoers

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
