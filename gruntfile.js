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
        //jasmine: {
            //requirejs: {
                //options: {
                    //specs: 'public/js/tests/specs/**/*Spec.js',
                    //helpers: ['public/js/src/config.js', 'public/js/tests/specs/**/*Helper.js'],
                    //vendor: ['public/js/tests/libs/**/*.js'],
                    //host: 'http://127.0.0.1:<%= connect.test.port %>/',
                    //template: 'requirejs',
                    //templateOptions: {
                        //requireConfig: {
                            //baseUrl: '<%= requirejs.compile.options.baseUrl %>'
                        //}
                    //}
                //}
            //}
        //},
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
                files: grunt.file.expandMapping(['*.coffee', './routes/*.coffee'], '', {
                    rename: function(destBase, destPath) {
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
        //'connect:test',
        //'jasmine:requirejs'
    ]);
    grunt.registerTask('dev', ['default']);
    grunt.registerTask('prod', [
        'coffee',
        'less:production',
        'handlebars',
        'requirejs'
        //'connect:test',
        //'jasmine:requirejs'
    ]);
};
