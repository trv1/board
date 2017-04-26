$(document).on('turbolinks:load', function(){
    var down = false;
    $('.rotate-icon').on('click', function() {
        if (down) {
            $(this).removeClass('down');
            down = false;
            // $('.in-block').show();
            $('.in-block').fadeIn(500, function() {
                $(this).show();
            });
        } else {
            $(this).addClass('down');
            down = true;
            // $('.in-block').hide();
            $('.in-block').fadeOut(500, function() {
                $(this).hide();
            });
        }
    });
});
