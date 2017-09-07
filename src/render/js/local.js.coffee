$(document).ready ->
  # $('#nav .dropdown').on('click')
  $('#nav .dropdown .active.hasNoMenus').hide()
  $('#nav .dropdown .active .panel-heading a:first').removeAttr('href')
  $('.panel').hover(
    ()->
      $(this).find('.panel-collapse').each(()->
        $(this).collapse('show')
      )
    () ->
      $(this).find('.panel-collapse').collapse('hide')
  )
  # ensure only 1 menu opened at a time
  $('#nav').on('show.bs.collapse','.panel-collapse',() ->
    keepOpenId = $(this).attr('id')
    $('.panel-collapse').each(() ->
        if $(this).attr('id') != keepOpenId then $(this).collapse('hide')
    )
  )
