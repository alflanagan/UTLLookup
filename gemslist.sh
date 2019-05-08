#!/usr/bin/env bash

if [[ $# -lt 1 ]]; then
   echo Usage: $(basename $0) gem_file_name
   echo 'parses' a Gemfile to produce a sorted list of gems to be installed
else
    grep gem "$1" | grep -v '^#' | cut -d"'" -f2 | grep -v rubygems.org | sort
fi
