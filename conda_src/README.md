Caveat: This is a work in progress

# What am I looking at?
This directory is the source of our local conda packages.

For now, these packages just export environment variables rather than building any interesting source code.

# How to build a new version
## Prerequisites
Only required once per user:

`conda install conda-build`

## Edit your desired package
1. Update env.sh with your new values
2. Edit meta.yaml with a incremented version number

## Build and release all the packages
`make`

## Building a single package
`cd <package_dir>`

`conda build .`

### Release
The above command created the package local for your user. You may want to regenerate this way to make the output public:

`conda build . --output-folder /tools/EDA/conda_release`

# Using packages
You need to add /tools/eda/conda_release to your channels inside your environment.yaml:
```
channels:
 - file:///tools/EDA/conda_release
 - conda-forge
```
Then just specify the packages inside your dependencies list.

# FIXME
There are not currently any deactivate scripts, so deactivated an environment doesn't have much effect.