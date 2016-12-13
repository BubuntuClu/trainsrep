$(document).ready(function(){
  $('a.edit_train').click(function(e){
    e.preventDefault();

    var station_id = $(this).data('trainId');
    var form = $('#edit_train_' + station_id);
    var title = $('#train_title_' + station_id);
    
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