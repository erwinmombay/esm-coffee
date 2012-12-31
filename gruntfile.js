module.exports = function(grunt) {
    'use strict';

    grunt.initConfig({
        less: {
            development: {
                options: {
                    paths: ['public/css']
                },
                files: {
                    'public/css/custom.css': 'public/css/custom.less'
                }
            },
            production: {
                options: {
                    paths: ['public/css'],
                    yuicompress: true
                },
                files: {
                    'public/css/custom.min.css': 'public/css/custom.less'
                }
            }
        },
        connect: {
            test: {
                port: 8000
            }
        },
        jasmine: {
            requirejs: {
                src: 'public/js/build/main.js',
                options: {
                    specs: '../tests/build/**/*Spec.js',
                    helpers: ['public/js/tests/build/**/*Helper.js'],
                    vendor: ['tests/libs/**/*.js'],
                    host: 'http://127.0.0.1:<%= connect.test.port %>/',
                    template: 'public/js/libs/require/RequireJSRunner.tmpl',
                    templateOptions: {
                        requirejs: 'public/js/libs/require/require.min.js',
                        requireConfig: {
                            baseUrl: 'public/js/build'
                        }
                    }
                }
            }
        },
        requirejs: {
            compile: {
                options: {
                    baseUrl: 'public/js/coffee',
                    optimize: 'uglify',
                    preserveLicenseComments: true,
                    dir: 'public/js/build',
                    mainConfigFile: 'public/js/coffee/config.js',
                    stubModules: ['cs', 'text'],
                    insertRequire: ['main'],
                    modules: [
                        { name: 'main', exclude: ['coffee-script'] }
                    ]
                }
            }
        },
        watch: {
            all: {
                files: ['*.coffee', './routes/*.coffee', 'public/css/**/*.less'],
                tasks: ['coffee', 'less:development'],
                options: {
                    interrupt: true
                }
            }
        },
        handlebars: {
            compile: {
                options: {
                    namespace: 'Handlebars.templates',
                    wrapped: true,
                    processName: function(filename) {
                        var pieces = filename.split('/');
                        return (pieces[pieces.length - 1]).split('.')[0];
                    },
                    processPartialName: function(filePath) {
                        var pieces = filePath.split('/');
                        return pieces[pieces.length - 1];
                    }
                },
                files: {
                    'public/js/coffee/templates/JST.js': 'public/js/coffee/templates/**/*.hbs'
                }
            }
        },
        coffee: {
            glob_to_multiple: {
                files: grunt.file.expandMapping(['*.coffee', './routes/*.coffee', 'public/js/tests/specs/**/*.coffee'], '', {
                    rename: function(destBase, destPath) {
                        var testsPath = /^\.\/public\/js\/tests\/specs\//;
                        if (testsPath.test(destPath)) {
                            destPath = destPath.replace(testsPath, 'public/js/tests/build/');
                        }
                        return destBase + destPath.replace(/\.coffee$/, '.js');
                    }
                })
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-less');
    grunt.loadNpmTasks('grunt-contrib-connect');
    grunt.loadNpmTasks('grunt-contrib-jasmine');
    grunt.loadNpmTasks('grunt-contrib-requirejs');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-handlebars');

    grunt.registerTask('default', [
        'coffee',
        'less:development',
        'handlebars'
        //'requirejs'
        //'connect:test',
        //'jasmine:requirejs'
    ]);
    grunt.registerTask('dev', ['default']);
    grunt.registerTask('prod', [
        'coffee',
        'less:production',
        'handlebars',
        'requirejs',
        'connect:test',
        'jasmine:requirejs'
    ]);
};
