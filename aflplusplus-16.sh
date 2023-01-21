#!/bin/sh
# AFL++ dependency and install in Ubuntu 16.04


# llvm-12
apt-get install apt-transport-https
apt-get update
printf "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-12 main" | tee /etc/apt/sources.list.d/llvm-toolchain-xenial-12.list
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
apt update
apt install llvm-12

# python3.6
apt-get update
apt-get upgrade
apt-get install software-properties-common
add-apt-repository ppa:fkrull/deadsnakes
apt-get update
apt-get install python3.6

# clang-12
apt-get install clang-12

# gcc-10
add-apt-repository ppa:savoury1/gcc-defaults-10
apt-get update
apt-get upgrade && apt-get dist-upgrade
apt-get install -y gcc-10-plugin-dev libstdc++-10-dev

# AFL++ dependency
apt-get update
apt-get install -y build-essential python3-dev automake cmake git flex bison libglib2.0-dev libpixman-1-dev python3-setuptools
apt-get install -y lld-12 llvm-12 llvm-12-dev clang-12 || apt-get install -y lld llvm llvm-dev clang
apt-get install -y gcc-10-plugin-dev libstdc++-10-dev
apt-get install -y ninja-build # for QEMU mode

# AFL++
cd /workdir
git clone https://github.com/AFLplusplus/AFLplusplus
cd AFLplusplus
make distrib
#make all
make install
