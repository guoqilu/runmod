TOOLS_INSTALL=/tools
CADENCE_DIR=$TOOLS_INSTALL/cadence
export PVS_VER=161
export PVS_HOME=$CADENCE_DIR/PVS$PVS_VER
export PATH=$PVS_HOME/tools/bin:$PVS_HOME/tools/dfII/bin:$PATH; 
export CDNSHELP_DOC=$PVS_HOME/doc:$CDNSHELP_DOC;
