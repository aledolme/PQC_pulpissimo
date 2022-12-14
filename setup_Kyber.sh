#!/bin/bash

source /software/europractice-release-2019/scripts/init_questa10.7c
export PULP_RISCV_GCC_TOOLCHAIN=$HOME/riscv-pulp
export PATH=$PULP_RISCV_GCC_TOOLCHAIN/bin:$PATH
export VSIM_PATH=$HOME/Desktop/PULPissimo/pulpissimo

source $HOME/Desktop/PULPissimo/pulp-runtime/configs/pulpissimo.sh

cd pulpissimo
make checkout
source setup/vsim.sh
env | grep VSIM
make clean build  

cd ../Kyber
make -f Makefile clean all run


