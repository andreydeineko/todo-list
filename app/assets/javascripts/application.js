// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require bootstrap-editable
//= require bootstrap-editable-rails
//= require jquery.ui.sortable
//
// APPLICATION JS
//= require api
//
//= require welcome
//= require authenticated/projects
//= require authenticated/tasks
//
//
//= require_self
//

jQuery.fn.reverse = [].reverse;

$(window).bind('load', function(event) {
    $.api.controller     = document.body.id;
    $.api.action         = document.body.attributes['data-action'].value;
    $.api.body = $(document.body); // Cached body


    var controllerPath = $.camelCase($.api.controller); // E.g: authenticated-projects becomes "authenticatedProjects"
    var controllerJs   = $.api[ controllerPath ];

    if ( typeof controllerJs === 'object' ) controllerJs.init();

    $.api.loading = false;

    $.api.body.on('click', 'a.disabled', function(event) {
        event.preventDefault();
        event.stopPropagation();
    });
});

