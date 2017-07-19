#!/bin/bash
for dir in */
do
  cols=$(tput cols)

  if git -C "$dir" rev-parse &> /dev/null; then
    message="##### ff merge - $dir "
    remain_n=$(( cols-${#message} ))

    fill=""
    fill_c="#"
    for (( i=0; i<remain_n; i++ ))
    do
      fill=$fill$fill_c
    done

    printf "%s%s\\n" "$message" "$fill"
    git -C "$dir" merge --ff-only
  fi
done



print_seperator() {
  true;
}

