$(document).on('turbolinks:load', function () {
    $(".js-data-example-ajax").select2({
        ajax: {
            url: '/load_cities',
            dataType: 'json',
            data: function (params) {
                return {
                    q: params.term, // search term
                    country_id: $('#country_id').val()
                };
            },
            processResults: function (data, params) {
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
        },
        language: (locale() == 'en' ? locale() : {
            inputTooShort: function () {
                return "Начните ввод...";
            },
            errorLoading: function () {
                return 'Невозможно загрузить результаты';
            },
            loadingMore: function () {
                return 'Загрузка данных…';
            },
            noResults: function () {
                return 'Совпадений не найдено';
            },
            searching: function () {
                return 'Поиск…';
            }
        })
    });

    $('.select2-selection__placeholder').html(locale == 'en' ? 'Enter city' : 'Введите город');
    $('.select2-selection__placeholder').css('color', '#aaa');

    $(".js-data-example-ajax").on('select2:open', function (evt) {
        $('.select2-selection__placeholder').html(locale == 'en' ? 'Enter city' : 'Введите город');
        $('.select2-selection__placeholder').css('color', '#aaa');

        if ($('#country_id').val() == '') {
            setTimeout(function () {
                $('.select2-results__message').html(locale == 'en' ? 'Choose country' : 'Выберите страну');
                $('.select2-results__message').css('color', 'red');
            }, 150);
        }
    });

    $(".js-data-example-ajax").on('select2:select', function (evt) {
        setTimeout(function () {
            $(this).data('location', evt.params.data.name.split(',')[0]);
            $('#location_id').val(evt.params.data.id);
            $('#country_id').on('changed.bs.select', function () {
                $('.select2-selection__clear').trigger('mousedown');
                $(this).data('location', '');
                $('#location_id').val('');
            });
        }, 100);
    });

    var isDown = true,
        moreFiltersIcon = $('.more-filters').find('.rotate-icon');

    $('#vehicle_type_id').on('change', function () {
        if ($(this).val() == '') {
            $('.more-filters').addClass('not-active');
            $('.more-filters').removeClass('active');
        } else {
            $('.more-filters').removeClass('not-active');
            $('.more-filters').addClass('active');
        }
        moreFiltersIcon.removeClass('up');
        isDown = true;
        $('.filters').hide(200);
    });

    $('body').on('click', '.more-filters.link.active', function () {
        if (isDown) {
            moreFiltersIcon.addClass('up');
            isDown = false;
            $('.filters[data-vehicle-type-id="' + $('#vehicle_type_id').val() + '"]').show(200);
        } else {
            moreFiltersIcon.removeClass('up');
            isDown = true;
            $('.filters').hide(200);
        }
    });
});