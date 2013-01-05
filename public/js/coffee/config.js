require.config({
    paths: {
        cs: '../libs/require/cs',
        'coffee-script': '../libs/coffeescript/coffee-script',
        jquery: '../libs/jquery/jquery',
        xdomain: '../libs/jquery/jQuery.XDomainRequest',
        underscore: '../libs/underscore/underscore',
        backbone: '../libs/backbone/backbone',
        handlebars: '../libs/handlebars/handlebars',
        //text: '../libs/require/text',
        templates: 'templates',
        JST: '../coffee/templates/JST',
        models: 'models',
        views: 'views',
        collections: 'collections',
        routers: 'routers',
        utils: 'utils',
        //kendo: '../libs/kendoui/kendo.web.min',
        //kendoBackbone: '../libs/backbone/kendo.backbone',
        modalPlugin: '../libs/bootstrap/bootstrap-modal'
    },
    shim: {
        'backbone': {
            deps: ['underscore', 'jquery'],
            exports: 'Backbone',
            init: function(_, $) {
                _.noConflict();
                $.noConflict();
                return this.Backbone.noConflict();
            }
        },
        'kendo': {
          deps: ['jquery'],
          exports: 'kendo'
        },
        //'kendoBackbone': ['kendo'],
        'xdomain': ['jquery'],
        'modalPlugin': ['jquery'],
        'JST': ['handlebars']
    }
});

require(['main']);
