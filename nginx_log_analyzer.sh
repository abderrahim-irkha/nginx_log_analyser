#!/bin/bash

if [ -z "$1" ]; then
        echo "Please provide the Nginx log file as an argument!"
	exit 2
else
        arg=$1
fi

echo "Top 5 IP addresses with the most requests:"
awk '{print $1}' $arg | sort | uniq -c | sort -nr | head -5

echo
echo "Top 5 most request paths:"
awk '{print $16}' $arg | sort | uniq -c | sort -nr | head -5

echo
echo "Top 5 response status codes:"
awk '{print $9}' $arg | sort | uniq -c | sort -nr | head -5

echo
echo "Top 5 user agents:"
awk '{print $12}' $arg | sort | uniq -c | sort -nr | head -5