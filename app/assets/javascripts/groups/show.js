$(document).ready(function(){
  $('#new_google_doc > input.btn.btn-primary').on('click', function() {
    $('#new_google_doc_modal').modal('hide')
  });
  $('#new_video > input.btn.btn-primary').on('click', function() {
    $('#new_video_modal').modal('hide')
  });
  $('#new_resource > input.btn.btn-primary').on('click', function() {
    $('#new_resource_modal').modal('hide')
  });
});

