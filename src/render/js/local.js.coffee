$(document).ready ->
  # $("#nav .dropdown .active").hide()
  $('.panel').hover(
    ()->
      $(this).find(".panel-collapse").collapse('show')
    () ->
      $(this).find(".panel-collapse").collapse('hide')
  )
