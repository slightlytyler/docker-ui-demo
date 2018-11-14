const HtmlWebpackPlugin = require('html-webpack-plugin');
const path = require('path');

const ROOT = path.resolve(__dirname, '.');

module.exports = {
  mode: 'production',
  entry: path.resolve(ROOT, 'src/main.js'),
  output: {
    path: path.resolve(ROOT, 'dist'),
    filename: 'bundle.js'
  },
  plugins: [
    new HtmlWebpackPlugin()
  ],
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /(node_modules)/,
        use: 'babel-loader'
      }
    ]
  }
};
