$(document).on("page:change", function(){
  jimPicToggleListener();

});

function jimPicToggleListener(){
  $("#jim-pic-js").on("dblclick", function(){
    $("#jim-bio-js img").remove();
    $("#jim-bio-js").prepend("<img src='/assets/giphy.gif' class='img-circle' height='140' width='140'>");
  });
}