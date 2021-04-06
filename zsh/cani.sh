local feat=$(ciu | sort -rn | eval "fzf ${FZF_DEFAULT_OPTS} --ansi --header='[caniuse:features]'" | sed -e 's/^.*%\ *//g' | sed -e 's/   .*//g')

if which caniuse &> /dev/null; then
  if [[ $feat ]] then; caniuse $feat; fi
fi
