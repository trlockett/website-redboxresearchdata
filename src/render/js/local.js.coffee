$(document).ready ->
  $('#nav .dropdown .active').hide()
  $('.panel').hover(
    ()->
      $(this).find('.panel-collapse').collapse('show')
    () ->
      $(this).find('.panel-collapse').collapse('hide')
  )
  # ensure all menus closed on leaving navbar
  $('#nav').on('mouseleave',() ->
    $('.panel-collapse').collapse('hide')
  )
  # ensure only 1 menu opened at a time
  $('#nav').on('shown.bs.collapse','.panel-collapse',() ->
    keepOpenId = $(this).attr('id')
    $('.panel-collapse').each(() ->
        if $(this).attr('id') != keepOpenId then $(this).collapse('hide')
    )
  )
