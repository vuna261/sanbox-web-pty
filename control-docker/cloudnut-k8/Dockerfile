FROM alpine:3.16
RUN mkdir -p /etc/ssl/certs/
RUN apk add -U ca-certificates tar zstd
RUN apk add --update --no-cache openssh 
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config

RUN mkdir -p /root/.ssh \
    && chmod 0700 /root/.ssh

RUN echo -n 'root:1' | chpasswd

RUN wget https://github.com/k3s-io/k3s/releases/download/v1.27.4+k3s1/k3s -O /usr/local/bin/k3s \
    && \
    chmod +x /usr/local/bin/k3s

VOLUME /var/lib/kubelet
VOLUME /var/lib/rancher/k3s
VOLUME /var/lib/cni
VOLUME /var/log

RUN echo "alias kubectl='k3s kubectl'" >> ~/.ashrc
RUN echo "alias k='k3s kubectl'" >> ~/.ashrc

COPY ./00-aliases.sh /etc/profile.d/
COPY ./entrypoint.sh /

RUN chmod +x ./entrypoint.sh

EXPOSE 22
EXPOSE 6443
EXPOSE 443
EXPOSE 80

ENTRYPOINT [ "./entrypoint.sh" ]
