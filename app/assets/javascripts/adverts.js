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

    $('.brand-name').on('click', function () {
        $('[name="brand"]').val($(this).data('id'));
        $('.selectpicker').selectpicker('refresh');
    });

    $('.brand-all').on('click', function () {
        $('.popular-brands').hide(500);
        $('.all-brands').show(500);
    });

    $('.brand-popular').on('click', function () {
        $('.all-brands').hide(500);
        $('.popular-brands').show(500);
    });
});
