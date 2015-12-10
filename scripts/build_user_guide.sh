#!/bin/bash

OUTDIR=../builds
GENDIR=templates
SOURCE=../source
VERSION=latest

pandoc -s -S --toc \
   -H $GENDIR/include.html \
   -B $GENDIR/header_main.html \
   -B $GENDIR/header_version.html \
   -B $GENDIR/header_title.html \
   -A $GENDIR/footer.html \
	$SOURCE/01_introduction.txt \
	$SOURCE/02_installation.txt \
	$SOURCE/03_dungeon_actor.txt \
	$SOURCE/03A_config_parameters.txt \
-o "$OUTDIR/user_guide_$VERSION.html"
