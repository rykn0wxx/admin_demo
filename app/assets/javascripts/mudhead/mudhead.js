(function() {
  'use strict';
  function initRun () {
    // Tooltip Panel
    var _pnl = $('<div id="md_panel_wrapper" class="md-panel-wrapper hide"></div>').append($('<div id="md_tooltip" class="md-tooltip" style="top:0; left:0;"></div>'));
    $('body').append(_pnl);
    // Apply remote on paginate
    var ctrlAction = $('body[data-ctrl-action]').data('ctrlAction');
    $('body[data-ctrl-action="index"] #main_content .pagination a').each(function () {
      $(this).attr('data-remote',true);
    }).promise().done(function () {
      $('body[data-ctrl-action="index"] #main_content').on('click', '.pagination a', function(ev) {
        var ajxIndex = {
          method: 'GET',
          dataType: 'script',
          url: this.getAttribute('href'),
          cache: true
        };
        jQuery.ajax(ajxIndex);
        $('.tbl-content').addClass('content-out');
        ev.preventDefault();
        return false;
      });
      $('.main-content').fadeTo(1000, 1);
    });
    if ($('.datetimepicker').length > 0) {
      $('.datetimepicker').datetimepicker({
        debug: false,
        format: 'YYYY-MM-DD HH:mm:ss'
      });
    }
  }

  if (document.readyState !== 'loading') {
    initRun();
  } else if (document.addEventListener) {
    document.addEventListener((typeof Turbolinks !== 'undefined') ? 'turbolinks:load' : 'DOMContentLoaded', initRun);
  } else {
    document.attachEvent('onreadystatechange', function () {
      if (document.readyState == 'complete') {
        initRun();
      }
    });
  }

  $('.admin-form').on('change', 'input[type=file].hide', function (ev) {
    var inp = $(this);
    var lbl = inp.val().replace(/\\/g, '/').replace(/.*\//, '');
    var prt = inp.parents('.admin-form');
    prt.find('.form-group .form-control-text').val(lbl);
    prt.find('.form-actions .import-btn').removeAttr('disabled');
  });
  $('nav[role="navigation"].navigation').on('mouseenter', '> a', function (ev) {
    var _that = $(ev.currentTarget).find('span[data-mtooltip]');
    if (_that.css('display') !== 'none') {
      var _msg = _that.data('mtooltip'),
        _off = _that.offset(),
        //elT = (_off.top / 2) + _that[0].offsetHeight + ((_off.top < 100) ? _that[0].clientHeight:(_that[0].clientHeight/2)),
        elT = _off.top - 20,
        elL = _off.left + 10,
        _pnl = $('#md_panel_wrapper.md-panel-wrapper'),
        _ttp = $('#md_panel_wrapper.md-panel-wrapper #md_tooltip.md-tooltip');
      _ttp.css({
        top: elT,
        left: elL
      });
      _ttp.html(_msg);
      _ttp.addClass('md-show');
      _pnl.removeClass('hide');
      ev.stopPropagation();
    }
    return this;
  });
  $('nav[role="navigation"].navigation').on('mouseleave', '> a', function (ev) {
    var _pnl = $('#md_panel_wrapper.md-panel-wrapper'),
    _ttp = $('#md_panel_wrapper.md-panel-wrapper #md_tooltip.md-tooltip');
    _pnl.addClass('hide');
    _ttp.removeClass('md-show');
    _ttp.css({
      top: 0,
      left: 0
    });
  });

}).call(this);
