// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
// require popper.min
// require bootstrap.min
//= require bootstrap-sprockets
//= require bootstrap-select.min
//= require turbolinks
//= require jquery.inputmask.bundle.js
//= require dropzone
//= require select2
//= require select2_locale_ru
//= require icheck
//= require_tree .

function locale() {
    return $('.language').data('i18n');
}

$(document).on('turbolinks:load', function(){
    $('.selectpicker').selectpicker();

    $('.span-checkbox').on('click', function () {
        $(this).parent().find('input[type="checkbox"]').trigger('click');
    });

    $('input.custom-checkbox').iCheck({
        checkboxClass: 'icheckbox_flat-blue',
        radioClass: 'iradio_flat-blue'
    });
});

$(document).on('turbolinks:before-cache', function(){
    $('.selectpicker').selectpicker('destroy').addClass('selectpicker');
});
