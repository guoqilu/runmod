if [ -d "/eda" ]; then
    export TOOLS_INSTALL=/eda
else
    export TOOLS_INSTALL=/tools
fi

CADENCE_DIR=$TOOLS_INSTALL/cadence
export JOULE_VER=181
export JOULE_HOME=$CADENCE_DIR/JLS$JOULE_VER
export PATH=$JOULE_HOME/tools/bin:$JOULE_HOME/tools/dfII/bin:$PATH; 
export CDNSHELP_DOC=$JOULE_HOME/doc:$CDNSHELP_DOC;
