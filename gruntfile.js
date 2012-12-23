module.exports = function(grunt) {
    'use strict';

    grunt.initConfig({
        jshint: {
            all: [
                'gruntfile.js',
                'public/js/src/**/*.js',
                'public/js/tests/specs/**/*.js'
            ],
            options: {
                predef: [
                    'jasmine', 'spyOn', 'it', 'console', 'describe',
                    'expect', 'beforeEach', 'waits', 'waitsFor',
                    'runs', 'define', 'require'
                ],
                node: true, es5: true, browser: true, boss: false,
                curly: false, debug: false, devel: false, eqeqeq: true,
                evil: false, forin: true, immed: true, laxbreak: true,
                newcap: true, noarg: true, noempty: false, nonew: false,
                nomen: false, onevar: false, plusplus: false, regexp: false,
                undef: true, sub: true, strict: false, white: false,
                laxcomma: false, latedef: false, trailing: true, funcscope: true,
                globals: {
                    Handlebars: true
                }
            }
        },
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
                    'public/css/custom.css': 'public/css/custom.less'
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
                options: {
                    specs: 'public/js/tests/specs/**/*Spec.js',
                    helpers: ['public/js/src/config.js', 'public/js/tests/specs/**/*Helper.js'],
                    vendor: ['public/js/tests/libs/**/*.js'],
                    host: 'http://127.0.0.1:<%= connect.test.port %>/',
                    template: 'requirejs',
                    templateOptions: {
                        requireConfig: {
                            baseUrl: '<%= requirejs.compile.options.baseUrl %>'
                        }
                    }
                }
            }
        },
        requirejs: {
            compile: {
                options: {
                    baseUrl: 'public/js/src',
                    name: 'main',
                    optimize: 'uglify',
                    preserveLicenseComments: true,
                    out: 'public/js/build/main-build.js',
                    mainConfigFile: 'public/js/src/config.js',
                    insertRequire: ['main']
                }
            }
        },
        watch: {
            all: {
                files: ['<%= jshint.all %>'],
                tasks: ['jshint'],
                options: {
                    interrupt: true
                }
            }
        },
        handlebars: {
            compile: {
                options: {
                    namespace: "JST",
                    wrapped: true,
                    processName: function(filename) {
                        return filenamel
                    },
                    processPartialName: function(filePath) {
                        var pieces = filePath.split("/");
                        return pieces[pieces.length - 1];
                    }
                },
                files: {
                    'public/js/templates/JST.js': 'public/js/templates/**/*.html'
                }
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-jshint');
    grunt.loadNpmTasks('grunt-contrib-less');
    grunt.loadNpmTasks('grunt-contrib-connect');
    grunt.loadNpmTasks('grunt-contrib-jasmine');
    grunt.loadNpmTasks('grunt-contrib-requirejs');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-handlebars');

    grunt.registerTask('default', [
        'jshint',
        'less:development',
        'handlebars',
        'connect:test',
        'jasmine:requirejs'
    ]);
    grunt.registerTask('dev', ['default']);
    grunt.registerTask('prod', [
        'jshint',
        'less:production',
        'handlebars',
        'connect:test',
        'jasmine:requirejs',
        'requirejs'
    ]);
};
