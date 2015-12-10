
$(document).on("page:change", function(){
  if($(".teachers.show").length > 0) {
    $.ajax({
      url: window.location.pathname,
      type: "get",
      dataType: "json",
      success: function(data, textStatus, xhr){
        buildCommentChart(data.studentCommentData);
      }
    })
  }
});

  function buildCommentChart (arrayOfStudentHashes){ 

    var barWidth = 35;
    var margin = {top: 50, right: 30, bottom: 200, left: 60} 
    var chartHeight = 600 - margin.top - margin.bottom 
    var chartWidth = 600 - margin.left - margin.right
    var chartScale = d3.scale.linear()
                              .domain([0, arrayOfStudentHashes[0].comment_count])
                              .range([0, chartHeight-30]);
    var chart = d3.select('#student-comment-graph')
                  .append("svg")
                  .attr("width", chartWidth + margin.left + margin.right)
                  .attr("height", chartHeight + margin.top + margin.bottom);
    
    var names = arrayOfStudentHashes.map(function(object){
      return (object.name)
    })

    var x = d3.scale.ordinal()
              .domain(names)
              .rangeBands([0, (chartWidth)])



    var xAxis = d3.svg.axis()
                  .scale(x)
                  .orient("bottom")
                  .tickFormat(d3.names)

    var y = d3.scale.linear()
              .domain([arrayOfStudentHashes[0].comment_count, 0])
              .range([0, (chartHeight - 30)])  

    var yAxis = d3.svg.axis()
                  .scale(y)
                  .orient("left")
                  .tickFormat(d3.format("d"))     

    var bar = chart.selectAll("g")
                   .data(arrayOfStudentHashes)
                   .enter().append("g")
                   .attr("width", barWidth)
                   .attr("height", chartScale)
                   .attr("transform", function(data, index){
                    return "translate(" + (index * (barWidth) + margin.left) + "," + (chartHeight - chartScale(data.comment_count)) + ")"
                   })
                   .attr("fill", "steelblue")

    bar.append("rect")
       .attr("width", function(){return barWidth-2})
       .attr("height", function(d) {
        // debugger;
        return chartScale(d.comment_count)
       })

    chart.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(" + margin.left + "," + chartHeight + ")")
      .call(xAxis)
     .selectAll("text")
      .style("text-anchor", "end")
      .attr("transform", function(d, i) {
        return "transform", "translate(" + (((-270/arrayOfStudentHashes.length) - (i * (chartWidth) / arrayOfStudentHashes.length)) + (i * (barWidth+2))) + ",10)rotate(-65)"
      });

      chart.append("g")
      .attr("class", "y axis")
      .attr("transform", "translate(" + margin.left + ",30)")
      .call(yAxis)


    bar.append("text")
       // .attr("x", (barWidth/2-5))
       // .attr("y", 10)
       .attr("dy", ".35em")
       .attr("transform", "translate(" + (barWidth/2-5) + "," + "20" + ")" + "rotate(90)")
       .attr("fill", "white")
       .text(function(d) {return d.comment_count;});


  }