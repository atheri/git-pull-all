#!/bin/bash
for dir in */
do
  cols=$(tput cols)

  if git -C "$dir" rev-parse &> /dev/null; then
    if git -C "$dir" status --porcelain; then
      message="##### Pulling $dir "
      remain_n=$(( cols-${#message} ))

      fill=""
      fill_c="#"
      for (( i=0; i<remain_n; i++ ))
      do
        fill=$fill$fill_c
      done

      printf "%s%s\\n" "$message" "$fill"
      git -C "$dir" pull
    fi
  fi
done



print_seperator() {
  true;
}

