FROM debian:stable-slim
RUN apt-get -y update && \
    apt-get -y install openssh-server tcpdump apache2-utils dnsutils dnsutils stress procps && \
    apt-get autoclean
RUN mkdir /var/run/sshd
RUN useradd ansible && echo "ansible:123" | chpasswd
RUN sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd
ENV NOTVISIBLE="in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
