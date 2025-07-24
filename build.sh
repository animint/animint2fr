#!/bin/bash
set -o errexit
PREGEX="^Package: "
PKG=$(grep $PREGEX DESCRIPTION|sed "s/$PREGEX//")
echo Package from DESCRIPTION: $PKG
cd ..

RELEASE=$PKG-release
echo Copying $PKG to $RELEASE
rm -rf $RELEASE
cp -r $PKG $RELEASE

echo Editing $RELEASE
rm $RELEASE/inst/translate.R

echo Building $RELEASE
RCMD="R --vanilla CMD"
$RCMD build $RELEASE | tee build.out
PKG_TGZ=$(grep building build.out|sed "s/.*\($PKG.*.tar.gz\).*/\1/")

echo Installing $PKG_TGZ
$RCMD INSTALL $PKG_TGZ

echo Checking $PKG_TGZ
$RCMD check --as-cran $PKG_TGZ

echo Checking without any Suggests
R -e "if('check_without_suggests' %in% ls())check_without_suggests('$PKG_TGZ')"
