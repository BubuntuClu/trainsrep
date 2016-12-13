$(document).ready(function(){
  $('a.edit_route').click(function(e){
    e.preventDefault();

    var station_id = $(this).data('routeId');
    var form = $('#edit_route_' + station_id);
    var title = $('#route_title_' + station_id);

    if (!$(this).hasClass('cancel')){
      $(this).html('Cancel');
      $(this).addClass('cancel');
    } else {
      $(this).html('Edit');
      $(this).removeClass('cancel');
    }

    form.toggle();
    title.toggle();

  });
});