#!/bin/bash

if ! command -v apt > /dev/null; then
  echo "you do not have an apt package manager"
  exit 1
fi


