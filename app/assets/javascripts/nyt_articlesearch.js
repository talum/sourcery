$(document).on("ready", function(){
  searchListener();
  clearListener();

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
  })
}