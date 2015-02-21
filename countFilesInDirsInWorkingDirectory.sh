#! /usr/bin/env bash
for i in $(find . -maxdepth 1 -type d); do
    echo $(find $i -type f | wc -l ) $i;
done | sort -g
