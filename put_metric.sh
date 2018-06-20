#!/bin/bash

HOST="localhost"
PORT="8081"

usage() { echo "Usage: $0 [-m <string> Metric name] [-v <int> Metric value]" 1>&2; exit 1; }

while getopts ":m:v:" o; do
    case "${o}" in
        m)
            METRIC=${OPTARG}
            ;;
        v)
            VALUE=${OPTARG}
            re='^[0-9]+([.][0-9]+)?$'
            if ! [[ $VALUE =~ $re ]]; then
                usage; exit 1
            fi
            ;;
        *)
            usage
            ;;
    esac
done

if [ -z "${METRIC}" ] || [ -z "${VALUE}" ]; then
    usage
fi

if ! [ -x "$(command -v nc)" ]; then
    echo 'Error: nc is not installed.' >&2
    exit 1
fi

echo "${METRIC} ${VALUE} `date +%s`" | nc ${HOST} ${PORT}

if [ $? -eq 0 ]; then
    echo "Metric submitted successfully."
else
    echo "Something went wrong!"
fi
