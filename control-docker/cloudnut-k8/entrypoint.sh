#!/bin/sh

ssh-keygen -A

if [ -z "${K3S_URL}" ]
then
  exec nohup k3s server &
else
  exec nohup k3s agent &
fi

exec /usr/sbin/sshd -D -e "$@"