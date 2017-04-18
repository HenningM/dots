#!/usr/bin/env bash

show_mem_free() {
  color=
  raw_total_mem=`awk '/MemTotal/ {print $2}' /proc/meminfo`
  raw_avail=`awk '/MemAvailable/ {print $2}' /proc/meminfo`
  human_avail=`bc <<< "scale=1; $raw_avail / (1024*1024)"`
  human_avail=`echo $human_avail GB`
  free_pct=$(($raw_avail*100/$raw_total_mem))
  status=" $human_avail"

  if (($free_pct > 50)); then
    color="#00ff00"
  elif (($free_pct < 20)); then
    color="#ff0000"
  fi
  i3cat encode --name memfree --instance "free memory" --color "${color}" "${status}"
}

while true; do
  show_mem_free
  sleep 5
done
