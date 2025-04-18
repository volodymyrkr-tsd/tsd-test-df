#!/usr/bin/env bash

# Environment variable management for CNB
export_env_dir() {
  local env_dir=$1
  if [ -d "$env_dir" ]; then
    for e in $(ls $env_dir); do
      echo "$e" | grep -E -q -v '^(PATH|GIT_DIR|CPATH|CPPATH|LD_PRELOAD|LIBRARY_PATH|LANG)$'
      if [ $? -eq 0 ]; then
        export "$e=$(cat $env_dir/$e)"
      fi
    done
  fi
}

# Error handling
error() {
  echo " !     $*" >&2
  exit 1
}

# Status messaging
status() {
  echo "-----> $*"
}

# Debug messaging
debug() {
  if [ "$BUILDPACK_DEBUG" = "true" ]; then
    echo "       [DEBUG] $*"
  fi
}