$(function(){
 $('#new-comment-js').on('ajax:success', function(event, data, status, xhr){
   var template = $(data.template).wrap("<li></li>");
   $('.comment-container').append(template);
   $(this.find('input:text')).val('')
 })
})