#!/usr/bin/env bash

if ! command -v git > /dev/null; then
    cd /opt
    
    yum -y remove cmake
    curl https://cmake.org/files/v3.6/cmake-3.6.2.tar.gz -o cmake-3.6.2.tar.gz
    tar -zxvf cmake-3.6.2.tar.gz
    cd cmake-3.6.2
    ./bootstrap --prefix=/usr/local
    gmake
    gmake install
    
    yum -y install golang git svn
    git clone https://github.com/go-llvm/llgo.git
fi

export PATH=/usr/libexec/gcc/x86_64-redhat-linux/4.8.5:$PATH
export LD_LIBRARY_PATH=/usr/lib64:$LD_LIBRARY_PATH
export CC=`which gcc`
export CXX=`which g++`
export LIBGO_CFLAGS=--gcc-toolchain=/usr/libexec/gcc/x86_64-redhat-linux/4.8.5
export GOPATH=/root/go

