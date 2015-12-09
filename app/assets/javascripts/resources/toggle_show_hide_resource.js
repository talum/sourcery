$(document).on("page:change", function(){
  var input = $("#show_hide")
  input.on('click', function(){
    $("#externalSiteContent").toggle("display");
    $("#externalSiteContent .iframe").toggle("display");
  })
});
