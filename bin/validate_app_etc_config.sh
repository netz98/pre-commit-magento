#!/bin/bash

# Build our list of files, and our list of args by testing if the argument is
# a valid path
args=""
files=()
for arg in ${*}
do
    if [ -e $arg ]; then
        files+=("$arg")
    else
        args+=" $arg"
    fi
done;

errors_found=false
error_message=""
for path in "${files[@]}"
do
    echo ${path}
    if [ $? -ne 0 ]; then
        error_message+="  - ${txtylw}${path}${txtrst}\n"
        errors_found=true
    fi
done;
