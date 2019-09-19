if [ -n "/eda" ]; then
    export TOOLS_INSTALL=/eda
else
    export TOOLS_INSALL=/tools
fi

TOOLS_INSTALL=/tools
CADENCE_DIR=$TOOLS_INSTALL/cadence
export XCELIUM_VER=1809
export XCELIUM_HOME=$CADENCE_DIR/XCELIUM$XCELIUM_VER
export PATH=$XCELIUM_HOME/tools/bin:$XCELIUM_HOME/tools/dfII/bin:$PATH; 
export CDNSHELP_DOC=$XCELIUM_HOME/doc:$CDNSHELP_DOC;
