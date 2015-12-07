$(function(){
 $('.destroy-comment-js').on('ajax:success', function(event, data, status, xhr){
   $('li#<%=@comment.id%>').remove();
 })
})