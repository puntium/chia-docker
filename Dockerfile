FROM ubuntu:focal

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt install git -y
RUN apt install lsb-release -y
RUN apt install sudo -y
RUN DEBIAN_FRONTEND="noninteractive" apt install -y libsodium-dev cmake g++ git build-essential

RUN mkdir /chia
WORKDIR /chia
RUN git clone https://github.com/Chia-Network/chia-blockchain.git -b latest --recurse-submodules

WORKDIR /chia/chia-blockchain

RUN sh install.sh

WORKDIR /chia

RUN git clone https://github.com/madMAx43v3r/chia-plotter.git
WORKDIR /chia/chia-plotter
RUN git submodule update --init
RUN ./make_devel.sh
