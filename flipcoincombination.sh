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

declare -A Triplet
HHH=0
HHT=0
HTH=0
HTT=0
TTT=0
THH=0
THT=0
TTH=0

for (( i=0 ; i<$num ; i++ ))
do
    rand_triplet_check1=$((RANDOM%2))
    rand_triplet_check2=$((RANDOM%2))
    rand_triplet_check3=$((RANDOM%2))

    case $rand_triplet_check1-$rand_triplet_check2-$rand_triplet_check3 in
        0-0-0 )
            HHH=$((HHH+1))
            Triplet[HHH]=$HHH;;
        0-0-1 )
            HHT=$((HHT+1))
            Triplet[HHT]=$HHT;;
        0-1-0 )
            HTH=$((HTH+1))
            Triplet[HTH]=$HTH;;
        0-1-1 )
            HTT=$((HTT+1))
            Triplet[HTT]=$HTT;;
        1-1-1 )
            TTT=$((TTT+1))
            Triplet[TTT]=$TTT;;
        1-0-0 )
            THH=$((THH+1))
            Triplet[THH]=$THH;;
        1-0-1 )
            THT=$((THT+1))
            Triplet[THT]=$THT;;
        1-1-0 )
            TTH=$((TTH+1))
            Triplet[TTH]=$TTH;;
    esac
done

#Display Triplet Values and find percentage

for index in ${!Triplet[@]}
do
    echo "$index - ${Triplet[$index]}"
    if [[ $index -eq HHH ]]
    then
        echo "Triplet HHH percentage : `echo "scale=1; ${Triplet[$index]}*100/20" | bc ` %" 
    elif [[ $index -eq HHT ]]
    then
        echo "Triplet HHT percentage : `echo "scale=1; ${Triplet[$index]}*100/20" | bc ` %" 
    elif [[ $index -eq HTH ]]
    then
        echo "Triplet HTH percentage : `echo "scale=1; ${Triplet[$index]}*100/20" | bc ` %" 
    elif [[ $index -eq HTT ]]
    then
        echo "Triplet HTT percentage : `echo "scale=1; ${Triplet[$index]}*100/20" | bc ` %" 
    elif [[ $index -eq TTT ]]
    then
        echo "Triplet TTT percentage : `echo "scale=1; ${Triplet[$index]}*100/20" | bc ` %" 
    elif [[ $index -eq THH ]]
    then
        echo "Triplet THH percentage : `echo "scale=1; ${Triplet[$index]}*100/20" | bc ` %" 
    elif [[ $index -eq THT ]]
    then
        echo "Triplet THT percentage : `echo "scale=1; ${Triplet[$index]}*100/20" | bc ` %" 
    else
        echo "Triplet TTH percentage : `echo "scale=1; ${Triplet[$index]}*100/20" | bc ` %" 
    fi
done
