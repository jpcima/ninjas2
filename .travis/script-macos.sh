#!/bin/bash

# ---------------------------------------------------------------------------------------------------------------------
# stop on error

set -e

# ---------------------------------------------------------------------------------------------------------------------
# print shell commands

set -x


# ---------------------------------------------------------------------------------------------------------------------
# setup

export PKG_CONFIG="pkg-config --static"

if [ -z "$NOSSE" ]; then
export CFLAGS="-O3 -mtune=generic -msse -msse2 -mfpmath=sse -fvisibility=hidden -fdata-sections -ffunction-sections"
else
export CFLAGS="-O2 -fvisibility=hidden -fdata-sections -ffunction-sections"
fi

export CFLAGS="$CFLAGS -DNDEBUG"
export CXXFLAGS="$CFLAGS -fvisibility-inlines-hidden"
export CPPFLAGS="-DPIC -DNDEBUG"

export LDFLAGS="-fdata-sections -ffunction-sections -Wl,-dead_strip -Wl,-dead_strip_dylibs"

# ---------------------------------------------------------------------------------------------------------------------
# build the plugin

MACOS=true make $MAKE_ARGS
