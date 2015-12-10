$(document).on("page:change", function(){
  $(".comment-container").on("ajax:success", ".destroy-comment-js", function(){
   $(this).parent().remove()
  });
})

