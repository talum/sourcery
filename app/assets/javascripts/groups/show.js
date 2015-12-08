$(document).ready(function(){
  $('#new_google_doc_body > input.btn.btn-primary').on('click', function() {
    $('#new_google_doc_modal').modal('hide')
  });
  $('#new_google_doc').on('ajax:success', function(event, data) {
    $('#google_doc_table').append(data.google_doc_item)
  });
  $('#new_video_body > input.btn.btn-primary').on('click', function() {
    $('#new_video_modal').modal('hide')
  });
  $('#new_video_form').on('ajax:success', function(event, data) {
    $('#video-list').append(data.video_item)
  });
  $('#new_resource_body > input.btn.btn-primary').on('click', function() {
    $('#new_resource_modal').modal('hide')
  });
  $('#new_resource_form').on('ajax:success', function(event, data) {
    $('.resources-container').append(data.resource_item)
  });
});

