const { environment } = require('@rails/webpacker')


//appending jquery and popper.js in your application
const webpack = require('webpack')
environment.plugins.append('Provide', new
webpack.ProvidePlugin({$: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
}));          

module.exports = environment
