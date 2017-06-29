#!/bin/bash
for dir in */
do
  cols=$(tput cols)

  if git -C $dir rev-parse &> /dev/null; then
    message="##### Pulling $dir "
    remain_n=$(( $cols-${#message} ))

    fill=""
    fill_c="#"
    for (( i=0; i<$remain_n; i++ ))
    do
      fill=$fill$fill_c
    done

    printf "$message$fill\n"
    git -C $dir pull
  fi
done
