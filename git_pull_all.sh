#!/bin/bash
for dir in */
do
  cols=$(tput cols)

  if git -C "$dir" rev-parse &> /dev/null; then
    branch_name=$(git -C "$dir" name-rev --name-only HEAD)
    message="----# $dir$branch_name #"
    remain_n=$(( cols-${#message} ))

    fill=""
    fill_c="-"
    for (( i=0; i<remain_n; i++ ))
    do
      fill=$fill$fill_c
    done

    printf "%s%s\\n" "$message" "$fill"
    git -C "$dir" pull --ff-only
  fi
done



print_seperator() {
  true;
}

