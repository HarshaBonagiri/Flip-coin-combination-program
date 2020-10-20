#! /bin/bash
#flip coin combination program

randomCheck=$((RANDOM%2))
if [[ $randomCheck -eq 1 ]]
then
    echo "Heads "
else
    echo "Tail"
fi
