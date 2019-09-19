if [ -d "/eda" ]; then
    export TOOLS_INSTALL=/eda
else
    export TOOLS_INSTALL=/tools
fi

AGNISYS_DIR=$TOOLS_INSTALL/agnisys
export AGNI_LICENSE_FILE="$AGNISYS_DIR/license.dat"
export PATH="$AGNISYS_DIR/idsbatch:$PATH"
