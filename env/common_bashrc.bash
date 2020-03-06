#!/usr/bin/bash
###############################################################################
# THINK LONG AND HARD BEFORE EDITING THIS FILE!
# Perhaps even talk to someone who has edited it previously.
#
# This is the global configuration file that everyone sources.
# Changes may immediately affect all users!
# Keep this file to the bare minimum to avoid churn and bloat.
# Use modules whenever possible.

###############################################################################
# Figure out where this file lives
# We could hardcode this, but it will be easier to test updates later if this value is calculated
this_file="${BASH_SOURCE[0]}"
# Hack for zsh
if [ -z $this_file ]
then
  this_file=$0
fi
while [ -h "$this_file" ]; do # resolve $THIS_FILE until the file is no longer a symlink
  this_file="$(readlink "$this_file")"
done

# This file is assumed to live in the env directory of the EDA repository
env_dir="$( cd -P "$( dirname "$this_file" )" >/dev/null 2>&1 && pwd )"
eda_dir=`readlink -f $env_dir/..`


###############################################################################
# Set up modulefiles paths
modulefiles_dir=`readlink -f $eda_dir/modulefiles`
[[ ":${MODULEPATH}:" != *":${modulefiles_dir}:"* ]] && MODULEPATH="${modulefiles_dir}:${MODULEPATH}"
flows_dir=`readlink -f $eda_dir/flows`
[[ ":${MODULEPATH}:" != *":${flows_dir}:"* ]] && MODULEPATH="${flows_dir}:${MODULEPATH}"
export MODULEPATH

bin_dir=`readlink -f $eda_dir/bin`
[[ ":${PATH}:" != *":${bin_dir}:"* ]] && PATH="${bin_dir}:${PATH}"
export PATH
