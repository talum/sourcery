$(document).on("page:change", function(){
  saveResourceListener();
  destroyResourceListener();
});

function saveResourceListener(){
  $("#article-results").on("ajax:success", ".save-resource-btn", function(event, data){
    $(this).html("Resource saved!");
    var resourceItemHtml = data.resource_item;
    $(".resources-container").append(resourceItemHtml);
  });
}

function destroyResourceListener(){
  $(".resources-container").on("ajax:success", ".destroy-resource-js", function(){
    $(this).parent().parent().remove();
  });
}