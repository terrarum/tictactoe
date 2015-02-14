# Default routing options.
Router.configure
    layoutTemplate: 'mainLayout'
    yieldTemplates:
        header:
            to: 'header'
        footer:
            to: 'footer'

# Homepage.
Router.route '/',
    template: 'index'

# About page.
Router.route '/about'

# Documentation/help section.
Router.route '/game',
    path: '/game/:_id'
    data: ->
        return Games.find _id: @.params.id