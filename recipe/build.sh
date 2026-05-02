#!/bin/bash

# Downgrade the C++ standard because `throw` is no longer supported.
# We do this (instead of downgrading the compiler) to avoid any ABI compatibility issues.
# See:
# - https://github.com/conda/conda-build/issues/3097
# - https://stackoverflow.com/a/49119902/2427624
if [[ ${target_platform} =~ .*linux.* ]]; then
    CXXFLAGS="${CXXFLAGS} -std=c++14 -Wno-deprecated"
fi

./configure --prefix=${PREFIX} --with-ltl=${PREFIX} --with-libjpeg=${PREFIX}
make
make install
