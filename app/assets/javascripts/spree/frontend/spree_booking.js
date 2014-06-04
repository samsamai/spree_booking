// Placeholder manifest file.
// the installer will append this file to the app vendored assets here: vendor/assets/javascripts/spree/frontend/all.js'
//= require jquery.ui.datepicker

$(function() {
  $("#booking_date").datepicker({dateFormat: "dd-mm-yy"});


  $('input#adults').on('keyup change', function(e){
    recalculatePrice();
  });

  $('input#children').on('keyup change', function(e){
    recalculatePrice();
  });

  function recalculatePrice() {
    var master_price = parseFloat( $('[data-hook="booking-info"]').data('master-price') );
    var new_price = master_price * $('input#adults').val() + master_price * $('input#children').val() * 0.55;
    $('span.price.selling').text('$' + new_price.toFixed(2).toString() );
  }

});