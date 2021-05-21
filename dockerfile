FROM ubuntu:latest

RUN apt update && apt install  openssh-server sudo -y

RUN apt-get -y install net-tools
RUn apt-get -y install iputils-ping

RUN apt-get -y install software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get -y update
RUN apt-get -y install python3.8
RUN ln -sf /usr/bin/python3 /usr/bin/python
RUN apt-get -y install nano

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 petrisor
RUN usermod -aG sudo petrisor


RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
RUN /etc/init.d/ssh start
RUN /etc/init.d/ssh restart


RUN  echo 'petrisor:123' | chpasswd
RUN  echo 'root:123' | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
