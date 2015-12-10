$(document).on("page:change", function(){
  favoriteListener();
  unfavoriteListener();
});

function favoriteListener(){
  $(".resources-container").on("ajax:success", ".favorite", function(event, data){
    $($(this).parent().parent().children()[2]).html(data.favorites_message);
    $(this).parent().html(data.unfavorite_button);
  });
}

function unfavoriteListener(){
  $(".resources-container").on("ajax:success", ".unfavorite", function(event, data){
    $($(this).parent().parent().children()[2]).html(data.favorites_message);
    $(this).parent().html(data.favorite_button);
  });
}