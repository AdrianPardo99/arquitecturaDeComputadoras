#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2019.2 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Tue Mar 24 17:50:39 CST 2020
# SW Build 2708876 on Wed Nov  6 21:39:14 MST 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xelab -wto f84e2d63cf484a8bad1e840105d2ee28 --incr --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot TB_CONT_GEN_behav xil_defaultlib.TB_CONT_GEN -log elaborate.log"
xelab -wto f84e2d63cf484a8bad1e840105d2ee28 --incr --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot TB_CONT_GEN_behav xil_defaultlib.TB_CONT_GEN -log elaborate.log

