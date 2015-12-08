$(document).ready(function(){
  $('#new-google-doc-body > input.btn.btn-primary').on('click', function() {
    $('#new_google_doc_modal').modal('hide')
  });
  $('#new_google_doc').on('ajax:success', function(event, data) {
    $('#google_doc_table').append(data.google_doc_item)
  });
  $('#new_video > input.btn.btn-primary').on('click', function() {
    $('#new_video_modal').modal('hide')
  });
  $('#new_resource > input.btn.btn-primary').on('click', function() {
    $('#new_resource_modal').modal('hide')
  });
});

