# Purpose
We are using [environment-modules](https://modules.readthedocs.io/en/latest/index.html) to handle configuration of our environment.

This allows to create reproducible and somewhat isolated environments.

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
runmod is a small wrapper around the module tool that dynamically loads modules and then runs the rest of a command. This allows for a more heterogeneous tool-suite as tools only have their environment setup when they are being executed. Many tools come prepackaged with their own version of certain libraries which can accidentally get picked up by other tools.

#### Examples:
If tools.yaml contains the following content:
``` yaml
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
An error in a single modulefile can cause the module command to break. As such, you must test your changes locally before pushing them to /tools/EDA.

You need to checkout this repository. Then source the env/common_bashrc.bash file in your checkout. Your $MODULEPATH variable will change from:

```/data/tools/EDA/projects:/data/tools/EDA/flows:/data/tools/EDA/modulefiles:/usr/share/Modules/modulefiles:/etc/modulefiles```

to something like:

```/data/proj/wstucker/EDA/projects:/data/proj/wstucker/EDA/flows:/data/proj/wstucker/EDA/modulefiles:/data/tools/EDA/projects:/data/tools/EDA/flows:/data/tools/EDA/modulefiles:/usr/share/Modulesfiles:/etc/modulefiles```

You now have modulefiles from your local checkout and from the common tools area in your path.

Check that if you do a ```module avail``` that your checkout path is listed first. Example:

```(base) [wstucker@mach-2 EDA]$ module avail                                       
                                                                                 
----------------------- /data/proj/wstucker/EDA/projects ----------------------- 
mosaic/1.0(default)                                                              
```

Follow different steps below to make your appropriate edits. Make sure that your new or updated module:

1. Is listed correctly with ```module avail```
2. Can be loaded with ```module load <your_module/version>```
3. The tools works after loading

When everything is working the release steps are as follows:
1. Commit and push your changes to master (or a branch if significant)
2. Push your changes back to origin
3. If you are a member of the eda-admin group: ```cd /tools/EDA && git pull``` to update the published version.
4. If you are not a a member of the [eda-admin group](https://ipa2.lgt.ai/ipa/ui/#/e/group/member_user/eda-admins), pick your least favorite member and ask them to perform step 3.

## Releasing a new tool
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
