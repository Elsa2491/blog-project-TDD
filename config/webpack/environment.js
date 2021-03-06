// const { environment } = require('@rails/webpacker')

// const webpack = require('webpack');

// // Preventing Babel from transpiling NodeModules packages
// environment.loaders.delete('nodeModules');

// // Bootstrap 4 has a dependency over jQuery & Popper.js:
// //environment.plugins.prepend('Provide',
// environment.plugins.prepend('Provide',
//   new webpack.ProvidePlugin({
//     $: 'jquery',
//     jQuery: 'jquery',
//     Popper: ['popper.js', 'default']
//   })
// );

// module.exports = environment


const { environment } = require('@rails/webpacker')

// Bootstrap 4 has a dependency over jQuery & Popper.js:
const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
)

module.exports = environment
