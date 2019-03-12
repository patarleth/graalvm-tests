#!/usr/bin/env bash

LIB_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

graal_java_test() {
    java -cp /opt/classes/. Main
}

graal_node_jvm_test() {
    /opt/js/main-jvm.js
}

graal_node_test() {
    /opt/js/main.js
}

graal_c_test() {
    lli /opt/c/hello.bc
}

graal_cpp_test() {
    lli --lib /lib64/libstdc++.so.6 /opt/cpp/hello-c++.bc
}

graal_rust_test() {
    echo rust is busted right now, somebody -hint -hint needs to track down the seg fault
    echo when fixed run
    echo install_rust
    echo compile_rust
    echo 'lli --lib $(rustc --print sysroot)/lib/libstd-* hello-rust.bc'
}

install_rust() {
    curl https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init -o /opt/rustup-init
    chmod 766 /opt/rustup-init
    /opt/rustup-init -y
}

compile_rust() {
    pushd /opt/rust
    rustc --emit=llvm-bc hello-rust.rs
    popd
}

export -f graal_java_test
export -f graal_node_jvm_test
export -f graal_node_test
export -f graal_c_test
export -f graal_cpp_test
export -f graal_rust_test
export -f install_rust
export -f compile_rust

export LIB_SCRIPT_DIR

echo if you would like to play with golang in graal run
echo /opt/bash/install_go.sh
echo
echo THEN go get some coffee while it builds

bash -l
