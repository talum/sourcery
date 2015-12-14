$(document).on("page:change", function(){
  destroyVideoListener();
});

function destroyVideoListener(){
  $(".videos-container").on("ajax:success", ".destroy-video-js", function(){
    $(this).parent().parent().remove();
  });
}
