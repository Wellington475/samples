goog.provide('wf');

wf.debugMessage = '42';

(function() {
  var l, p = function(b, a) {
    return function() {
      return b.apply(a, arguments);
    };
  };
  wf.Waveform = function() {
    function b(a) {
      this.redraw = p(this.redraw, this);
      this.container = a.container;
      this.canvas = a.canvas;
      this.data = a.data || [];
      this.outerColor = a.outerColor || "transparent";
      this.innerColor = a.innerColor || "#000000";
      this.interpolate = !0;
      !1 === a.interpolate && (this.interpolate = !1);
      if (null == this.canvas) {
        if (this.container) {
          this.canvas = this.createCanvas(this.container, a.width || this.container.clientWidth, a.height || this.container.clientHeight);
        } else {
          throw "Either canvas or container option must be passed";
        }
      }
      this.patchCanvasForIE(this.canvas);
      this.context = this.canvas.getContext("2d");
      this.width = parseInt(this.context.canvas.width, 10);
      this.height = parseInt(this.context.canvas.height, 10);
      a.data && this.update(a);
    }
    b.name = "Waveform";
    b.prototype.setData = function(a) {
      return this.data = a;
    };
    b.prototype.setDataInterpolated = function(a) {
      return this.setData(this.interpolateArray(a, this.width));
    };
    b.prototype.setDataCropped = function(a) {
      return this.setData(this.expandArray(a, this.width));
    };
    b.prototype.update = function(a) {
      null != a.interpolate && (this.interpolate = a.interpolate);
      !1 === this.interpolate ? this.setDataCropped(a.data) : this.setDataInterpolated(a.data);
      return this.redraw();
    };
    b.prototype.redraw = function() {
      var a, c, e, d, g, f, b, h;
      this.clear();
      this.context.fillStyle = "function" === typeof this.innerColor ? this.innerColor() : this.innerColor;
      e = this.height / 2;
      c = 0;
      b = this.data;
      h = [];
      g = 0;
      for (f = b.length;g < f;g++) {
        a = b[g], d = this.width / this.data.length, "function" === typeof this.innerColor && (this.context.fillStyle = this.innerColor(c / this.width, a)), this.context.clearRect(d * c, e - e * a, d, e * a * 2), this.context.fillRect(d * c, e - e * a, d, e * a * 2), h.push(c++);
      }
      return h;
    };
    b.prototype.clear = function() {
      this.context.fillStyle = this.outerColor;
      this.context.clearRect(0, 0, this.width, this.height);
      return this.context.fillRect(0, 0, this.width, this.height);
    };
    b.prototype.patchCanvasForIE = function(a) {
      var c;
      if ("undefined" !== typeof window.G_vmlCanvasManager) {
        return a = window.G_vmlCanvasManager.initElement(a), c = a.getContext, a.getContext = function(e) {
          var d;
          d = c.apply(a, arguments);
          a.getContext = c;
          return d;
        };
      }
    };
    b.prototype.createCanvas = function(a, c, e) {
      var d;
      d = document.createElement("canvas");
      a.appendChild(d);
      d.width = c;
      d.height = e;
      return d;
    };
    b.prototype.expandArray = function(a, c, e) {
      var d, g, f;
      null == e && (e = 0);
      g = [];
      if (a.length > c) {
        g = a.slice(a.length - c, a.length);
      } else {
        for (d = f = 0, --c;0 <= c ? f <= c : f >= c;d = 0 <= c ? ++f : --f) {
          g[d] = a[d] || e;
        }
      }
      return g;
    };
    b.prototype.linearInterpolate = function(a, c, e) {
      return a + (c - a) * e;
    };
    b.prototype.interpolateArray = function(a, c) {
      var e, d, g, f, b, h;
      b = [];
      h = new Number((a.length - 1) / (c - 1));
      b[0] = a[0];
      for (f = 1;f < c - 1;) {
        d = f * h, g = (new Number(Math.floor(d))).toFixed(), e = (new Number(Math.ceil(d))).toFixed(), d -= g, b[f] = this.linearInterpolate(a[g], a[e], d), f++;
      }
      b[c - 1] = a[a.length - 1];
      return b;
    };
    b.prototype.optionsForSyncedStream = function(a) {
      var c, b;
      null == a && (a = {});
      c = !1;
      b = this;
      return {whileplaying:this.redraw, whileloading:function() {
        var d;
        c || (d = this, b.innerColor = function(c, b) {
          return c < d.position / d.durationEstimate ? a.playedColor || "rgba(255,  102, 0, 0.8)" : c < d.bytesLoaded / d.bytesTotal ? a.loadedColor || "rgba(0, 0, 0, 0.8)" : a.defaultColor || "rgba(0, 0, 0, 0.4)";
        }, c = !0);
        return this.redraw;
      }};
    };
    b.prototype.dataFromSoundCloudTrack = function(a) {
      var c = this;
      return l.get("http://www.waveformjs.org/w", {url:a.waveform_url}, function(a) {
        return c.update({data:a});
      });
    };
    return b;
  }();
  l = function() {
    var b, a, c, e, d;
    e = function(a) {
      var c, d, b;
      b = document.createElement("script");
      c = !1;
      b.src = a;
      b.async = !0;
      b.onload = b.onreadystatechange = function() {
        if (!(c || this.readyState && "loaded" !== this.readyState && "complete" !== this.readyState) && (c = !0, b.onload = b.onreadystatechange = null, b && b.parentNode)) {
          return b.parentNode.removeChild(b);
        }
      };
      d || (d = document.getElementsByTagName("head")[0]);
      return d.appendChild(b);
    };
    c = function(a) {
      return encodeURIComponent(a);
    };
    a = 0;
    d = this;
    b = {};
    return {get:function(g, f, l, h) {
      var m, n, k;
      n = -1 === (g || "").indexOf("?") ? "?" : "&";
      h = h || b.callbackName || "callback";
      k = h + "_json" + ++a;
      f = f || {};
      for (m in f) {
        f.hasOwnProperty(m) && (n += c(m) + "=" + c(f[m]) + "&");
      }
      d[k] = function(a) {
        l(a);
        try {
          delete d[k];
        } catch (b) {
        }
        return d[k] = null;
      };
      e(g + n + h + "=" + k);
      return k;
    }, init:function(a) {
      return a;
    }};
  }();
}).call(this);
