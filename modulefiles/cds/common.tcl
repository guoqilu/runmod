setenv CDSHOME $env(CADENCE_DIR)/$env(CDSBASE)

prepend-path PATH $env(CDSHOME)/tools/dfII/bin
prepend-path PATH $env(CDSHOME)/tools/bin

prepend-path LD_LIBRARY_PATH $env(CDSHOME)/tools/dfII/lib
prepend-path LD_LIBRARY_PATH $env(CDSHOME)/tools/lib

prepend-path CDNSHELP_DOC $env(CDSHOME)/doc

setenv CDS_AUTO_64BIT ALL
#setenv SPECTRE_DEFAULTS -E
setenv CDS_Netlisting_Mode Analog

setenv QRC_ENABLE_EXTRACTION t
setenv RCXTODFII_TYPE QRC

setenv CDS_LOAD_ENV addCWD
setenv CDS_LOG_PATH .
setenv CDS_DEFAULT_BROWSER firefox

setenv CDS_ERRORLOG "DIR=/tools/crashlogs"
