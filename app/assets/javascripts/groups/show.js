$(document).on("page:change", function(){
  // submitGoogleDocFormListener();
  addNewGoogleDocSuccessListener();
  addNewVideoSuccessListener();
  addNewResourceListener();
  commentsOverTimeListener();
});

// function submitGoogleDocFormListener(){
//   $('#new_google_doc_body > input.btn.btn-primary').on('click', function() {
//     $('#new_google_doc_modal').modal('hide');
//   });
// }

function addNewGoogleDocSuccessListener(){
  $('#new_google_doc').on('ajax:success', function(event, data) {
    $('#new_google_doc_modal').modal('hide')
    $('#google_doc_table').append(data.google_doc_item);
  });

  $('#new_google_doc').on('ajax:error', function(event, data) {
    for (i = 0; i < data.responseJSON.errors.length; i++) {
      $('#google_doc_errors').addClass('alert alert-danger').append(data.responseJSON.errors[i]);
    }
  })
}

function addNewVideoSuccessListener(){
  $('#new_video_form').on('ajax:success', function(event, data) {
    $('#new_video_modal').modal('hide')
    $('#video-list').append(data.video_item);
  }); 

  $('#new_video_form').on('ajax:error', function(event, data) {
    for (i = 0; i < data.responseJSON.errors.length; i++) {
      $('#video_errors').addClass('alert alert-danger').append(data.responseJSON.errors[i]);
    }
  }) 
}

function addNewResourceListener(){
  $('#new_resource_form').on('ajax:success', function(event, data) {
    $('#new_resource_modal').modal('hide');
    $('.resources-container').append(data.resource_item);
  }); 

  $('#new_resource_form').on('ajax:error', function(event, data){
    for (i = 0; i < data.responseJSON.errors.length; i++) {
      $('#resource_errors').addClass('alert alert-danger').append(data.responseJSON.errors[i]);
    }
  }) 
}

function commentsOverTimeListener(){
  $.ajax({
    url: window.location.pathname,
    type: "get",
    dataType: "json",
    success: function(data, textStatus, xhr){
      buildCommentsOverTimeGraph(data.comments_over_time);
    }
  }) 
}

function buildCommentsOverTimeGraph(commentsOverTime){

  var margin = {top: 20, right: 40, bottom: 30, left: 50},
      width = 575 - margin.left - margin.right,
      height = 400 - margin.top - margin.bottom;

  var parseDate = d3.time.format("%Y-%m-%d").parse;


  var x = d3.time.scale()
      .range([0, width])

  var y = d3.scale.linear()
      .range([height, 0]);

  var xAxis = d3.svg.axis()
      .scale(x)
      .orient("bottom")
      .ticks(5);

  var yAxis = d3.svg.axis()
      .scale(y)
      .orient("left");

  var svg = d3.select("#comments-over-time.tab-pane").append("svg")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom)
    .append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    var data = commentsOverTime.map(function(d) {
        return {
           date: parseDate(d[0]),
           close: d[1]
        };
        
    });

  var line = d3.svg.line()
      .x(function(d) { return x(d.date); })
      .y(function(d) { return y(d.close); });

    x.domain(d3.extent(data, function(d) { return d.date; }));
    y.domain(d3.extent(data, function(d) { return d.close; }));

    svg.append("g")
        .attr("class", "x axis")
        .attr("transform", "translate(0," + height + ")")
        .call(xAxis)
      .append("text")
        .text("Date")
        .attr("transform", "translate("+ (width - 35) +",-5)");

    svg.append("g")
        .attr("class", "y axis")
        .call(yAxis)
      .append("text")
        .attr("transform", "rotate(-90)")
        .attr("y", 6)
        .attr("dy", ".71em")
        .style("text-anchor", "end")
        .text("Comments");

    svg.append("path")
        .datum(data)
        .attr("class", "line")
        .attr("d", line);
}
