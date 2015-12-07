$(document).on("page:change", function(){
  searchListener();
  clearListener();
  saveResourceListener();
  // destroyResourceListener();
});

function searchListener(){
  $("#article-search").on("ajax:success", function(event, data){
    $(this).find("input:text").val('');
    $("#article-results").append(data.article_list);
  });
}

function clearListener(){
  $("#clear-search-results-button").on("click", function(){
    $("#article-results").html("");
  });
}

function saveResourceListener(){
  $("#article-results").on("ajax:success", ".save-resource-btn", function(event, data){
    $(this).html("Resource saved!");
    var resourceItemHtml = data.resource_item;
    $(".resources-container").append(resourceItemHtml);
  });
}

// function destroyResourceListener(){
//   $(".resources-container").on("ajax:success", ".destroy-resource-js", function(){
//     debugger;
//   });
// }