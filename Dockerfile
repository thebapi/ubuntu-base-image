FROM phusion/baseimage:0.11 AS builder
LABEL maintainer="Sajib Sarkar"

ENTRYPOINT ["/sbin/my_init"]
COPY  ./sysctl.conf /etc/sysctl.conf


RUN mkdir -p /etc/my_init.d
#COPY logtime.sh /etc/my_init.d/logtime.sh
#RUN chmod +x /etc/my_init.d/logtime.sh



RUN cd $HOME
RUN apt-get update && \
  apt-get install -y --install-recommends \
  g++ \
  gcc \
  wget \
  libc6-dev \
  sysfsutils \
  make \
  && rm -rf /var/lib/apt/lists/*


COPY  sysfs.conf /etc/sysfs.conf

CMD ["/sbin/my_init"]

RUN apt-get install -y redis-server libhiredis-dev

CMD ['redis-server']