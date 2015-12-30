$(document).on("page:change", function(){
  resourceFilter();
})

function resourceFilter(){
  var $rows = $(".filterable-table tr.resource-row-js");
  
  $('.filter').keyup(function(){
    var val = '^(?=.*\\b' + $.trim($(this).val()).split(/\s+/).join('\\b)(?=.*\\b') + ').*$',
        reg = RegExp(val, 'i'),
        text;

  $rows.show().filter(function(){
    text = $(this).text().replace(/\s+/g, ' ');
    return !reg.test(text);
  }).hide();
  
  });
}