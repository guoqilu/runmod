TOOLS_INSTALL=/tools
CADENCE_DIR=$TOOLS_INSTALL/cadence
export ALLEGRO_VER=172
export ALLEGRO_HOME=$CADENCE_DIR/SPB$ALLEGRO_VER
export PATH=$ALLEGRO_HOME/tools/bin:$ALLEGRO_HOME/tools/dfII/bin:$PATH; 
if [ -n "/eda" ]; then
    export TOOLS_INSTALL=/eda
else
    export TOOLS_INSALL=/tools
fi

export CDNSHELP_DOC=$ALLEGRO_HOME/doc:$CDNSHELP_DOC;
