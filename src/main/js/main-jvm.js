#!/usr/bin/node --jvm

var BigInteger = Java.type('java.math.BigInteger');
console.log(BigInteger.valueOf(2).pow(100).toString(16));
