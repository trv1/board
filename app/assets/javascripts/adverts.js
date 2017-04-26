$(document).on('turbolinks:load', function(){
    var down = false;
    $('.rotate-icon').on('click', function() {
        if (down) {
            $(this).removeClass('down');
            down = false;
            $('.in-block').show(500);
        } else {
            $(this).addClass('down');
            down = true;
            $('.in-block').hide(500);
        }
    });
});
