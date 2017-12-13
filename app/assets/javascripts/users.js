$(document).on('turbolinks:load', function(){
    $('.passwd-alert').find('span').on('click', function () {
        $('.passwd-block').show(200);
    });

    $('#user_submit').on('click', function () {
        var $this = $(this);
        $this.attr('disabled', 'disabled');

        $.each($('.error-msg'), function(k,v) {
            var field = $(this).parent();
            $(this).text('');
            field.find('input').removeClass('field-with-errors');
        });


        $.ajax({
            url: $this.closest('form').attr('action'),
            method: $this.closest('form').attr('method'),
            data: $this.closest('form').serialize(),
            success: function (data, textStatus, xhr) {
                $this.attr('disabled', false);
                console.log(textStatus);
                console.log(xhr.status);
                console.log(data);
                if (data.status == 'unprocessable_entity') {
                    var messages = data.messages;
                    messages.forEach(function(v, k, messages) {
                        $('#' + v[0] + '_field').find('.error-msg').text(v[1][0]);
                        $('#' + v[0] + '_field').find('input').addClass('field-with-errors');
                    });
                }
            }
        });
        return false;
    });
});
