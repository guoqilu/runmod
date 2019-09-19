TOOLS_INSTALL=/tools
CADENCE_DIR=$TOOLS_INSTALL/cadence
# FIXME what about IC618ISR5
export CDS_VER=618ISR5
export CDS_HOME=$CADENCE_DIR/IC$CDS_VER
export PATH=$CDS_HOME/tools/bin:$CDS_HOME/tools/dfII/bin:$PATH; 
export CDNSHELP_DOC=$CDS_HOME/doc:$CDNSHELP_DOC;
if [ -n "/eda" ]; then
    export TOOLS_INSTALL=/eda
else
    export TOOLS_INSALL=/tools
fi

