//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require_tree .

$(function() {
  $('.scheduler .schedulable').on('click', function(ev) {
    var element = $(this);
    $.post('/scheduler', element.data(), function(json) {
      element.html($('<span class="label label-success">').html(json.message));
    }, 'json');

    ev.preventDefault();
  });
});
