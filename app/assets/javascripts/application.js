//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function () {

    $('.delete-link').click(function () {
        var current_room = $(this).parents('.room-container');
        current_room.remove();
        if ($('.room-container').length == 0) {
            $('.half').append('<h3 class="text-center">Page is empty</h3>')
        }






    });
});

