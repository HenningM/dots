#!/usr/bin/env bash

show_infected() {
  figures=$(curl -s https://www.vg.no/spesial/2020/corona-viruset/data/norway-region-data/ | jq -c '.metadata.confirmed | [.newToday // 0,.total|tostring] | join("/")' | tr -d '"')
  status=" $figures"

  i3cat encode --name corona --instance "corona" "${status}"
}

while true; do
  show_infected
  sleep 60
done
