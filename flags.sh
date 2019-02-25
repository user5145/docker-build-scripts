#!/bin/sh
#
# you may want to change -march= to x86-64 and -mtune= to generic
# FLAGS+=" -march=native           -mtune=native"
# FLAGS+=" -march=native           -mtune=generic"
  FLAGS+=" -march=x86-64           -mtune=native"
# FLAGS+=" -march=x86-64           -mtune=generic"
#
#
# instructions supported by everything from this century (bulldozer(Steamroller)+, Sandy Bridge+)
# these may slow down performance -ftree-vectorize -ftree-slp-vectorize
  FLAGS+=" -O2 -pipe -fstack-protector-strong -fno-plt -mmmx -msse -msse2 -mssse3 -msse3 -msse4.1 -msse4.2 -mfpmath=sse -mfma -mf16c -mpclmul -mpopcnt -mlzcnt -mavx -maes -mbmi -mbmi2 -mxsave -mxsaveopt -frecord-gcc-switches -D_FORTIFY_SOURCE=1"
# 
# This is for fun
  FLAGS+=" -mxsavec -mxsaves -mavx2"
#
#
# to check flags
# gcc -march=generic -Q --help=target
