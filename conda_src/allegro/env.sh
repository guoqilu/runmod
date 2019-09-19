if [ -d "/eda" ]; then
    export TOOLS_INSTALL=/eda
else
    export TOOLS_INSTALL=/tools
fi

CADENCE_DIR=$TOOLS_INSTALL/cadence
export ALLEGRO_VER=172
export ALLEGRO_HOME=$CADENCE_DIR/SPB$ALLEGRO_VER
export PATH=$ALLEGRO_HOME/tools/bin:$ALLEGRO_HOME/tools/dfII/bin:$PATH; 

export CDNSHELP_DOC=$ALLEGRO_HOME/doc:$CDNSHELP_DOC;
