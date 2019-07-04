const path = require('path');

module.exports = {
  entry: './_assets/js/app.js',
  mode: 'development',
  devtool: 'source-map',
  output: {
    filename: 'app.js',
    path: path.resolve(__dirname, 'assets/js')
  }
};