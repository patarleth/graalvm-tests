#!/usr/bin/env bash

source go_requirements.sh

cd /opt/llgo
go get -d github.com/go-llvm/llgo/cmd/gllgo
$GOPATH/src/llvm.org/llvm/bindings/go/build.sh -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD=host =DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=true
cd $GOPATH/src/github.com/go-llvm/llgo
make install prefix=/usr/bin j=2
