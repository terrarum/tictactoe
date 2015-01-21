Router.configure({
    layoutTemplate: 'ApplicationLayout',
    yieldTemplates: {
        'footer': {to: 'footer'}
    }
});

Router.route('/', {
    path: '/',
    template: 'index'
});
