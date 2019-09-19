if [ -n "/eda" ]; then
    export TOOLS_INSTALL=/eda
else
    export TOOLS_INSALL=/tools
fi

TOOLS_INSTALL=/tools
CADENCE_DIR=$TOOLS_INSTALL/cadence
export MODUS_VER=181
export MODUS_HOME=$CADENCE_DIR/MODUS$MODUS_VER
export PATH=$MODUS_HOME/tools/bin:$MODUS_HOME/tools/dfII/bin:$PATH; 
export CDNSHELP_DOC=$MODUS_HOME/doc:$CDNSHELP_DOC;
