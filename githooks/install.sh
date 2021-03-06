#!/bin/bash

PRE_COMMIT=.git/hooks/pre-commit
DIR=$(cd -- "$(dirname "$0")"; pwd -P)

if [[ ! -d .git ]]; then
  echo "Git hooks install script must be run from the root directory of a git repository" 1>&2
  exit 1
fi

if [[ -e $PRE_COMMIT || -h $PRE_COMMIT ]]; then
  rm "$PRE_COMMIT"
fi

ln -s "$DIR/pre-commit" "$PRE_COMMIT"
