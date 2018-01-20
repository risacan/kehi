//= require jquery
//= require bootstrap-sprockets
//= require rails-ujs
//= require chartkick

$(document).on('ready turbolinks:load', function() {
  $(document).on('click', '.js-expense-panel', function() {
    window.location = $(this).data('detail-url');
  });

  $(document).on("change", "#radio_approve", function(){
    if ( $(this).is(":checked")) {
      $(".js-submit-button").prop("disabled", false)
    } else {
      $(".js-submit-button").prop("disabled", true)
    }
  })

  $(document).on("change", "#radio_reject", function(){
    if ( $(this).is(":checked")) {
      $(".js-submit-button").prop("disabled", false)
    } else {
      $(".js-submit-button").prop("disabled", true)
    }
  })
});
