#!/usr/bin/env bash

show_mem_free() {
  color=
  raw_free=`free | awk '/buffers\/cache:/ {print $4}'`
  raw_total_mem=`free | awk '/Mem:/ {print $2}'`
  human_free=`free -h | awk '/buffers\/cache:/ {print $4}'`
  free_pct=$(($raw_free*100/$raw_total_mem))
  status=" $human_free"

  if (($free_pct > 50)); then
    color="green"
  elif (($free_pct < 20)); then
    color="red"
  fi
  i3cat encode --name memfree --instance "free memory" --color "${color}" "${status}"
}

while true; do
  show_mem_free
  sleep 5
done
