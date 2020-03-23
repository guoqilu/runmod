#!/bin/bash
# Look for users that aren't sourcing the common config in at least one of
# their config files
# Right now this just prints the good users

config_files=$(sudo find /u -maxdepth 2  -type f -name ".bashrc" -o -name ".bash_profile" -o -name ".zshrc")

eda_setup_matches=$(echo $config_files | xargs sudo grep -l EDA_CHECKOUT | sed -n "s/\/u\/\(.*\)\/.*/\1/p" | sort | uniq)

# FUTURE detect good/bad
# good=$(mktemp /tmp/find_bad_users.XXXXXX)
# echo $eda_setup_matches > $good
# all=$(mktemp /tmp/find_bad_users.XXXXXX)
# users > $all

# rm "$good" "$all"
echo $eda_setup_matches
