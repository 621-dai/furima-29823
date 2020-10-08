$(function(){
  $('#item-price').on('input', function(){
    let tax = $('#item-price').val();
    $('#add-tax-price').text(Math.floor(tax * 0.1));
    $('#profit').text(Math.floor(tax - (tax * 0.1)));
  });
});
