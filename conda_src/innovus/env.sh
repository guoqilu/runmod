if [ -d "/eda" ]; then
    export TOOLS_INSTALL=/eda
else
    export TOOLS_INSTALL=/tools
fi

CADENCE_DIR=$TOOLS_INSTALL/cadence
export INNOVUS_VER=191
export INNOVUS_HOME=$CADENCE_DIR/INNOVUS$INNOVUS_VER
export PATH=$INNOVUS_HOME/tools/bin:$INNOVUS_HOME/tools/dfII/bin:$PATH; 
export CDNSHELP_DOC=$INNOVUS_HOME/doc:$CDNSHELP_DOC;
