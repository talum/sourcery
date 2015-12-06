$(document).on("ready", function(){
  searchListener();

});

function searchListener(){
  $("#article-search").on("ajax:success", function(event, data){
    $(this).find("input:text").val('');
    var articleHtmlArray = []; 
    for(var i=0; i<data.length; i++){
      var linkHTML = "<a href='"+data[i].link+"' target='_blank'>"+data[i].title+"</a><br>";
      articleHtmlArray.push(linkHTML);
    }
    var finalHTML = articleHtmlArray.join("");
    $("#article-results").append(finalHTML);
  });
}