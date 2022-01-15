FROM scratch
FROM debian:bullseye-slim
ENV LANG=en_US.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
ARG USER=deb

COPY ./yup    /usr/local/bin/yup
RUN chmod 755 /usr/local/bin/yup && \
    apt-get update && \
    apt-get --assume-yes upgrade && \
    apt-get --assume-yes install \
        openssh-server openssh-client htop tmux nano vim git wget curl \
        sudo apt-utils iptraf-ng dnsutils locales iproute2 zip && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && \
    service ssh start

RUN adduser --uid 1026 --disabled-password --gecos '' $USER && \
    mkhomedir_helper $USER && \ 
    adduser $USER sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

WORKDIR /root
RUN mkdir -p /root/.ssh && \
    ssh-keygen -q -t rsa -N '' -f /root/.ssh/id_rsa && \
    echo "\nalias l=\"ls -lah\"\nalias c=clear\n" >> /root/.bashrc
COPY ./authorized_keys /root/.ssh/authorized_keys

USER $USER
WORKDIR /home/$USER
RUN mkdir -p            /home/$USER/.ssh && \
    ssh-keygen -q -t rsa -N '' -f /home/$USER/.ssh/id_rsa && \
    echo "\nalias l=\"ls -lah\"\nalias c=clear\n" >> /home/$USER/.bashrc

RUN sudo service ssh stop

CMD [ "/bin/bash","-c","sudo service ssh restart ; sleep infinity & wait ;"]