FROM docker:24.0.5-alpine3.18

RUN mkdir -p /etc/ssl/certs/
RUN apk add -U ca-certificates tar zstd
RUN apk add --update --no-cache openssh 
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config

RUN mkdir -p /root/.ssh \
    && chmod 0700 /root/.ssh

RUN echo -n 'root:1' | chpasswd

COPY ./entrypoint.sh /

RUN chmod +x ./entrypoint.sh

EXPOSE 22

CMD [ "./entrypoint.sh" ]