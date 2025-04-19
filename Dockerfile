FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Enable universe and multiverse repos
RUN apt-get update && \
    apt-get install -y software-properties-common usbutils && \
    add-apt-repository universe && \
    add-apt-repository multiverse && \
    apt-get update

RUN apt-get install udev -y

RUN apt-get update -y && apt-get upgrade -y 

COPY sdkmanager_2.2.0-12028_amd64.deb /
RUN apt install ./sdkmanager_2.2.0-12028_amd64.deb -y

# Add user
RUN useradd -ms /bin/bash user && echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER user

WORKDIR /workspace