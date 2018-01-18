//= require jquery
//= require bootstrap-sprockets
//= require rails-ujs
//= require chartkick

$(document).on('ready turbolinks:load', function() {
  $(document).on('click', '.js-expense-panel', function() {
    window.location = $(this).data('detail-url');
  });
});
