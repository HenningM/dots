#!/usr/bin/env bash

CM_API="https://api.coinmarketcap.com/v1";

print_usage() {
  echo "Usage: $0 <market>";
}

show_crypto_ticker() {
  color="#00ff00";
  ticker_data=`curl -s "$CM_API/ticker/$1/?convert=NOK"`;
  market_code=`echo $ticker_data | jq -r .[0].symbol`;
  price=`echo $ticker_data | jq -r .[0].price_nok | xargs printf "%.*f" 2`;
  day_change=`echo $ticker_data | jq -r .[0].percent_change_24h | xargs printf "%.*f" 2`;
  status="$market_code ${price}NOK ($day_change%)";

  if (( $(echo "$day_change < 0" | bc -l) )); then
    color="#ff0000";
  fi
  i3cat encode --name cryptoticker --instance "ticker:$1" --color "${color}" "${status}"
}

if [ -z "$1" ]; then
  print_usage;
  exit;
fi

while true; do
  show_crypto_ticker $1;
  sleep 300;
done
