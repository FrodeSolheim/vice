#!/bin/sh

set -e

. fsbuild/plugin.pre.sh

mkdir -p $PLUGIN_BINDIR
cp x64sc$EXE $PLUGIN_BINDIR

# mkdir -p $PLUGIN_DATADIR
cp -a data/* $PLUGIN_BINDIR/

mkdir -p $PLUGIN_READMEDIR
cp README.md $PLUGIN_READMEDIR/ReadMe.txt

mkdir -p $PLUGIN_LICENSESDIR
cp \
	fsbuild/_build/vice-src/COPYING \
	$PLUGIN_LICENSESDIR/Vice.txt

# Normally, the executable is named after the package, but this isn't the case
# here:
EXECUTABLE=x64sc

. fsbuild/plugin.post.sh
