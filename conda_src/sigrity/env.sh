if [ -d "/eda" ]; then
    export TOOLS_INSTALL=/eda
else
    export TOOLS_INSTALL=/tools
fi

CADENCE_DIR=$TOOLS_INSTALL/cadence
export SIGRITY_VER=2018
export SIGRITY_HOME=$CADENCE_DIR/SIGRITY$SIGRITY_VER
export PATH=$SIGRITY_HOME/tools/bin:$SIGRITY_HOME/tools/dfII/bin:$PATH; 

export CDNSHELP_DOC=$SIGRITY_HOME/doc:$CDNSHELP_DOC;
