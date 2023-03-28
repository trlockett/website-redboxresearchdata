(function() {
  $(document).ready(function() {
    $('#nav .dropdown .active.hasNoMenus').hide();
    $('#nav .dropdown .active .panel-heading a:first').removeAttr('href');
    $('.panel').hover(function() {
      return $(this).find('.panel-collapse').each(function() {
        return $(this).collapse('show');
      });
    }, function() {
      return $(this).find('.panel-collapse').collapse('hide');
    });
    return $('#nav').on('show.bs.collapse', '.panel-collapse', function() {
      var keepOpenId;
      keepOpenId = $(this).attr('id');
      return $('.panel-collapse').each(function() {
        if ($(this).attr('id') !== keepOpenId) {
          return $(this).collapse('hide');
        }
      });
    });
  });

}).call(this);
