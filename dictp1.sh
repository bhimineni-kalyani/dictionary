#!/bin/bash -x

declare -A DiesCount
function  init_DiesCount() {

  for ((i=1; i<=6; i++))
  do
      DiesCount[$i]=0
  done
}

#roll a die
function generateRollingNumbers() {
   randomDiesNumbers=$((  RANDOM%6 + 1))
   storeInDictionary $randomDiesNumbers
}

storeInDictionary () {
   key=$1;
   DiesCount[$key]=$(( ${DiesCount[$key]} + 1 ));
}

isLimitReached(){
   while [[ ${DiesCount[1]} -ne 10 && ${DiesCount[2]} -ne 10 && ${DiesCount[3]} -ne 10 && ${DiesCount[4]} -ne 10 && ${DiesCount[5]} -ne 10 && ${DiesCount[6]} -ne 10 ]]
do 
    generateRollingNumbers
done
}

init_DiesCount
isLimitReached

echo "keys are: " ${!DiesCount[@]}
echo "values are: "  ${!DiesCount[@]}

