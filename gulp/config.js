var publicAssets = "./public/assets";
var sourceFiles = "./gulp/assets";

module.exports = {
  publicAssets: publicAssets,
  browserSync: {
    proxy: 'localhost:3000',
    files: ['./app/views/**']
  },
  sass: {
    src: sourceFiles + "/stylesheets/**/*.{sass,scss}",
    dest: publicAssets + "/stylesheets",
    settings: {
      imagePath: '/assets/images' // Used by the image-url helper
    }
  },
  images: {
    src: sourceFiles + "/images/**",
    dest: publicAssets + "/images"
  },
  fonts: {
    src: sourceFiles + "/fonts/**",
    dest: publicAssets + "/fonts"
  },
  bower: {
    src: "bower.json",
    dest: publicAssets + '/javascripts',
    overrides: { // These bower modules' 'main' is not declared, so we have to do it ourselves
      "jquery-classywiggle": {
        main: ["./src/js/jquery.classywiggle.js"]
      }
    }
  },
  vendor_css: {
    src: ["bower_components/bootstrap/dist/css/bootstrap.min.css", "bower_components/country-select-js/build/css/countrySelect.min.css", "bower_components/jquery-ui/themes/flick/jquery-ui.min.css"],
    dest: publicAssets + '/stylesheets'
  },
  browserify: {
    bundleConfigs: [{
      entries: sourceFiles + '/javascripts/global.js',
      dest: publicAssets + '/javascripts',
      outputName: 'global.js',
      extensions: ['.js', '.coffee']
    }]
  }
};
