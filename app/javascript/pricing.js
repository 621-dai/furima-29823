$(function(){
  $('#item-price').on('input', function(){
    let tax = $('#item-price').val();
    $('#tax-price').text(Math.ceil(tax * 0.1));
    $('#benefit').text(Math.ceil(tax - (tax * 0.1)));
  });
});
