#!/bin/sh
set -eo pipefail

exec 3>&1 # make stdout available as fd 3 for the result
exec 1>&2 # redirect all output to stderr for logging

export JQ_COLORS=""

################################################################################
# Logging
################################################################################

# Prints in red
warn() {
  printf "\n\033[0;31m%s\033[0m" "$1"
  echo -e "\n"
}

# Prints in Green
info() {
  printf "\n\033[0;32m%s\033[0m" "$1"
  echo -e "\n"
}

# Appends an existing line
note() {
  echo -n $1
}
