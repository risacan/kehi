//= require jquery
//= require bootstrap-sprockets
//= require rails-ujs
//= require chartkick

$(document).on('ready turbolinks:load', function() {
  $('.js-expense-panel').on('click', function() {
    window.location = $(this).data('detail-url');
  });
});
