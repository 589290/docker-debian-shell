FROM scratch
FROM debian:bullseye-slim
RUN apt-get -y update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get -y install openssh-server openssh-client htop tmux
RUN /etc/init.d/ssh start
RUN cd /root \
  && mkdir -p /root/.ssh \
  && ssh-keygen -q -t rsa -N '' -f /root/.ssh/id_rsa \
  && echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCaRK/2Ihs7befZ+3aosdFlqSN5xjiX4BIkzLI8F+zlmMSpXygV5KOr5HeTmxaSes3EI3Vn5cdpxt5VwQD7Tqn++fJtWySx9cthcL0UCzjEiQfjsPkP9AfmgeN1Yh/2ya6gEEi76O44aZxn+MeV178rBnQQEFf36wxB0LULqWixbHLE2XyWl47p631hsTp3LNu1bsQgacFkNgmmsN7RRZ3JEkceDofBRyNWU0jRNv8ndmiNxRNk6NKM4Jpnuwdu7adNIHBisEsKin+DX2xssW8i7Z2uAyncKjJk9eyGwYPqmwH8jS2/LENKAkuuJ34PD7eiaBOPWhyLKM6IlrVy61VK3B6W6ZwS67E6YgzbY2QMcLIzdPNOP+SUWLSQTN+UJObiNa7oJUEP71tAmEVHaT8YMk0iywEMPaWd19DeeznSt9cfpaW9mUh5tMPVZ7LhlbS2ZSo34EnCohGSUDBJenqk2PBPgFkyw1XkUGYXeyq6DnjBKUCmTeryyCLyhCbKNck= 589290@mac" > /root/.ssh/authorized_keys \
  && echo "\n" >> /root/.ssh/authorized_keys \
  && echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/Nbk3QzvIW4Iu+t+3ZqdTLQNH3znJnKqZ8Ht9xw4IW+YyxkdcfuDkJEoKc4/6IgLkEmCrHlvPUVzYp7+WFP9+bRu+J9jrqsDADo4kT6VHrsz5Njpt2s19rN3eo/0uvvPaBeX6H0mdCR7Z8SLBon+UnPzN0W/iWfPiE3ue2CuCPRYc9BawL8LTF3aM3+6g2q06niB6/K87PIVXzDRtBNg4OjK8aKe1NC9+T1R4B/cAi0SkmCZ+SeHOPeE/5+DJ0lTUTaO5X6yjDvNNM3FEuCjvtVHhvm+knC8sX2zDIjb0ZLzMms8cSa5CBFTiC8M+aHkuvhhyaA6ONsKrNtGiRUVX t@cx9" >> /root/.ssh/authorized_keys \
  && echo "\nalias l=\"ls -lah\"\nalias c=clear\n" >> /root/.bashrc \
  && mkdir -p /root/.config/htop
COPY htoprc /root/.config/htop/htoprc
RUN chown root:root /root/.config/htop/htoprc
COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]