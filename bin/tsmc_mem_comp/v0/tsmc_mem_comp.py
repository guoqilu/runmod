#!/usr/bin/env python
""" Wrapper around TSMC memory compilers
Copyright (C) 2022 Lightelligence

"""
import sys
import os
import subprocess
import argparse

DEF_COMP_DIR = "/foundry/TSMC/tsmcn6_china/tsmcn06/SRAM/TSMCHOME/sram/Compiler/"
DEF_OUT_DIR = "/data/proj/vanguard/forerider/p1.0/pd/memory/"
DEF_REL_DATE = "20151201"
DEF_REV = "130a"
MEM_TYPES = [
    "tsn7_1prf",
    "tsn7_2prf",
    "tsn7_dpsram",
    "tsn7_hdspmbsram",
    "tsn7_hdspsbsram",
    "tsn7_hsspsram",
    "tsn7_l1cache",
    "tsn7_spmbsram",
    "tsn7_spsbsram",
    "tsn7_uhd1prf",
    "tsn7_uhd2prf",
    "tsn7_uhdspsram"
]

def parse_args(argv):
    parser = argparse.ArgumentParser(description="Call a TSMC memory compiler to generate a new memory",
                                     formatter_class=argparse.RawTextHelpFormatter)

    parser.add_argument("--type",
                        required=True,
                        choices=MEM_TYPES,
                        help="type of memory to generate",
                        )
    parser.add_argument("--compiler-args",
                        required=True,
                        help="Arguments to pass to the memory compiler",
                        )
    parser.add_argument("--rel-date",
                        default=DEF_REL_DATE,
                        help="release data of the memory from TSMC",
                        )
    parser.add_argument("--rev",
                        default=DEF_REV,
                        help="revision of the memory from TSMC",
                        )
    parser.add_argument("--out-dir",
                        default=DEF_OUT_DIR,
                        help="Path for memory compiler outputs to be generated")
    parser.add_argument("--compiler-dir",
                        default=DEF_COMP_DIR,
                        help="Path to the memory compiler from TSMC")
    options = parser.parse_args(argv)
    return options

def main(options):
    mc_home = f"{options.compiler_dir}/{options.type}_{options.rel_date}_{options.rev}"
    comp_cmd = f"{options.type}_{options.rev}.exe {options.compiler_args}"
    cwd = os.getcwd()
    cmd = f"cd {options.out_dir} && source /tools/EDA/env/common_bashrc.bash && module load mc2 && export MC_HOME={mc_home} && export PATH=$MC_HOME:$PATH && {comp_cmd} && cd {cwd}"
    
    subprocess.check_call(cmd, stdout=sys.stdout, stderr=subprocess.STDOUT, executable="/usr/bin/bash", shell=True)

if __name__ == "__main__":
    options = parse_args(sys.argv[1:])
    main(options)
