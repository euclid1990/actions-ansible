FROM ubuntu:20.04

RUN echo "===> Update packages..."  && \
    apt-get update                  && \
    echo "===> Installing handy tools (not absolutely required)..."  && \
    apt-get install -y python3-pip                  && \
    pip3 install --upgrade pycrypto pywinrm         && \
    echo "===> Installing Ansible..."               && \
    mkdir -p /etc/ansible                           && \
    pip3 install 'ansible==2.10.7'                  && \
    apt-get install -y sshpass openssh-client rsync && \
    echo "===> Adding hosts for convenience..."     && \
    echo 'localhost' > /etc/ansible/hosts           && \
    echo "===> Clean temporary..."                  && \
    apt-get clean                                   && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
