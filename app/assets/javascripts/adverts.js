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
});
