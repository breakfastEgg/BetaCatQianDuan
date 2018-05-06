const path = require('path')

function resolve (dir) {
  console.log( __filename )
  return path.join(__dirname, '..', dir)
}


export default AsyncComponent
