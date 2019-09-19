if [ -d "/eda" ]; then
    export TOOLS_INSTALL=/eda
else
    export TOOLS_INSTALL=/tools
fi

CADENCE_DIR=$TOOLS_INSTALL/cadence
export SSV_VER=181
export SSV_HOME=$CADENCE_DIR/SSV$SSV_VER
export PATH=$SSV_HOME/tools/bin:$SSV_HOME/tools/dfII/bin:$PATH; 
export CDNSHELP_DOC=$SSV_HOME/doc:$CDNSHELP_DOC;
