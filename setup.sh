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
make scripts
make clean build 

#cd ../pulp-runtime-examples/hello
#cd ../pulp-rt-examples/hello
#cd ../sw/hello
#cd ../sw/runtime-trivial-driver
#cd ../sw/runtime-reggen
#make clean all run gui=1
#make clean all run

#cd ../sw/memlayout-exercise/mem_test
#cd ../sw/memlayout-exercise/link_test
#make clean all run

#cd ../sw/fullstack_ip_integration
#make clean all run

#cd ../Keccak
#make clean all run


