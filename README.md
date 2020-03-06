# Purpose
We are using [environment-modules](https://modules.readthedocs.io/en/latest/index.html) to handle configuration of our environment.

This allows to create reproducible and somewhat isolated environments.

## End Users
All users are required to put the following in their .bashrc, .bash_profile, or .zshrc file:

```
if [ -n "$EDA_CHECKOUT" ] then
   export EDA_CHECKOUT=/tools/EDA
fi
source $EDA_CHECKOUT/env/common_bashrc.bash
```

This file set up configuration information to be able to use environment-modules.

### Analog, Photonics, and PD
For now, analog and photonics users may still source the old edaSetup script to set up their environments in a backwards compatible method.

### DV and RTL
The `env/tools.yaml` file in our project tree configures our modules. The `runmod` tool uses this file to dynamically load modules. See [rumod][runmod] help.

### runmod
runmod is a small wrapper around the module tool that dynamically loads modules and then runs the rest of a command. This allows for a more heterogenous toolsuite as tools only have their environment setup when they are being executed. Compare this model to upfront loading of every module you could possibly need.

#### Examples:
If tools.yaml contains the following content:
```
xrun:
  modules:
    - xcelium/1909
    - vmanager/1909
jg:
  modules:
    - jaspergold
synth:
  modules:
    - genus/191
    - innovus/19-12
```

Then ```runmod synth -- genus -helpall``` command is tantamount to:
```
module load genus/191 innovus/19-12
genus -helpall
module unload genus/191 innovus/19-12
```

Note that the `--` is the separator between `runmod` arguments and command arguments.

There also exists a shortcut for when the `flow` is the same name as the tool you want to invoke to save on typing.

```runmod -t xrun -- -helpall``` is tantamount to:

```
module load xcelium/1909 vmanager/1909
xrun -helpall
module unload xcelium/1909 vmanager/1909
```

# Administration

## Installation
FIXME put in salt-stack
```sudo yum install environment-modules```
