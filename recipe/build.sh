#!/bin/bash

mkdir build
cd build

cmake ${CMAKE_ARGS} ../CLHEP/ -DCMAKE_INSTALL_PREFIX=${PREFIX}

make -j ${CPU_COUNT}
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
make test
fi
make install

