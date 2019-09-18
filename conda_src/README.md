# Caveat: This is a work in progress

# WTF is this thing?
This directory is the source of our local conda pacakges.

For now, these packages just export environment variables rather than building any interesting source code.

# How to build a new version
## Prerequisites
conda install conda-build

## Edit your desired package
1. Update env.sh with your new values
2. Edit meta.yaml with a incremented version number

## Build
`cd <package_dir>`

`conda build .`

## Release
FIXME: maybe directly output to new folder for release?

`conda build . --output-folder /tools/eda/conda_release`

# How to consume packages
You need to add /tools/eda/conda_release to your channels inside your environment.yaml:
```
channels:
 - conda-forge
 - file:///tools/eda/conda_release
```
Then just specify the packages inside your dependencies list.

# FIXME
There are not currently any deactivate scripts, so deactivated an environment doesn't have much effect.