define (require) ->
    BussinessEntityFormView = require 'views/BussinessEntityFormView'

    class BussinessEntityCommonFormView extends BussinessEntityFormView

        render: (spec) ->
            super(spec)
