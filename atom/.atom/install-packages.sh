#!/bin/bash

if ! [[ -x "$(command -v apm)" ]]; then
    echo "Error: could not find command apm"
    exit 1
fi

apm install $(cat ./packages.txt)
