/// <binding BeforeBuild='build' Clean='clean' ProjectOpened='default' />
var gulp = require('gulp'),
    fs = require('fs'),
    loadPlugins = require('gulp-load-plugins');

var plugins = loadPlugins();


/**
 * Watch for file changes and reload
 */
gulp.task('watch', function () {

    plugins.livereload.listen();
    gulp.watch('Css/sass/**/*.scss', ['styles']);
    gulp.watch([
        'Css/*.css',
        'Scripts/**/*.js',
        'Views/**/*.cshtml'
    ]).on('change', plugins.livereload.changed);
});


/**
 * Compile SASS to CSS
 */
gulp.task('styles', function () {
    return gulp.src('Css/sass/screen.scss')
        .pipe(plugins.plumber())
        .pipe(plugins.sourcemaps.init())
        .pipe(plugins.sass({
            errLogToConsole: true
        }))
        .pipe(plugins.autoprefixer())
        .pipe(plugins.sourcemaps.write())
        .pipe(gulp.dest('Css'));
});


/**
 * Load scripts from build:js block in template and minify
 */
gulp.task('jsmin', function () {
    return gulp.src('Views/_Layout.cshtml')
        .pipe(plugins.readmin({ type: 'js' }))
        .pipe(plugins.concat('minified.js'))
        .pipe(plugins.uglify())
        .pipe(gulp.dest('scripts'));
});


/**
 * Load styles from build:css block in template and minify
 */
gulp.task('cssmin', function () {
    return gulp.src('Views/_Layout.cshtml')
        .pipe(plugins.readmin({ type: 'css' }))
        .pipe(plugins.concat('minified.css'))
        .pipe(plugins.cssnano())
        .pipe(gulp.dest('css'));
});


/**
 * Default task
 */
gulp.task('default', ['styles', 'cssmin', 'jsmin', 'watch']);


/**
 * Build
 */
gulp.task('build', ['clean', 'styles', 'cssmin', 'jsmin']);



/**
 * Delete generated/linked files
 */
gulp.task('clean', function (cb) {
    try {
        fs.unlinkSync('css/minified.css');
        fs.unlinkSync('scripts/minified.js');
    } catch (err) {
        //do nothing ;-)
    }
    cb();
});
