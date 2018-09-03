(function($, window, document, undefined) {
  "use strict";
  var ripples = "ripples";
  var self = null;
  var defaults = {};
  function Ripples(element, options) {
    self = this;
    this.element = $(element);
    this.options = $.extend({}, defaults, options);
    this._defaults = defaults;
    this._name = ripples;
    this.init();
  }
  Ripples.prototype.init = function() {
    var $element  = this.element;
    $element.on("mousedown touchstart", function(event) {
      if(self.isTouch() && event.type === "mousedown") {
        return;
      }
      if(!($element.find(".ripple-container").length)) {
        $element.append("<div class=\"ripple-container\"></div>");
      }
      var $wrapper = $element.children(".ripple-container");
      var relY = self.getRelY($wrapper, event);
      var relX = self.getRelX($wrapper, event);
      if(!relY && !relX) {
        return;
      }
      var rippleColor = self.getRipplesColor($element);
      var $ripple = $("<div></div>");
      $ripple
      .addClass("ripple")
      .css({
        "left": relX,
        "top": relY,
        "background-color": rippleColor
      });
      $wrapper.append($ripple);
      (function() { return window.getComputedStyle($ripple[0]).opacity; })();
      self.rippleOn($element, $ripple);
      setTimeout(function() {
        self.rippleEnd($ripple);
      }, 500);
      $element.on("mouseup mouseleave touchend", function() {
        $ripple.data("mousedown", "off");
        if($ripple.data("animating") === "off") {
          self.rippleOut($ripple);
        }
      });
    });
  };
  Ripples.prototype.getNewSize = function($element, $ripple) {
    return (Math.max($element.outerWidth(), $element.outerHeight()) / $ripple.outerWidth()) * 1.5;
  };
  Ripples.prototype.getRelX = function($wrapper,  event) {
    var wrapperOffset = $wrapper.offset();
    if(!self.isTouch()) {
      return event.pageX - wrapperOffset.left;
    } else {
      event = event.originalEvent;
      if(event.touches.length === 1) {
        return event.touches[0].pageX - wrapperOffset.left;
      }
      return false;
    }
  };
  Ripples.prototype.getRelY = function($wrapper, event) {
    var wrapperOffset = $wrapper.offset();
    if(!self.isTouch()) {
      return event.pageY - wrapperOffset.top;
    } else {
      event = event.originalEvent;
      if(event.touches.length === 1) {
        return event.touches[0].pageY - wrapperOffset.top;
      }
      return false;
    }
  };
  Ripples.prototype.getRipplesColor = function($element) {
    var color = $element.data("ripple-color") ? $element.data("ripple-color") : window.getComputedStyle($element[0]).color;
    return color;
  };
  Ripples.prototype.hasTransitionSupport = function() {
    var thisBody  = document.body || document.documentElement;
    var thisStyle = thisBody.style;
    var support = (
      thisStyle.transition !== undefined ||
      thisStyle.WebkitTransition !== undefined ||
      thisStyle.MozTransition !== undefined ||
      thisStyle.MsTransition !== undefined ||
      thisStyle.OTransition !== undefined
    );
    return support;
  };
  Ripples.prototype.isTouch = function() {
    return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
  };
  Ripples.prototype.rippleEnd = function($ripple) {
    $ripple.data("animating", "off");
    if($ripple.data("mousedown") === "off") {
      self.rippleOut($ripple);
    }
  };
  Ripples.prototype.rippleOut = function($ripple) {
    $ripple.off();
    if(self.hasTransitionSupport()) {
      $ripple.addClass("ripple-out");
    } else {
      $ripple.animate({"opacity": 0}, 100, function() {
        $ripple.trigger("transitionend");
      });
    }
    $ripple.on("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd", function() {
      $ripple.remove();
    });
  };
  Ripples.prototype.rippleOn = function($element, $ripple) {
    var size = self.getNewSize($element, $ripple);
    if(self.hasTransitionSupport()) {
      $ripple
      .css({
        "-ms-transform": "scale(" + size + ")",
        "-moz-transform": "scale(" + size + ")",
        "-webkit-transform": "scale(" + size + ")",
        "transform": "scale(" + size + ")"
      })
      .addClass("ripple-on")
      .data("animating", "on")
      .data("mousedown", "on");
    } else {
      $ripple.animate({
        "width": Math.max($element.outerWidth(), $element.outerHeight()) * 2,
        "height": Math.max($element.outerWidth(), $element.outerHeight()) * 2,
        "margin-left": Math.max($element.outerWidth(), $element.outerHeight()) * (-1),
        "margin-top": Math.max($element.outerWidth(), $element.outerHeight()) * (-1),
        "opacity": 0.4
      }, 500, function() {
        $ripple.trigger("transitionend");
      });
    }
  };
  $.fn.ripples = function(options) {
    return this.each(function() {
      if(!$.data(this, "plugin_" + ripples)) {
        $.data(this, "plugin_" + ripples, new Ripples(this, options));
      }
    });
  };
})(jQuery, window, document);

// Rykn0wx v2
(function() {
  'use strict';

  // Setting defaults
  (function() {
    'use strict';
    (function() {
      'use strict';
      this.rykn0wxx = {
        chartConfig: {
          lang: {
            contextButtonTitle: 'Chart menu',
            loading: 'This will be awesome...',
            noData: 'No data to display'
          },
          colors: ['#66c2a5', '#fc8d62', '#8da0cb', '#e78ac3', '#a6d854', '#ffd92f', '#e5c494', '#b3b3b3', '#59AA90', '#DD7B56', '#7B8CB2', '#CA79AB', '#91BD4A', '#DFBE29', '#C8AC82', '#9D9D9D'],
          loading: {
            hideDuration: 1000,
            showDuration: 1000,
            style: {
              fontStyle: 'italic',
              fontWeight: 300,
              color: '#fafafa',
              pointerEvents: 'none',
              backgroundColor: 'rgba(0,0,0,0.1)'
            }
          },
          noData: {
            style: {
              fontWeight: '500',
              fontSize: '16px',
              color: '#212121'
            }
          },
        	chart: {
            animation: true,
            borderWidth: 0,
            borderRadius: 0,
            defaultSeriesType: 'spline',
            selectionMarkerFill: 'rgba(69, 114, 167, 0.25)',
            backgroundColor: null,
        		// backgroundColor: {
        		// 	linearGradient: {
        		// 		x1: 0, y1: 0, x2: 1, y2: 1
        		// 	},
        		// 	stops: [
            //     [0, '#3B4651'],
            //     [1, '#44515F']
        		// 	]
        		// },
        		style: {
        			fontFamily: '\'Roboto\', Arial, sans-serif'
        		},
        		plotBorderColor: '#606063'
        	},
        	title: {
            text: null,
        		style: {
        			color: '#E0E0E3',
        			textTransform: 'uppercase',
        			fontSize: '20px'
        		}
        	},
        	subtitle: {
        		style: {
        			color: '#E0E0E3',
        			textTransform: 'uppercase',
        			fontSize: '12px'
        		}
        	},
        	xAxis: {
        		gridLineColor: '#707073',
        		labels: {
              useHTML: true,
        			style: {
        				color: '#E0E0E3'
        			}
        		},
        		lineColor: '#707073',
        		minorGridLineColor: '#505053',
        		tickColor: '#707073',
        		title: {
        			style: {
        				color: '#A0A0A3'
        			}
        		}
        	},
        	yAxis: {
        		gridLineColor: '#707073',
        		labels: {
        			style: {
        				color: '#E0E0E3'
        			}
        		},
        		lineColor: '#707073',
        		minorGridLineColor: '#505053',
        		tickColor: '#707073',
        		tickWidth: 1,
        		title: {
              text: null,
        			style: {
        				color: '#A0A0A3'
        			}
        		}
        	},
          tooltip: {
          	backgroundColor: 'rgba(0, 0, 0, 0.5)',
          	borderWidth: 0,
          	shadow: true,
          	useHTML: true,
          	hideDelay: 300,
          	padding: 10,
          	headerFormat: '<p style="color:#E0E0E3;margin:0;font-weight:500;letter-spacing:0.02em;">{point.key}</p>',
          	pointFormat: '<div style="color:{series.color}"><span>{series.name}: <strong style="margin-left:5px">{point.y}</strong></span></div>'
          },
        	plotOptions: {
        		series: {
        			dataLabels: {
        				color: '#B0B0B3'
        			},
        			marker: {
        				lineColor: '#616161',
        				radius: 4
        			},
        			shadow: false,
        			lineWidth: 2,
        			borderColor: 'rgba(0,0,0,0.1)'
        		},
        		bar: {
        			groupPadding: 0.15,
        			borderColor: 'rgba(0,0,0,0.1)',
        			pointPadding: 0.07
        		},
            column: {
              groupPadding: 0.1,
              pointPadding: 0.05,
              borderWidth: 0,
              borderColor: 'rgba(0,0,0,0.1)'
            },
            spline: {
              lineWidth: 2
            },
        		pie: {
        			allowPointSelect: true,
        			cursor: 'pointer',
        			dataLabels: {
        				enabled: false
        			},
        			showInLegend: true,
        			borderWidth: 0.5
        		},
        		boxplot: {
        			fillColor: '#505053'
        		},
        		candlestick: {
        			lineColor: '#fafafa'
        		},
        		errorbar: {
        			color: '#fafafa'
        		}
        	},
        	legend: {
        		itemStyle: {
        			color: '#E0E0E3',
        			fontSize: '12px',
        			fontWeight: '400',
        			letterSpacing: '0.02em',
        			transition: 'all 0.3s ease-in-out'
        		},
        		itemHoverStyle: {
        			color: '#fafafa'
        		},
        		itemHiddenStyle: {
        			color: '#606063'
        		}
        	},
        	credits: {
            href: 'mailto:CSM-BPI.ReportingTeam@stefanini.com?subject=Stefanini Dashboard Query',
            text: 'Created by rykn0wxx',
        		style: {
              fontSize: '8px',
              letterSpacing: '0.02em',
              color: 'rgba(102,102,102,0.2)'
        		}
        	},
        	labels: {
        		style: {
        			color: '#707073'
        		}
        	},
        	drilldown: {
        		activeAxisLabelStyle: {
        			color: '#F0F0F3'
        		},
        		activeDataLabelStyle: {
        			color: '#F0F0F3'
        		}
        	},
        	navigation: {
        		buttonOptions: {
        			symbolStroke: '#e0e0e0',
        			theme: {
        				fill: '#616161',
        				states: {
        					hover: {
        						fill: '#505053'
        					},
        					select: {
        						stroke: '#eee',
        						fill: '#505053'
        					}
        				}
        			}
        		}
        	},
        	rangeSelector: {
        		buttonTheme: {
        			fill: '#505053',
        			stroke: '#212121',
        			style: {
        				color: '#9e9e9e',
        				transition: 'all 0.3s ease-in-out'
        			},
        			states: {
        				hover: {
        					fill: '#707073',
        					stroke: '#212121',
        					style: {
        						color: '#fafafa'
        					}
        				},
        				select: {
        					fill: '#575759',
        					stroke: '#212121',
        					style: {
        						color: '#fafafa'
        					}
        				}
        			}
        		},
        		inputBoxBorderColor: '#505053',
        		inputStyle: {
        			backgroundColor: '#333',
        			color: 'silver'
        		},
        		labelStyle: {
        			color: 'silver'
        		}
        	},
        	navigator: {
        		handles: {
        			backgroundColor: '#666',
        			borderColor: 'rgba(170,170,170,0.7)'
        		},
        		outlineColor: 'rgba(204,204,204,0.4)',
        		maskFill: 'rgba(255,255,255,0.1)',
        		series: {
        			color: '#8c9eff',
        			lineColor: '#82b1ff'
        		},
        		xAxis: {
        			gridLineColor: '#505053'
        		}
        	},
        	scrollbar: {
        		barBackgroundColor: '#808083',
        		barBorderColor: '#808083',
        		buttonArrowColor: '#CCC',
        		buttonBackgroundColor: '#606063',
        		buttonBorderColor: '#606063',
        		rifleColor: '#fafafa',
        		trackBackgroundColor: '#404043',
        		trackBorderColor: '#404043'
        	},
        	legendBackgroundColor: 'rgba(0, 0, 0, 0.5)',
        	background2: '#505053',
        	dataLabelsColor: '#B0B0B3',
        	textColor: '#C0C0C0',
        	contrastTextColor: '#F0F0F3',
        	maskColor: 'rgba(255,255,255,0.3)'
        }
      }
    }).call(this);
  }).call(this);

  var rykn0wxx = this.rykn0wxx;

  (function() {
    'use strict';
    (function() {
      'use strict';
      var ReportChart = function () {
        this.initialize.apply(this, arguments);
      };
      ReportChart.prototype = {
        initialize: function (elem) {
          this.chartContainer = elem;
          this.chartContainerId = null;
          this.chart = null;
          this.dataSource = elem.data('chart');
          this.withDate = elem.data('withDate') || false;
          this.getSetElemId(elem);
          this.setChart();
        },
        getSetElemId: function (el) {
          this.chartContainerId = el.attr('id') ? el.attr('id') : 'hchart' + Date.now();
          this.chartContainer.attr('id', this.chartContainerId);
        },
        destroyChart: function () {
          if (this.chart) {
            this.chart.destroy();
          }
        },
        setNoData: function () {
          this.chart.hideLoading();
        },
        setChart: function () {
          this.destroyChart();
          this.chart = Highcharts.chart(this.chartContainerId, {
            title: { text: null },
            series: []
          });
          this.chart.showLoading();
        },
        sendRequest: function () {
          var _this = this;
          $.getJSON(this.dataSource, function (data) {
            if (data.length !== 0) {
              _this.processChart(data);
            } else {
              _this.setNoData();
            }
          });
        },
        chartOption: function () {
          var initOpts = _.assign({}, rykn0wxx.chartConfig);
          if (this.withDate) {
            initOpts = _.set(initOpts, 'xAxis', {type: 'datetime'});
          }
          return initOpts;
        },
        buildChart: function (chartData) {
          var _this = this;
          var data = _.assign({}, _this.chartOption());
          data = _.set(data, 'series', chartData);
          _this.chartContainer.fadeOut('400', 'linear', function () {
            _this.destroyChart();
            _this.chartContainer.fadeIn('slow', function () {
              _this.chart = Highcharts.chart(_this.chartContainerId, data);
            });
          });
        },
        processChart: function(dataResponse) {
          var resp = _.clone(dataResponse);
          if (this.withDate) {
            resp = _.map(resp, function (d) {
              return {
                name: d.name,
                data: _.map(d.data, function (dd) {
                  var m = moment(dd[0]);
                  return [Date.UTC(m.year(), m.month(), m.date()), dd[1]];
                })
              };
            });
          }
          this.buildChart(resp);
        },
        type: 'ReportChart'
      };
      rykn0wxx.ReportChart = ReportChart;
    }).call(this);
  }).call(this);

}).call(this);
/*
(function () {
  'use strict';

  (function() {
    'use strict';
    (function() {
      'use strict';
      this.rykn0wxx = {
        inpFileSelector: 'input[data-csv-input=true]',
        fileInputSelector: 'input[type=file]:not(.not-bs-input)',
        dzFormSelector: '.frm-dropzone'
      };
    }).call(this);
  }).call(this);

  var rykn0wxx = this.rykn0wxx;

  (function() {
    'use strict';
    (function() {
      'use strict';
      var m = Element.prototype.matches || Element.prototype.matchesSelector || Element.prototype.mozMatchesSelector || Element.prototype.msMatchesSelector || Element.prototype.oMatchesSelector || Element.prototype.webkitMatchesSelector;
      var expando = '_ryxData';
      rykn0wxx.matches = function(element, selector) {
        if (selector.exclude !== null) {
          return m.call(element, selector.selector) && !m.call(element, selector.exclude);
        } else {
          return m.call(element, selector);
        }
      };
      rykn0wxx.getData = function (element, key) {
        var ref;
        return (ref = element[expando]) !== null ? ref[key] : void 0;
      };
      rykn0wxx.setData = function(element, key, value) {
        if (element[expando] === null) {
          element[expando] = {};
        }
        return element[expando][key] = value;
      };
      rykn0wxx.wrap = function (elem, wrapper) {
        elem.parentNode.insertBefore(wrapper, elem);
        wrapper.appendChild(elem);
      };
      rykn0wxx.gel = function (id) {
        if (typeof id != 'string') {
          return [];
        }
        return document.getElementById(id);
      };
      rykn0wxx.qes = function (selector) {
        if (typeof selector !== 'string') {
          return [];
        }
        return document.querySelector(selector);
      }
      rykn0wxx.$ = function (selector) {
        return Array.prototype.slice.call(document.querySelectorAll(selector));
      };
    }).call(this);
    (function() {
      'use strict';
      var matches = rykn0wxx.matches;
      var CustomEvent = window.CustomEvent;
      if (typeof CustomEvent !== 'function') {
        CustomEvent = function(event, params) {
          var evt = document.createEvent('CustomEvent');
          evt.initCustomEvent(event, params.bubbles, params.cancelable, params.detail);
          return evt;
        };
        CustomEvent.prototype = window.Event.prototype;
      }
      var fire = rykn0wxx.fire = function(obj, name, data) {
        var event = new CustomEvent(name, {
          bubbles: true,
          cancelable: true,
          detail: data
        });
        obj.dispatchEvent(event);
        return !event.defaultPrevented;
      };
      rykn0wxx.stopEverything = function(e) {
        fire(e.target, 'ujs:everythingStopped');
        e.preventDefault();
        e.stopPropagation();
        return e.stopImmediatePropagation();
      };
      rykn0wxx.delegate = function(element, selector, eventType, handler) {
        return element.addEventListener(eventType, function(e) {
          var target = e.target;
          while (!(!(target instanceof Element) || matches(target, selector))) {
            target = target.parentNode;
          }
          if (target instanceof Element && handler.call(target, e) === false) {
            e.preventDefault();
            return e.stopPropagation();
          }
        });
      };
    }).call(this);
    (function() {
      'use strict';
      rykn0wxx.inpFileTmpl = function (inpId, refElem) {
        var appElem = document.createElement('div');
        appElem.classList.add('input-append');
        appElem.innerHTML = '<input placeholder="Select a csv file..." id="appended_' + inpId + '_file" class="form-control input-sm string input-medium" type="text" /><span class="btn btn-sm btn-outline-secondary btn-delegate">Browse</span>';
        refElem.setAttribute('id', inpId + '_file');
        refElem.style.display = 'none';
        refElem.parentNode.insertBefore(appElem, refElem.nextSibling);
      };
      rykn0wxx.inpFileInit = function () {
        return new Promise(function(resolve, reject) {
          var elems = rykn0wxx.$(rykn0wxx.inpFileSelector);
          if (elems.length > 0) {
            elems.forEach(function (elem) {
              var elemId = elem.name;
              rykn0wxx.inpFileTmpl(elemId.substring(0, elemId.indexOf('[')), elem);
            });
            resolve('done');
          } else {
            reject('no element found');
          }
        });
      };
      rykn0wxx.inpFileBinder = function () {
        var inpFileElem = rykn0wxx.qes(rykn0wxx.inpFileSelector);
        var clicker = rykn0wxx.qes('.input-append .btn-delegate');
        clicker.addEventListener('click', function (event) {
          event.preventDefault();
          inpFileElem.click();
          event.stopPropagation();
        });
        inpFileElem.addEventListener('change', function (event) {
          var s = this.value;
          var elId = this.id || this.name;
          if (!this.id) {
            elId =  elId.substring(0, elId.indexOf('['));
          }
          rykn0wxx.gel('appended_' + elId).value = event.target.files[0].name;
          rykn0wxx.gel('csv-btn').removeAttribute('disabled');
          //$('#appended_' + appElemId).val(s.slice(s.lastIndexOf('\\') + 1));
        });
      };
    }).call(this);
    (function() {
      'use strict';
      var $ = rykn0wxx.$;
      var qes = rykn0wxx.qes;
      var wrap = rykn0wxx.wrap;
      var delegate = rykn0wxx.delegate;
      var stopEverything = rykn0wxx.stopEverything;
      rykn0wxx.setDropzone = function () {
        var dzForm = qes(rykn0wxx.dzFormSelector);
        var myDropzone = new Dropzone(rykn0wxx.dzFormSelector, { // Make the whole body a dropzone
          url: dzForm.getAttribute('action'),
          autoProcessQueue: false,
          uploadMultiple: false,
          parallelUploads: 1,
          maxFiles: 1,
          thumbnailWidth: 80,
          thumbnailHeight: 80,
          autoQueue: false
        });
      };
      rykn0wxx.initFileInput = function () {
        return new Promise(function (resolve, reject) {
          var elems = $(rykn0wxx.fileInputSelector);
          elems.forEach(function (elem) {
            var $elem = elem;
            var buttonWord = $elem.getAttribute('title') || 'Browse file';
            var btnWord = document.createElement('span');
            btnWord.innerText = $elem.getAttribute('title') || 'Browse file';
            var wrapper = document.createElement('a');
            wrapper.className += 'file-input-wrapper btn btn-primary btn-sm';
            wrap(elem, wrapper);
            wrapper.insertBefore(btnWord, wrapper.childNodes[0]);
            //jQuery(elem).wrap('<a class="file-input-wrapper btn btn-default ' + clsName + '"></a>').parent().prepend(jQuery('<span></span>').html(buttonWord));
          });
          //rykn0wxx.setDropzone();
          if (elems.length > 0) {
            resolve('done');
          } else {
            reject('no element found');
          }
        });
      };
      rykn0wxx.bindFileInput = function () {
        var fileInputWrapper = qes('.file-input-wrapper');
        var fileInputElem = qes('.file-input-wrapper input[type=file]');
        fileInputWrapper.addEventListener('mousemove', function (cursor) {
          var input, wrapper, wrapperX, wrapperY, inputWidth, inputHeight, cursorX, cursorY, moveInputX, moveInputY;
          wrapper = this;
          input = wrapper.querySelector('input');
          wrapperX = wrapper.offsetLeft;
          wrapperY = wrapper.offsetTop;
          inputWidth= input.clientWidth;
          inputHeight= input.clientHeight;
          cursorX = cursor.pageX;
          cursorY = cursor.pageY;
          moveInputX = cursorX - wrapperX - inputWidth + 20;
          moveInputY = cursorY- wrapperY - (inputHeight/2);
          input.setAttribute('style', 'left: ' + moveInputX + 'px; top: ' + moveInputY + 'px;');
        });
        fileInputElem.addEventListener('change', function (event) {
          var fileName = this.value;
          $('.file-input-name').forEach(function (elem) {
            elem.remove();
          });
          fileName = fileName.substring(fileName.lastIndexOf('\\') + 1, fileName.length);
          if (!fileName) {
            return
          }
          var fileInputName = document.createElement('span');
          fileInputName.classList.add('file-input-name');
          fileInputName.innerText = fileName;
          this.parentNode.after(fileInputName);
        });
      };
    }).call(this);
    (function() {
      'use strict';
      var rippleElems = [
        '.btn:not(.btn-link)',
        '.navbar a:not(.withoutripple)',
        '.dropdown-menu a',
        '.nav-tabs a:not(.withoutripple)'
      ].join(',');
      rykn0wxx.rippling = function () {
        jQuery(rippleElems).ripples();
      };
      $(rippleElems).ripples();
    }).call(this);
    (function() {
      'use strict';
      var fire = rykn0wxx.fire;
      var $ = rykn0wxx.$;
      var initFileInput = rykn0wxx.initFileInput;
      rykn0wxx.start = function () {
        if (!window._rykn0wxx_loaded) {
          console.log('not loaded');
          window._rykn0wxx_loaded = true;
        }
        window.addEventListener('pageshow', function () {
          rykn0wxx.inpFileInit().then(function () {
            rykn0wxx.inpFileBinder();
          }, function (err) {
            console.log(err);
          });
          rykn0wxx.rippling();
        });
      };
      if (window.rykn0wxx === rykn0wxx && fire(document, 'rykn0wxx:attachBindings')) {
        rykn0wxx.start();
      }
    }).call(this);
  }).call(this);

}).call(this);
*/
(function() {
  'use strict';

  function enableAlerts () {
    setTimeout(function () {
      $('.app-content').fadeOut(1600, 'linear', function() {
        $(this).remove();
      });
    }, 4500);
  }

  function activateRipples () {
    var rippleElems = [
      '.btn:not(.btn-link)',
      '.navbar a:not(.withoutripple)',
      '.dropdown-menu a',
      '.nav-tabs a:not(.withoutripple)'
    ].join(',');
    $(rippleElems).ripples();
  }

  function chartGenerator () {
    Highcharts.theme = rykn0wxx.chartConfig;
    Highcharts.setOptions(Highcharts.theme);
    $('[data-visuals="chart"]').each(function () {
      var _this = $(this);
      var chart = new rykn0wxx.ReportChart(_this);
      chart.sendRequest();
    });
  }

  function initRun () {
    // var headline = document.querySelector('.trigger-headline'),
    //   segmenter = new Segmenter(document.querySelector('.segmenter'), {
    //   pieces: 4,
    //   animation: {
    //     duration: 1500,
    //     easing: 'easeInOutExpo',
    //     delay: 100,
    //     translateZ: 100
    //   },
    //   parallax: true,
    //   positions: [
    //     {top: 0, left: 0, width: 45, height: 45},
    //     {top: 55, left: 0, width: 45, height: 45},
    //     {top: 0, left: 55, width: 45, height: 45},
    //     {top: 55, left: 55, width: 45, height: 45}
    //   ],
    //   onReady: function () {
    //     console.log(segmenter);
    //     setTimeout(function () {
    //       segmenter.animate();
    //       headline.classList.remove('trigger-headline--hidden');
    //     }, 500)
    //   }
    // });
    enableAlerts();
    activateRipples();
    chartGenerator();
    $('[data-toggle="tooltip"]').tooltip();
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

}).call(this);
