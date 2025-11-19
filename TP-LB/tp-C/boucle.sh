#!/bin/bash

for (( i=1; i<=500; i++ )); do
	curl localhost:8080; done > a.txt 2>/dev/null
sort a.txt| uniq
