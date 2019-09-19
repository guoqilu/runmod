if [ -d "/eda" ]; then
    export TOOLS_INSTALL=/eda
else
    export TOOLS_INSTALL=/tools
fi

CADENCE_DIR=$TOOLS_INSTALL/cadence
export JLS_VER=191
export PATH=$CADENCE_DIR/JLS$JLS_VER/tools.lnx86/bin:$PATH
export PATH=$CADENCE_DIR/JLS$JLS_VER/tools.lnx86/bin/64bit:$PATH
