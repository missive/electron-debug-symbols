# electron-debug-symbols
npm module to install brave/electron debug symbols

# usage
```javascript
var minidump = require("minidump")
minidump.addSymbolPath.apply(minidump, require("electron-debug-symbols").pathsForVersion('x.x.x'))

// now when using minidump.walkStack, it would give a more understandable report due to having debug symbols
```

You can use BRAVE_VERSIONS environment variables to make the module install custom versions, for example when deploying to Heroku.
```
heroku config:set BRAVE_VERSIONS="0.29.2 0.27.1"
```