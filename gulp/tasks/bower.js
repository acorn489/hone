var changed = require('gulp-changed');
var gulp = require('gulp');
var config = require('../config').bower;
var filter = require("gulp-filter");
var concat = require("gulp-concat");
var mainBowerFiles = require("gulp-main-bower-files");
var browserSync = require('browser-sync');

gulp.task("bower", function() {
  var assetFilter = filter("**/*.js", {restore: true});
  return gulp.src(config.src)
    .pipe(changed(config.dest))
    .pipe(mainBowerFiles())
    .pipe(assetFilter)
    .pipe(concat("vendor.js"))
    .pipe(assetFilter.restore)
    .pipe(gulp.dest(config.dest))
    .pipe(browserSync.reload({stream: true}));
});

