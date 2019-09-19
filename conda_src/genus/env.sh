if [ -n "/eda" ]; then
    export TOOLS_INSTALL=/eda
else
    export TOOLS_INSALL=/tools
fi

TOOLS_INSTALL=/tools
CADENCE_DIR=$TOOLS_INSTALL/cadence
export GENUS_VER=191
export GENUS_HOME=$CADENCE_DIR/GENUS$GENUS_VER
export PATH=$GENUS_HOME/tools/bin:$GENUS_HOME/tools/dfII/bin:$PATH; 
export CDNSHELP_DOC=$GENUS_HOME/doc:$CDNSHELP_DOC;
