#!/usr/bin/env bash

if [ -z "$ELECTRON_VERSIONS" ]; then
  echo "Need to set ELECTRON_VERSIONS to at least one electron version"
  exit 1
fi

if [ -z "$PLATFORM" ]; then
  echo "Need to set PLATFORM (win32-ia32 || win32-x64 || darwin-x64 || linux-x64)"
  exit 1
fi

for VERSION in `echo $ELECTRON_VERSIONS`; do
  mkdir -p symbols/$VERSION/$PLATFORM

  if [ `which bsdtar` ] && [ ! $FORCE_UNZIP ]; then
    cmd="bsdtar -xvf-"
    ( cd symbols/$VERSION/$PLATFORM ; wget -O - https://github.com/electron/electron/releases/download/v${VERSION}/electron-v${VERSION}-${PLATFORM}-dsym.zip | $cmd )
  elif [ `which unzip` ]; then
    cmd="unzip -x"
    ( cd symbols/$VERSION/$PLATFORM ; wget -O - https://github.com/electron/electron/releases/download/v${VERSION}/electron-v${VERSION}-${PLATFORM}-dsym.zip > /tmp/${PLATFORM}.zip ; $cmd /tmp/${PLATFORM}.zip )
  fi
done
