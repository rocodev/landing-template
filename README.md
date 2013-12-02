Logdown Landing Template
========================

This is an empty Rails app generated with `bootstrappers`, and offer an seperated landing layout as an template.

This Rails app features a entirely independent set of landing stylesheets, with its own build of Bootstrap 2.3.2, so it don't need to share settings with the `application.css`.

The template also tries to split styles into components and pages, making it easier for future maintenance.

### Structures

* views/layouts/landing.html.erb
* views/landing/
* views/pages/welcome.html.erb
* views/pages/pricing.html.erb
* views/pages/tours.html.erb
* views/pages/explore.html.erb
* assets/stylesheets/landing/index.css.scss
* assets/javascripts/landing.js.coffee
* vendor/assets/javascripts/jquery.inview.js

### Responsive Styles

All responsive styles powered by media queries, are wrapped as `@mixin`s in `media_query_mixins.css.scss`. It has a variable `$enable-responsive` to determine whether to render responsive styles or not. If you don't want responsive styles, simply set it as `false`, and it will block all the media query mixins from rendering its content.
