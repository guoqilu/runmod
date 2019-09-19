if [ -d "/eda" ]; then
    export TOOLS_INSTALL=/eda
else
    export TOOLS_INSTALL=/tools
fi

export SYNOPSYS=$TOOLS_INSTALL/synopsys
# Not sure if synopsys needs the above variable defined, so redefining
SYNOPSYS_DIR=$SYNOPSYS

export PATH=$SYNOPSYS_DIR/customcompiler/O-2018.09-SP1/bin:$PATH
export PATH=$SYNOPSYS_DIR/finesim/O-2018.09-SP1/bin:$PATH
export PATH=$SYNOPSYS_DIR/vcs/O-2018.09-SP1/bin:$PATH
export PATH=$SYNOPSYS_DIR/wv/O-2018.09-SP1/bin:$PATH
export PATH=$SYNOPSYS_DIR/pts/O-2018.06-SP5/bin:$PATH
export PATH=$SYNOPSYS_DIR/spyglass/SPYGLASS2018.09-SP1/SPYGLASS_HOME/bin:$PATH
export PATH=$SYNOPSYS_DIR/scl/2018.06/linux64/bin:$PATH
export PATH=$SYNOPSYS_DIR/verdi/Verdi_O-2018.09-SP1/bin:$PATH
export PATH=$SYNOPSYS_DIR/xa/O-2018.09-SP3/bin:$PATH
export PATH=$SYNOPSYS_DIR/hsim/O-2018.09-SP3/hsimplus/bin:$PATH
export PATH=$SYNOPSYS_DIR/mw/O-2018.06-SP5/bin:$PATH
export PATH=$SYNOPSYS_DIR/vcs-mx/O-2018.09-SP1/bin:$PATH
export PATH=$SYNOPSYS_DIR/lc/O-2018.06-SP5/bin:$PATH
export PATH=$SYNOPSYS_DIR/starrc/O-2018.06-SP5/bin:$PATH
export PATH=$SYNOPSYS_DIR/vc_ml_platform/2018.09-SP1/mlplatform/bin:$PATH
export PATH=$SYNOPSYS_DIR/syn/O-2018.06-SP5/bin:$PATH
export PATH=$SYNOPSYS_DIR/finesim/O-2018.09-SP1/bin:$PATH
export PATH=$SYNOPSYS_DIR/hspice/O-2018.09-SP1/hspice/bin:$PATH
export PATH=$SYNOPSYS_DIR/embedit/P-2019.06-SP1/bin:$PATH

export VERDI_HOME=$SYNOPSYS_DIR/verdi/Verdi_O-2018.09-SP1/
export VCS_HOME=$SYNOPSYS_DIR/vcs/O-2018.09-SP1/
#alias vcs="vcs -full64"
