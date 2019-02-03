FROM phusion/baseimage:0.11 AS builder
LABEL maintainer="Sajib Sarkar"
LABEL maintainer_email="thebapi@gmail.com"

ADD . /pd_build

COPY ./somaxconn /proc/sys/net/core/somaxconn
COPY  ./sysctl.conf /etc/sysctl.conf
RUN mkdir -p /etc/my_init.d
#COPY logtime.sh /etc/my_init.d/logtime.sh
#RUN chmod +x /etc/my_init.d/logtime.sh

#COPY  sysfs.conf /etc/sysfs.conf
COPY  ./sysctl.conf /etc/sysctl.conf
COPY ./99-net.conf /etc/sysctl.d/99-net.conf
COPY ./1-net.conf /etc/sysctl.d/1-net.conf

RUN cd $HOME







WORKDIR /

RUN /pd_build/install.sh



# Set environment variables.
ENV GOROOT /goroot
ENV GOPATH /gopath
ENV PATH $GOROOT/bin:$GOPATH/bin:$PATH

ENTRYPOINT ["/sbin/my_init"]