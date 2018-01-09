const path = require('path')
const fs = require('fs')

const platforms = [
  'darwin',
  'linux',
  'win32-ia32',
  'win32-x64',
]

module.exports = {
  // return all symbol directories (including all versions)
  paths: ({ relative } = {}) => {
    let root = relative ? './' : __dirname
    let dirs = fs.readdirSync(path.join(root, 'symbols'))
    return dirs.map((dir) => {
      return path.join(root, 'symbols', dir, 'electron.breakpad.syms')
    })
  },

  // return all symbol directories for a specific electron version
  pathsForVersion: (version, { relative } = {}) => {
    return platforms.map((platform) => {
      let root = relative ? './' : __dirname
      return path.join(__dirname, 'symbols', platform + '-' + version, 'electron.breakpad.syms')
    })
  }
}
