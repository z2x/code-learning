const merge = require('webpack-merge');
const common = require('./webpack.common.js');

module.exports = merge(common, {
  devtool: 'inline-sourse-map',
  devServer: {
    contentBase: './dist'
  }
});
