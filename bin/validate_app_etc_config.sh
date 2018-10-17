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
    grep Magento_TestModule ${path}
    # return 0 means -> Test modules were found
    if [ $? -eq 0 ]; then
        error_message+="Integration-Test modules found  - ${txtylw}${path}${txtrst}\n"
        errors_found=true
    fi
done;

if [ "$errors_found" = true ]; then
    exit 1;
fi
