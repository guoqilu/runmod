if [ -d "/eda" ]; then
    export TOOLS_INSTALL=/eda
else
    export TOOLS_INSTALL=/tools
fi

#To be placed one level up from the root client directory
#e.g. if client installed in /eda/icmanage/gdpxl
#     gdpxl.baschrc file sits in /eda/icmanage

# --------------------------------------------------
# ZSH Hack
# ICManage Requires Bash Complete
# --------------------------------------------------

if [ -n "$ZSH_VERSION" ]; then
    # >>> ZSH EDA initialize >>>
    # Source EDA Environment
    #
    autoload bashcompinit   # Need for ZSH Auto-Completion
    bashcompinit            # Need for ZSH Auto-Completion
    # <<< ZSH EDA initialize <<<
fi

# Set HOME and PATH Variables
export ICM_HOME="$TOOLS_INSTALL/icmanage"
export PATH="$ICM_HOME/gdpxl/bin.lnx86-64:$ICM_HOME/gdpxl/gdm.lnx86-64:$PATH"

# Set ENV Variables
export ICM_GDP_SERVER="http://Mach2.lt.lab:5000"
export ICM_PLASTIC_SERVER="Mach2.lt.lab:8087"
export PYTHONPATH="$ICM_HOME/gdpxl/cli:$ICM_HOME/gdpxl/pypackages"
export ICM_SkillRoot="$ICM_HOME/gdpxl"
export CDS_GDM_SHLIB_LOCATION="$ICM_HOME/gdpxl/gdm.lnx86-64"

# Source ICM Collateral
source "$ICM_HOME/gdpxl/cli/noglob"
source "$ICM_HOME/gdpxl/cli/bash-completion"
