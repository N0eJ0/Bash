#!/usr/bin/bash
nid= 8.8
echo -e "Enter Subnet:\n"
read subn

for i in {1..255}
do

ping -c 1 $nid.$subn.$i 
grep 64
i=$((i+1))

done