FROM phusion/baseimage:0.11 AS builder
LABEL maintainer="Sajib Sarkar"

CMD ["/sbin/my_init"]



RUN mkdir -p /etc/my_init.d
#COPY logtime.sh /etc/my_init.d/logtime.sh
#RUN chmod +x /etc/my_init.d/logtime.sh

#COPY  sysfs.conf /etc/sysfs.conf
COPY  ./sysctl.conf /etc/sysctl.conf
COPY ./60-net.conf /etc/sysctl.d/60-net.conf
COPY ./1-net.conf /etc/sysctl.d/1-net.conf

RUN cd $HOME
RUN apt-get update && \
  apt-get install -y --install-recommends \
  g++ \
  gcc \
  wget \
  sudo \
  libc6-dev \
  make

#RUN Su -
#RUN usermod -aG sudo root

#RUN sudo sysctl -w fs.file-max=100000
#RUN sudo sysctl -w net.core.somaxconn=100000
#RUN sudo sysctl -p


#RUN apt-get install sysfsutils -y


## Install Redis.
#run apt-get install -y redis-server libhiredis-dev
RUN wget http://download.redis.io/releases/redis-5.0.3.tar.gz
RUN tar xzf redis-5.0.3.tar.gz
RUN ls
WORKDIR redis-5.0.3
#run make
RUN make install .
RUN ls
WORKDIR ./utils
RUN ./install_server.sh

COPY ./somaxconn /proc/sys/net/core/somaxconn

WORKDIR /


RUN rm -rf /var/lib/apt/lists/*

#RUN sysctl net.core.somaxconn

CMD ["redis-server"]