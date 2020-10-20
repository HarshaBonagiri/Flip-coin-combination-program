#! /bin/bash
#flip coin combination program

randomCheck=$((RANDOM%2))
if [[ $randomCheck -eq 1 ]]
then
    echo "Heads "
else
    echo "Tail"
fi

declare -A Coin
H=0
T=0

for (( i=0 ; i<10 ; i++ ))
do
    rand_singlet_check=$((RANDOM%2))
    case $rand_singlet_check in 
        1 )
            H=$((H+1))
            Coin[H]=$H;;
        0 )
            T=$((T+1))
            Coin[T]=$T;;
    esac
done

#Displaying Dictionary Values and finding singlet percentage
for index in ${!Coin[@]}
do
    echo "$index - ${Coin[$index]}"
    if [[ $index -eq H ]]
    then
        echo "Singlet Head Percentage H : `echo "scale=1; ${Coin[$index]}*100/10" | bc ` %" 
        
    else
        echo "Singlet Tails Percentage T : `echo "scale=1; ${Coin[$index]}*100/10" | bc ` %"
    fi
done


declare -A Doublet
HH=0
TT=0
HT=0
TH=0
#Doublet Combination : HH ,TT,HT,TH 
for (( i=0 ; i<10 ;i++ ))
do
    rand_doublet_check1=$((RANDOM%2))
    rand_doublet_check2=$((RANDOM%2))
    
    case $rand_doublet_check1-$rand_doublet_check2 in
        0-0 )
            HH=$((HH+1))
            Doublet[HH]=$H;;
        1-1 )
            TT=$((TT+1))
            Doublet[TT]=$T;;
        0-1 )
            HT=$((HT+1))
            Doublet[HT]=$HT;;
        1-0 )
            TH=$((TH+1))
            Doublet[TH]=$TH;;
    esac
done

#Display Doublet values and finding percentage
for index in ${!Doublet[@]}
do
    echo "$index - ${Doublet[$index]}"
    if [[ $index -eq HH ]]
    then
        echo "Doublet Head Percentage HH : `echo "scale=1; ${Doublet[$index]}*100/10" | bc ` %" 
    elif [[ $index -eq TT ]]
    then
        echo "Doublet Tail Percentage TT : `echo "scale=1; ${Doublet[$index]}*100/10" | bc ` %" 
    elif [[ $index -eq HT ]]
    then
        echo "Doublet HeadTail Percentage HT : `echo "scale=1; ${Doublet[$index]}*100/10" | bc ` %" 
    else
        echo "Doublet TailHead Percentage TH : `echo "scale=1; ${Doublet[$index]}*100/10" | bc ` %" 
    fi
done
