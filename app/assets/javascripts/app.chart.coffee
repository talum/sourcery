class App.Chart
  constructor: (@el) ->
    # intialize some stuff

  render: ->
    # do some stuff

$(document).on "page:change", ->
  chart = new App.Chart $("#chart")
  chart.render()