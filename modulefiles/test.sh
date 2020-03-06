#/usr/bin/bash
# Try to load all modules to make sure they are syntax correct
# This doesn't check that they actually do the right thing
export MODULEPATH=.
for d in *; do
    if [ -d $d ] && [ $d != "template" ] ; then
        for f in $d/*; do
            echo "testing $f"
            $(module load $f)
            $(module unload $f)
        done
    fi
done
