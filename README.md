# Purpose
We are using [environment-modules](https://modules.readthedocs.io/en/latest/index.html) to handle configuration of our environment.

This allows us to create reproducible and somewhat isolated environments.

## End Users
All users are required to put the following in their .bashrc, .bash_profile, or .zshrc file:

``` bash
if [[ -z "$EDA_CHECKOUT" ]]; then
   export EDA_CHECKOUT=/tools/EDA
fi
source $EDA_CHECKOUT/env/common_bashrc.bash
```

This file set up configuration information to be able to use environment-modules.

### Analog, Photonics, and PD
For now, analog and photonics users may still source the old edaSetup script to set up their environments in a backwards compatible method.

### DV and RTL
The `env/tools.yaml` file in our project tree configures our modules. The [runmod](#runmod) tool uses this file to dynamically load modules.

### runmod
`runmod` is a small wrapper around the `module` tool that dynamically loads modules and then runs a command.
This allows for a more heterogeneous tool-suite as tools only have their own environment setup when they are being executed, and do not conflict with other tool setups or environments.
We use `runmod` as a wrapper instead of directly running `module load` because loading modulefiles can have unintended side effects on the environment.
For example the flexnoc/4.7.0 modulefile forces the shell's python environment to python 2.7.
This is incompatible with our RTL environment because many of our other tools will not work with python 2.7.
Also, many tools come prepackaged with their own version of certain libraries (C, python, C++, etc.) which can accidentally get loaded or used by other tools.
These are two examples of interoperability problems between tools, but there are many other potential issues.

`runmod` invokes module-based tools (e.g. Xcelium or Genus) in an isolated environment without the user running a `module load` command.
The `runmod` invocation creates a new sub-shell, does one or more `module load` in that shell, runs the user's commands, then terminates the sub-shell.
All the stdout and stderr is piped to the shell that invoked `runmod`, but the original shell environment is unmodified.
This avoids interoperability problems between tools and keeps our development environment clean.

`runmod` determines which modules to load based on a `tools.yaml` file.
Each project has its own `tools.yaml` file in the `env/` directory for that project, and there is a `tools.yaml` in the EDA repository in env/ as well.
Each `tools.yaml` is a dictionary where the primary keys are canonical names for tool flows (e.g. `flowkit` for the digital back-end flow) and the values are another dictionary.
The sub-dictionary currently only has a single key-value pair, where the required key is 'modules', and the value is an ordered list of modules to load for that tool flow.
A tool flow might only load one module (e.g. 'jg' for 'JasperGold', which only needs to load the 'jaspergold' module), but some might need to load many modules (like `flowkit`, which loads modules for synthesis, pnr, lec, DFT, etc.).

### Examples:
If tools.yaml contains the following content:
``` yaml
xrun:
  modules:
    - xcelium/1909
    - vmanager/1909
jg:
  modules:
    - jaspergold
flowkit:
  modules:
    - genus/191
    - innovus/19-12
```

Then ```runmod flowkit -- genus -helpall``` command is equivalent to:
```
module load genus/191 innovus/19-12
genus -helpall
module unload genus/191 innovus/19-12
```

Note that the `--` is the separator between `runmod` arguments and command arguments.

There also exists a shortcut for when the 'flow' or 'cannonical name' is the same name as the tool you want to invoke.

```runmod -t xrun -- -helpall``` in this example is equivalent to:

```
module load xcelium/1909 vmanager/1909
xrun -helpall
module unload xcelium/1909 vmanager/1909
```

# Administration
An error in a single modulefile can cause the `module` command to break. As such, you must test your changes locally before pushing them to the EDA repository.

NEVER modify /tools/EDA/ directly.
You must submit your changes through git, and get the changes reviewed.
Details on how to make changes are described below in the [administration section](#administration).

To locally test changes to this repository, you need to take a few steps.
First, you need to clone the master branch of this repository, then create a branch off of master.
Then, source the env/common_bashrc.bash file in your EDA checkout.
Your $MODULEPATH variable will change from:

```/data/tools/EDA/projects:/data/tools/EDA/flows:/data/tools/EDA/modulefiles:/usr/share/Modules/modulefiles:/etc/modulefiles```

to something like:

```/data/proj/wstucker/EDA/projects:/data/proj/wstucker/EDA/flows:/data/proj/wstucker/EDA/modulefiles:/data/tools/EDA/projects:/data/tools/EDA/flows:/data/tools/EDA/modulefiles:/usr/share/Modulesfiles:/etc/modulefiles```

You now have modulefiles from your local checkout and from the common tools area in your path.

Check that if you do a ```module avail``` that your checkout path is listed first. Example:

```[wstucker@mach-2 EDA]$ module avail genus

---------------------------------------------------------------------------------------- /data/tools/EDA/modulefiles -----------------------------------------------------------------------------------------
genus/181           genus/191           genus/1912-2        genus/1913          genus/1915          genus/1916          genus/2010          genus/2011(default)
```

Follow different steps below to make your appropriate edits. Make sure that your new or updated module:

1. Is listed correctly with ```module avail```
2. Can be loaded with ```module load <your_module/version>```
3. Your module-based tools are working correctly when invoked through runmod.

When you are satisfied with your changes, release the changes by following these steps:
1. Commit and push your changes to your branch
2. Create a Pull Request for your branch into the EDA master branch
3. When that Pull Request completes, ask the reviewer that approved your Pull Request to update the published version. They will need to run: ```cd /tools/EDA && git pull``` to update the published version.

## Creating a module for a new tool
Use the cookiecutter template in the modulefiles/template directory to create a new modulefile

```
cd modulefiles
cookecutter template
<follow onscreen menu>
```

## Releasing a new version of a tool with an existing modulefile
* *cd* to the appropriate directory in modulefiles
* *cp* and existing file (ideally the latest)
* Modify the new file to do the right thing.
* Once you've qualified the release, update the .version file in that directory to change the default to your new version.
### DO NOT EDIT EXISTING MODULE FILES
Well, only do it with extreme caution. Generally, you should create a new modulefile for each tool release. There are cases where we might want toe edit and existing one, but bumping the version number is not one of those reasons.
## Creating a New Flow
We currently have two different places to put modules: *modulefiles* and *flows*. Modulefiles is intended to capture configurations for each individual tool. Flows is intended to capture meta-modulefiles which loads modules from modulefiles to create a work "flow".
### Flows
Flows should also not be edited in place. Please create new versions when you want to upgrade the version of a tools. This allows users to easily swap back and forth between every variant of our environment.
#### Example
Releasing a new version of lumerical would be something like:

``` bash
cd modulefiles/lumerical
cp 2019b 2020a
<edit 2020a>
<edit .version file to point at 2020a>
cd ../../flows/ams_icadvm181_siph
cp v0 v1
<edit v1>
<edit .version file to point at v1>
```

## Installation
The yum package *environment-modules* has been added to our [saltstack](https://dev.azure.com/LightelligencePlatform/IT/_git/saltstack/commit/e91761e2449436c89200091423f1a07084a37be3?refName=refs%2Fheads%2Fmaster) configuration.
