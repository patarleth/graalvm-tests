FROM oracle/graalvm-ce:1.0.0-rc13

WORKDIR /opt

# run links if you want to try rust
#
# ADD https://static.rust-lang.org/dist/rust-1.33.0-x86_64-unknown-linux-gnu.tar.gz /opt/.
# ADD https://static.rust-lang.org/dist/rust-1.33.0-x86_64-unknown-linux-gnu.tar.gz.asc /opt/.
# ADD https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init /opt/.
# RUN chmod 766 /opt/rustup-init
# RUN /opt/rustup-init -y

ADD src/main/rust /opt/rust
# WORKDIR /opt/rust
# RUN rustc --emit=llvm-bc hello-rust.rs

ADD src/main/bash/lib.sh /opt/lib.sh
ADD src/main/bash/go_requirements.sh /opt/go_requirements.sh
ADD src/main/bash/install_go.sh /opt/install_go.sh

RUN /opt/go_requirements.sh

ADD src/main/c /opt/c
WORKDIR /opt/c
RUN clang -c -O1 -emit-llvm hello.c

ADD src/main/cpp /opt/cpp
WORKDIR /opt/cpp
RUN clang++ -c -O1 -emit-llvm hello-c++.cpp

ADD src/main/java /opt/java
ADD target/classes /opt/classes

RUN javac -d /opt/classes/. /opt/java/*.java

ADD src/main/js /opt/js

WORKDIR /opt

