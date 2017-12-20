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
  paths: () => {
    let dirs = fs.readdirSync(path.join(__dirname, 'symbols'))
    return dirs.map((dir) => {
      return path.join(__dirname, 'symbols', dir, 'electron.breakpad.syms')
    })
  },

  // return all symbol directories for a specific electron version
  pathsForVersion: (version) => {
    return platforms.map((platform) => {
      return path.join(__dirname, 'symbols', platform + '-' + version, 'electron.breakpad.syms')
    })
  }
}
