$(document).on("page:change", function(){
  favoriteListener();
  unfavoriteListener();
});

function favoriteListener(){
  $(".resources-container").on("ajax:success", ".favorite", function(event, data){
    $(this).parent().html(data.unfavorite_button);
    unfavoriteListener();
  });
}

function unfavoriteListener(){
  $(".resources-container").on("ajax:success", ".unfavorite", function(event, data){
    $(this).parent().html(data.favorite_button);
    favoriteListener();
  });
}