#!/usr/bin/env bash

if [ -z "$ELECTRON_VERSIONS" ]; then
  echo "Need to set ELECTRON_VERSIONS to at least one electron version"
  exit 1
fi

for VERSION in `echo $ELECTRON_VERSIONS`; do
  mkdir -p symbols/{win32-ia32-$VERSION,win32-x64-$VERSION,darwin-$VERSION,linux-$VERSION}

  if [ `which bsdtar` ] && [ ! $FORCE_UNZIP ]; then
    cmd="bsdtar -xvf-"
    ( cd symbols/win32-ia32-$VERSION ; wget -O - https://github.com/electron/electron/releases/download/v${VERSION}/electron-v${VERSION}-win32-ia32-symbols.zip | $cmd )
    ( cd symbols/win32-x64-$VERSION ; wget -O - https://github.com/electron/electron/releases/download/v${VERSION}/electron-v${VERSION}-win32-x64-symbols.zip | $cmd )
    ( cd symbols/darwin-$VERSION ; wget -O - https://github.com/electron/electron/releases/download/v${VERSION}/electron-v${VERSION}-darwin-x64-symbols.zip | $cmd )
    ( cd symbols/linux-$VERSION; wget -O - https://github.com/electron/electron/releases/download/v${VERSION}/electron-v${VERSION}-linux-x64-symbols.zip | $cmd )
  elif [ `which unzip` ]; then
    cmd="unzip -x"
    ( cd symbols/win32-ia32-$VERSION ; wget -O - https://github.com/electron/electron/releases/download/v${VERSION}/electron-v${VERSION}-win32-ia32-symbols.zip > /tmp/win32-ia32.zip ; $cmd /tmp/win32-ia32.zip )
    ( cd symbols/win32-x64-$VERSION ; wget -O - https://github.com/electron/electron/releases/download/v${VERSION}/electron-v${VERSION}-win32-x64-symbols.zip > /tmp/win32-x64.zip ; $cmd /tmp/win32-x64.zip )
    ( cd symbols/darwin-$VERSION ; wget -O - https://github.com/electron/electron/releases/download/v${VERSION}/electron-v${VERSION}-darwin-x64-symbols.zip > /tmp/darwin.zip ; $cmd /tmp/darwin.zip )
    ( cd symbols/linux-$VERSION ; wget -O - https://github.com/electron/electron/releases/download/v${VERSION}/electron-v${VERSION}-linux-x64-symbols.zip > /tmp/linux.zip ; $cmd /tmp/linux.zip )
  fi
done
