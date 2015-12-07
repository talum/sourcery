$(function(){
  $.ajax({
    url: window.location.pathname,
    type: "get",
    dataType: "json",
    success: function(data, textStatus, xhr){
      // debugger;
      buildChart(data.studentData);
    }

  })
});

  function buildChart (arrayOfStudentHashes){    
    var chartHeight = 500;
    var barWidth = 25;
    var chartScale = d3.scale.linear()
                              .domain([0, arrayOfStudentHashes[0].comment_count])
                              .range([0, chartHeight]);
    var chart = d3.select('#student-comment-graph')
                  .append("svg")
                  .attr("width", barWidth*(arrayOfStudentHashes.length))
                  .attr("height", chartHeight);
    var bar = chart.selectAll("g")
                   .data(arrayOfStudentHashes)
                   .enter().append("g")
                   .attr("width", barWidth)
                   .attr("height", chartHeight)
                   .attr("transform", function(data, index){
                    return "translate(" + (index * (barWidth)) + "," + (chartHeight - chartScale(data.comment_count)) + ")"
                   })
                   .attr("fill", "steelblue")
    bar.append("rect")
       .attr("width", function(){return barWidth-2})
       .attr("height", chartHeight)

    bar.append("text")
       // .attr("x", (barWidth/2-5))
       // .attr("y", 10)
       .attr("dy", ".35em")
       .attr("transform", "translate(" + (barWidth/2-5) + "," + "20" + ")" + "rotate(90)")
       .attr("fill", "black")
       .text(function(d) {return d.name;});


  }
