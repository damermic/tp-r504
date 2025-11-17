#!/bin/bash

count1=0
count2=0
for (( i=1; i<=500; i++ )); do
 responce=$(curl -s 127.0.0.1:83)
 if echo "$responce" | grep -q "Hello 1"; then
  ((count1++))
 elif echo "$responce" | grep -q "Hello 2"; then
  ((count2++))
 else
    echo "Réponse inconnue (requête $i): $response"
 fi
done

total=$((count1 + count2))

p1=$((100 * count1 / total))
p2=$((100 * count2 / total))
echo "Répartition : $p1% / $p2%"
