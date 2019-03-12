# graalvm test

## reqs

    docker

## build

    $ ./build.sh

## run later after building

    $ docker run --rm -t -i graalvm-tests /opt/lib.sh

This will pull up a bash prompt running in the graalvm-tests container. 

### handle shell fns

    $ graal_java_test
    $ graal_c_test
    $ graal_cpp_test
    $ graal_node_jvm_test
    $ graal_node_test

### just type the functions to see how they work

    $ type graal_c_test

## notes

### winning

    java
    c
    cpp
    javascript without jvm 
    javascript WITH jvm
    
### fails 

    rust
    golang
