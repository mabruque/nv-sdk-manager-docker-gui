FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Enable universe and multiverse repos
RUN apt-get update && \
    apt-get install -y software-properties-common usbutils && \
    add-apt-repository universe && \
    add-apt-repository multiverse && \
    apt-get update

RUN apt-get install wget udev sudo iproute2 -y

RUN apt-get update && apt-get install -y python3-pip && pip3 install pyyaml
RUN apt-get update -y && apt-get upgrade -y 

RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-keyring_1.1-1_all.deb
RUN sudo dpkg -i cuda-keyring_1.1-1_all.deb
RUN sudo apt-get update -y
RUN apt-get -y install sdkmanager

# Add user and set sudo password
RUN useradd -ms /bin/bash user && \
    echo "user:pass" | chpasswd && \
    echo "user ALL=(ALL) ALL" >> /etc/sudoers

USER user

WORKDIR /workspace