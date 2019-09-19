if [ -d "/eda" ]; then
    export TOOLS_INSTALL=/eda
else
    export TOOLS_INSTALL=/tools
fi

if [ -n "$LM_LICENSE_FILE" ]; then
    export LM_LICENSE_FILE=$LM_LICENSE_FILE:27011@Faraday-1.opu.tv
else
    export LM_LICENSE_FILE=27011@Faraday-1.opu.tv
fi

# Set HOME and PATH Variables
export LUMTOOLS=$TOOL_INSTALL/lumerical
export INTERCONNECT_HOME=$LUMTOOLS/interconnect

if [ -n "$INTERCONNECT_HOME" ]; then
        export PATH=$INTERCONNECT_HOME/bin:$PATH;
        export LD_LIBRARY_PATH=$INTERCONNECT_HOME/interfaces/cadence/spectre:$LD_LIBRARY_PATH;
fi
