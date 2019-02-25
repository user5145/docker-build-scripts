#!/bin/sh
#
# you may want to change -mtune= and -march= to generic
# FLAGS_TEMP+=" -march=native      -mtune=native"
  FLAGS_TEMP+=" -march=generic     -mtune=native"
# FLAGS_TEMP+=" -march=native      -mtune=generic"
# FLAGS_TEMP+=" -march=generic     -mtune=generic"
#
#
# instructions supported by everything from this century (bulldozer(Steamroller)+, Sandy Bridge+)
# these good ones are not included -mxsavec -mxsaves -mavx2 -msse2avx
# these may slow down performance -ftree-vectorize -ftree-slp-vectorize
# FLAGS_TEMP+=" -O2 -pipe -fstack-protector-strong -fno-plt -mmmx -msse -msse2 -mssse3 -msse3 -msse4.1 -msse4.2 -mfpmath=sse -mfma -mf16c -mpclmul -mpopcnt -mlzcnt -mavx -maes -mbmi -mbmi2 -mxsave -mxsaveopt -frecord-gcc-switches -D_FORTIFY_SOURCE=1"
#
# these instructions are for everything usable
FLAGS_TEMP+=" -O2 -pipe -fstack-protector-strong -fno-plt -mmmx -msse -msse2 -mssse3 -msse3 -msse4.1 -msse4.2 -mfpmath=sse -mfma -mf16c -mpclmul -mpopcnt -mlzcnt -mavx -mavx2 -maes -mbmi -mbmi2 -mxsave -mxsavec -mxsaveopt -mxsaves -frecord-gcc-switches -D_FORTIFY_SOURCE=1"
# 
# This is for fun
# FLAGS_TEMP+=" -O2 -pipe -fstack-protector-strong -fno-plt -frecord-gcc-switches -D_FORTIFY_SOURCE=1"
#
#
# to check flags
# gcc -march=generic -Q --help=target
