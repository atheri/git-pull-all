#!/bin/bash

print_seperator() {
  text=$1
  symbol=$2

  remain_n=$(( cols-${#text} ))
  fill=""
  for (( i=0; i<remain_n; i++ ))
  do
    fill=$fill$symbol
  done
  printf "%s%s\\n" "$text" "$fill"
}

## MAIN ##
for dir in */
do
  cols=$(tput cols)

  if git -C "$dir" rev-parse &> /dev/null; then
    branch_name=$(git -C "$dir" name-rev --name-only HEAD)
    message="----# $dir$branch_name #"
    
    print_seperator "$message" "-"
    
    git -C "$dir" pull --ff-only
  fi
done
## END MAIN ##

