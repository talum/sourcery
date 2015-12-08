$(function(){
  $.ajax({
    url: window.location.pathname,
    type: "get",
    dataType: "json",
    success: function(data, textStatus, xhr){
      buildCommentChart(data.studentCommentData);
    }

  })
});

  function buildCommentChart (arrayOfStudentHashes){    
    var barWidth = 35;
    var margin = {top: 20, right: 30, bottom: 200, left: 60} 
    var chartHeight = 600 - margin.top - margin.bottom 
    var chartWidth = 600 - margin.left - margin.right

    var chartScale = d3.scale.linear()
                              .domain([0, arrayOfStudentHashes[0].comment_count])
                              .range([0, chartHeight]);
    var chart = d3.select('#student-comment-graph')
                  .append("svg")
                  .attr("width", chartWidth + margin.left + margin.right)
                  .attr("height", chartHeight + margin.top + margin.bottom);

    var names = arrayOfStudentHashes.map(function(object){
      return (object.name)
    }) 

    var x = d3.scale.ordinal()
              .domain(names)
              .rangeRoundBands([0, (barWidth*10)], .05)


    var xAxis = d3.svg.axis()
                  .scale(x)
                  .orient("bottom")
                  .tickValues(names)


    var bar = chart.selectAll("g")
                   .data(arrayOfStudentHashes)
                   .enter().append("g")
                   .attr("width", barWidth)
                   .attr("height", chartHeight)
                   .attr("transform", function(data, index){
                    return "translate(" + (index * (barWidth) + margin.left) + "," + (chartHeight - chartScale(data.comment_count)) + ")"
                   })
                   .attr("fill", "steelblue")


    bar.append("rect")
       .attr("width", function(){return barWidth-2})
       .attr("height", chartHeight)

    chart.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(" + margin.left + "," + chartHeight + ")")
      .call(xAxis)
     .selectAll("text")
      .style("text-anchor", "end")
      .attr("transform", "rotate(-65)")


    bar.append("text")
       // .attr("x", (barWidth/2-5))
       // .attr("y", 10)
       .attr("dy", ".35em")
       .attr("transform", "translate(" + (barWidth/2-5) + "," + "20" + ")" + "rotate(90)")
       .attr("fill", "black")
       .text(function(d) {return d.name;});


  }
