# FROM debian:latest
# MAINTAINER dvarrui 1.0
# CMD ["/bin/bash"]

# FROM ubuntu:13.10
FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq -y && apt-get install curl -qq -y && apt-get clean
# RUN curl -sSL https://get.rvm.io | bash -s stable –ruby=2.1.1
RUN apt install openssh-server && systemctl ssh start && systemctl ssh enable
