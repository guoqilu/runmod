if [ -d "/eda" ]; then
    export TOOLS_INSTALL=/eda
else
    export TOOLS_INSTALL=/tools
fi

CADENCE_DIR=$TOOLS_INSTALL/cadence
export MMSIM_VER=191
export MMSIM_HOME=$CADENCE_DIR/MMSIM$MMSIM_VER
export PATH=$MMSIM_HOME/tools/bin:$MMSIM_HOME/tools/dfII/bin:$PATH; 
export LD_LIBRARY_PATH=$MMSIM_HOME/tools/inca/lib:$MMSIM_HOME/tools/lib:$MMSIM_HOME/tools/ultrasim/lib:$LD_LIBRARY_PATH;
export CDNSHELP_DOC=$MMSIM_HOME/doc:$CDNSHELP_DOC;
