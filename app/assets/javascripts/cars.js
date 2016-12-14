$(document).ready(function(){
  $('#car_car_type').change(function(){
    $('#seat_form').removeClass('active_form').addClass('hidden_form');
    $('#sv_form').removeClass('active_form').addClass('hidden_form');
    $('#plazkart_form').removeClass('active_form').addClass('hidden_form');
    $('#coupe_form').removeClass('active_form').addClass('hidden_form');
    $('#'+ $(this).val() + '_form').removeClass('hidden_form').addClass('active_form');
  });
});