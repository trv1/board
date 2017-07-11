Dropzone.autoDiscover = false;
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
        var selectTag = $('[name="advert[brand_id]"]');
        selectTag.val($(this).data('id'));
        selectTag.selectpicker('refresh');
    });

    $('.brand-all').on('click', function () {
        $('.popular-brands').hide(500);
        $('.all-brands').show(500);
    });

    $('.brand-popular').on('click', function () {
        $('.all-brands').hide(500);
        $('.popular-brands').show(500);
    });

    $("#upload-dropzone").dropzone( {
        maxFilesize: 2,
        acceptedFiles: '.jpg, .png, .jpeg',
        maxFiles: 8,
        addRemoveLinks: true,
        url: '/upload_picture',
        init: function() {
            this.on('removedfile', function(file) {
                var id = $(file._removeLink).attr('data-id');

                if (id != undefined) {
                    $.ajax({
                        url: '/remove_picture?id=' + id.toString(),
                        type: 'post',
                        success: function(result) {
                            console.log(result.result);
                        }
                    });
                }

                $("#pictures").val($("#pictures").val().replace(id, ''));
            });
            this.on('success', function(file, response) {
                var id = response.id;
                $(file._removeLink).attr('data-id', id.toString());
                if ($("#pictures").val() == '') {
                    $("#pictures").val(id.toString());
                } else {
                    $("#pictures").val($("#pictures").val() + "," + id.toString());
                }
                console.log($("#pictures").val());
            });
        },
        dictDefaultMessage: "Нажмите чтобы загрузить или перетащите сюда файлы<p>Размер файла не должен превышать 2 Мб, количество файлов не более 8</p>",
        dictFileTooBig: "Файл имеет размер {{filesize}} Мб, превышая лимит в 2 Мб",
        dictRemoveFile: 'Удалить файл',
        dictCancelUpload: 'Отменить загрузку',
        dictMaxFilesExceeded: 'Нельзя загрузить больше 6 файлов'
    });

    $('input[type="submit"]').on('click', function() {
        $("#new_adverts").submit();
    });

    $('.color').tooltip();

    $('.color').on('click', function() {
        $('#advert_color').val($(this).attr('data-id'));
        $('.color').find('.fa.fa-check').hide();
        $(this).find('.fa.fa-check').show();
        $('.color').removeClass('selected-color');
        $(this).addClass('selected-color');
    });

    $(".js-data-example-ajax").select2({
        ajax: {
            url: '/load_cities',
            dataType: 'json',
            data: function (params) {
                return {
                    q: params.term, // search term
                    country_id: $('#advert_country_id').val()
                };
            },
            processResults: function (data, params) {
                // parse the results into the format expected by Select2
                // since we are using custom formatting functions we do not need to
                // alter the remote JSON data, except to indicate that infinite
                // scrolling can be used
                params.page = params.page || 1;

                return {
                    results: data.cities
                    // pagination: {
                    //     more: (params.page * 30) < data.total_count
                    // }
                };
            },
            cache: true
        },
        escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
        minimumInputLength: 1,
        allowClear: true,
        language: locale(),
        placeholder: 'Введите город',
        templateResult: function (data) {
            if (data.text) {
                return data.text;
            }

            return '<span>' + data.name + '</span>';
        },
        templateSelection: function (data, container) {
            if (data.id === '') {
                return '';
            } else {
                return ' ' + data.name;
            }
        }
    });

    $('.select2-selection__placeholder').html('Введите город');
    $('.select2-selection__placeholder').css('color', '#aaa');

    $(".js-data-example-ajax").on('select2:open', function (evt) {
        $('.select2-selection__placeholder').html('Введите город');
        $('.select2-selection__placeholder').css('color', '#aaa');

        if ($('#advert_country_id').val() == '') {
            setTimeout(function () {
                $('.select2-results__message').html('Выберите страну');
                $('.select2-results__message').css('color', 'red');
            }, 150);
        }
    });

    $(".js-data-example-ajax").on('select2:select', function (evt) {
        setTimeout(function () {
            $(this).data('location', evt.params.data.name.split(',')[0]);
            $('#advert_location_id').val(evt.params.data.id);
            $('#advert_country_id').on('changed.bs.select', function () {
                $('.select2-selection__clear').trigger('mousedown');
                $(this).data('location', '');
                $('#advert_location_id').val('');
            });
        }, 100);
    });

    $('#advert_phone').inputmask({
        mask: [{ "mask": "+#"}],
        greedy: false,
        definitions: { '#': { validator: "[0-9]", cardinality: 13}}
    });

    $('#advert_is_around_the_clock').on('change', function () {
        if ($(this).prop('checked')) {
            $('#time').hide(500);
        } else {
            $('#time').show(500);
        }
    });

    $('li.currency').on('click', function () {
        $('button.currency').contents()[0].textContent = $(this).data('content');
        $('li.currency').removeClass('highlighted-li');
        $(this).addClass('highlighted-li');
        $('#advert_price').val(parseFloat($('.currency.highlighted-li').data('value')).toFixed(2));
    });

    $('#advert_price').on('change', function () {
        var $this = $(this);
        $.each($('li.currency'), function (k, v) {
            $(this).data('value', (parseFloat($this.val()) * parseFloat($(v).data('ratio')))/parseFloat($('.currency.highlighted-li').data('ratio')));
        });
    });
});
