#!/bin/bash

file=$1

if [ -z $file ]; then
    echo "Usage: bash asm.sh <file (without .asm)>"
    exit 0
fi

if [ -f "${file}.asm" ]; then
    which nasm > /dev/null
    if [ $? -ne 0 ]; then
        echo "You need to install NASM"
        exit 2
    fi
    nasm -felf64 $file.asm
    if [ $? -ne 0 ]; then
        echo "An error occured with NASM"
        exit 3
    fi

    which ld > /dev/null
    if [ $? -ne 0 ]; then
        echo "Couldn't locate 'ld'"
        exit 2
    fi
    ld $file.o -o $file
    if [ $? -ne 0 ]; then
        echo "An error occured while linking"
        exit 3
    fi

    rm $file.o

    echo "Compiled $file"
else
    echo "${file}.asm not found"
    exit 1
fi