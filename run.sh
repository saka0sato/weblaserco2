#!/bin/bash
if [ "$(uname)" == 'Darwin' ]; then
  DIR=$(cd $(dirname $0) && pwd)
  python $DIR/backend/app.py --raspberrypi --dry-run
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  DIR=$(dirname $(readlink -f $0))
  python $DIR/backend/app.py --raspberrypi
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi
