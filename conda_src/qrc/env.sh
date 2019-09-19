if [ -n "/eda" ]; then
    export TOOLS_INSTALL=/eda
else
    export TOOLS_INSALL=/tools
fi

TOOLS_INSTALL=/tools
CADENCE_DIR=$TOOLS_INSTALL/cadence
export QRC_VER=191
export QRC_HOME=$CADENCE_DIR/EXT$QRC_VER
export PATH=$QRC_HOME/tools/bin:$QRC_HOME/tools/dfII/bin:$PATH; 
export CDNSHELP_DOC=$QRC_HOME/doc:$CDNSHELP_DOC;
