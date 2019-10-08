const path = require('path')

module.exports = {
  path: ({ version, platform, relative } = {}) => {
    let root = relative ? './' : __dirname
    return path.join(root, 'symbols', version, platform, 'breakpad_symbols')
  }
}
