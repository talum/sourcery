$(document).on("page:change", function(){
  submitGoogleDocFormListener();
  addNewGoogleDocSuccessListener();
  submitVideoFormListener();
  addNewVideoSuccessListener();
  submitResourceFormListener();
  addNewResourceListener();
});

function submitGoogleDocFormListener(){
  $('#new_google_doc_body > input.btn.btn-primary').on('click', function() {
    $('#new_google_doc_modal').modal('hide');
  });
}

function addNewGoogleDocSuccessListener(){
  $('#new_google_doc').on('ajax:success', function(event, data) {
    $('#google_doc_table').append(data.google_doc_item);
  });
}

function submitVideoFormListener(){
  $('#new_video_body > input.btn.btn-primary').on('click', function() {
    $('#new_video_modal').modal('hide')
  });  
}

function addNewVideoSuccessListener(){
  $('#new_video_form').on('ajax:success', function(event, data) {
    $('#video-list').append(data.video_item);
  });  
}

function submitResourceFormListener(){
  $('#new_resource_body > input.btn.btn-primary').on('click', function() {
    $('#new_resource_modal').modal('hide');
  });  
}

function addNewResourceListener(){
  $('#new_resource_form').on('ajax:success', function(event, data) {
    $('.resources-container').append(data.resource_item);
  });  
}

