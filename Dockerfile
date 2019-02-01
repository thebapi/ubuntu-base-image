FROM phusion/baseimage:0.11 AS builder
LABEL maintainer="Sajib Sarkar"
LABEL maintainer_email="thebapi@gmail.com"

CMD ["/sbin/my_init"]



RUN mkdir -p /etc/my_init.d
#COPY logtime.sh /etc/my_init.d/logtime.sh
#RUN chmod +x /etc/my_init.d/logtime.sh

#COPY  sysfs.conf /etc/sysfs.conf
COPY  ./sysctl.conf /etc/sysctl.conf
COPY ./99-net.conf /etc/sysctl.d/99-net.conf
COPY ./1-net.conf /etc/sysctl.d/1-net.conf

RUN cd $HOME
RUN apt-get update && apt-get upgrade  && \
  apt-get install -y --install-recommends \
  g++ \
  gcc \
  wget \
  git \
  sudo \
  libc6-dev \
  make

# Install Go
RUN \
  mkdir -p /goroot && \
  curl https://dl.google.com/go/go1.11.5.linux-amd64.tar.gz | tar xvzf - -C /goroot --strip-components=1

# Set environment variables.
ENV GOROOT /goroot
ENV GOPATH /gopath
ENV PATH $GOROOT/bin:$GOPATH/bin:$PATH


WORKDIR /


RUN rm -rf /var/lib/apt/lists/*

#RUN sysctl net.core.somaxconn

CMD ["redis-server"]