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

# Admin page.
Router.route '/admin',
    layoutTemplate: 'adminLayout'
    template: 'admin'
    yieldTemplates:
        header:
            to: 'header'
        footer:
            to: 'footer'
        'admin-sidebar':
            to: 'admin-sidebar'

# Documentation/help section.
Router.route '/docs'

# About page.
Router.route '/about'
