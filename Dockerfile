FROM ubuntu:latest

RUN apt update && apt install  openssh-server sudo -y

RUN apt-get install -y net-tools
RUn apt-get install iputils-ping

RUN apt install software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt update
RUN apt install python3.8
RUN ln -sf /usr/bin/python3 /usr/bin/python
RUN apt install python3-pip
RUN apt-get install curl
RUN apt install nodejs
RUN apt install npm
RUN npm install -g ganache-cli
RUN pip3 install --user karl

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 slashlinux 

RUN usermod -aG sudo slashlinux

RUN service ssh start

RUN  echo 'slashlinux:tgztgztgz' | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]