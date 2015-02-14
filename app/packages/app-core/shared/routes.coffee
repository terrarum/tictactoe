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

# Documentation/help section.
Router.route '/docs'

# About page.
Router.route '/about'
