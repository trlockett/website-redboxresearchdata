$(document).ready ->
  $('#nav .dropdown .active').hide()
  $('.panel').hover(
    ()->
      $(this).find('.panel-collapse').each(()->
        # let menu overrun x-border so cascades evenly
        $(this).css('width', '150%')
        $(this).collapse('show')
        # )
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
