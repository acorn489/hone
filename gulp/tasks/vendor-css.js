var changed = require('gulp-changed');
var gulp = require('gulp');
var config = require('../config').vendor_css;
var concat = require("gulp-concat");
var browserSync = require('browser-sync');

gulp.task("vendor-css", function() {
  return gulp.src(config.src)
    .pipe(changed(config.dest))
    .pipe(concat("vendor.css"))
    .pipe(gulp.dest(config.dest))
    .pipe(browserSync.reload({stream: true}));
});

