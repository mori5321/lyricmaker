$(function() {
  $( "#sortable1, #sortable2" ).sortable({
    connectWith: ".connectedSortable"
  }).disableSelection();
  $('#remove_button').on('clicked', function(){
    $(this).remove
  });
});