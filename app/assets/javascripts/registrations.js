$(document).on('turbolinks:load', function(){
    $('#new_advert').on('click', function() {
        $('#type_of_vehicle').modal();
        return false;
    });
});
