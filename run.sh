#!/bin/bash
# Variables
WERCKER_STEP_WAIT_TCP_HOST=${WERCKER_STEP_WAIT_TCP_HOST:-localhost}
WERCKER_STEP_WAIT_TCP_PORT=${WERCKER_STEP_WAIT_TCP_PORT:-8080}
WERCKER_STEP_WAIT_TCP_TIMEOUT=${WERCKER_STEP_WAIT_TCP_TIMEOUT:-60}

# Functions
function fail() {
  echo "$1"
  exit 1
}

function waitTcp {
  while ! nc -q 1 $WERCKER_STEP_WAIT_TCP_HOST $WERCKER_STEP_WAIT_TCP_PORT </dev/null; do
    sleep 1
    let "WERCKER_STEP_WAIT_TCP_TIMEOUT--"
    if [[ "$WERCKER_STEP_WAIT_TCP_TIMEOUT" == "0" ]]; then
      exit 1
    fi
    echo "waiting for $WERCKER_STEP_WAIT_TCP_HOST:$WERCKER_STEP_WAIT_TCP_PORT $WERCKER_STEP_WAIT_TCP_TIMEOUT"
  done 
}

# Execution
waitTcp
