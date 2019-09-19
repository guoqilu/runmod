if [ -n "/eda" ]; then
    export TOOLS_INSTALL=/eda
else
    export TOOLS_INSALL=/tools
fi

AGNISYS_DIR=/tools/agnisys
export AGNI_LICENSE_FILE="$AGNISYS_DIR/license.dat"
export PATH="$AGNISYS_DIR/idsbatch:$PATH"
