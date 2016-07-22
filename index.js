var path = require("path")
var _ = require('underscore')

var platforms = [
  'darwin',
  'linux',
  'win32-ia32',
  'win32-x64'
]

module.exports = {
  pathsForVersion: function(ver) {
    return _.map(platforms, function (platform) {
      return path.join(__dirname, 'symbols', platform + '-' + ver, 'brave.breakpad.syms')
    })
  }
}
