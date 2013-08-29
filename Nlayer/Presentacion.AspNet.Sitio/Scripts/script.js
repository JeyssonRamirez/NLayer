(function() {
    var b = document.uniqueID && document.compatMode && !window.XMLHttpRequest && document.execCommand;
    try {
        if (!!b) {
            b("BackgroundImageCache", false, true);
        }
    } catch(c) {
    }
    var d = navigator.userAgent.toLowerCase();
    var a = function(e) { return (d.indexOf(e) != -1); };
    jQuery("html").addClass([(!( /opera|webtv/i .test(d)) && /msie (\d)/ .test(d)) ? ("ie ie" + RegExp.$1) : a("firefox/2") ? "gecko firefox2" : a("firefox/3") ? "gecko firefox3" : a("gecko/") ? "gecko" : a("chrome/") ? "chrome" : a("opera/9") ? "opera opera9" : /opera (\d)/ .test(d) ? "opera opera" + RegExp.$1 : a("konqueror") ? "konqueror" : a("applewebkit/") ? "webkit safari" : a("mozilla/") ? "gecko" : "", (a("x11") || a("linux")) ? " linux" : a("mac") ? " mac" : a("win") ? " win" : ""].join(" "));
})();
var _artStyleUrlCached = null;

function artGetStyleUrl() {
    if (null == _artStyleUrlCached) {
        var d;
        _artStyleUrlCached = "";
        d = jQuery("link");
        for (var a = 0; a < d.length; a++) {
            var b = d[a].href;
            if (b && /style\.ie6\.css(\?.*)?$/ .test(b)) {
                return _artStyleUrlCached = b.replace( /style\.ie6\.css(\?.*)?$/ , "");
            }
        }
        d = jQuery("style");
        for (var a = 0; a < d.length; a++) {
            var c = new RegExp('import\\s+"([^"]+\\/)style\\.ie6\\.css"').exec(d[a].html());
            if (null != c && c.length > 0) {
                return _artStyleUrlCached = c[1];
            }
        }
    }
    return _artStyleUrlCached;
}

function artFixPNG(a) {
    if (jQuery.browser.msie && parseInt(jQuery.browser.version) < 7) {
        var b;
        if (a.tagName == "IMG") {
            if ( /\.png$/ .test(a.src)) {
                b = a.src;
                a.src = artGetStyleUrl() + "images/spacer.gif";
            }
        } else {
            b = a.currentStyle.backgroundImage.match( /url\("(.+\.png)"\)/i );
            if (b) {
                b = b[1];
                a.runtimeStyle.backgroundImage = "none";
            }
        }
        if (b) {
            a.runtimeStyle.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + b + "')";
        }
    }
}

jQuery(function() {
    jQuery.each(jQuery("ul.art-menu>li,ul.art-vmenu>li"), function(a, e) {
        var b = jQuery(e);
        var c = b.children("span");
        if (c.length == 0) {
            return;
        }
        var d = b.find("span.t").last();
        b.children("a").append(d.html(d.text()));
        c.remove();
    });
});
jQuery(function() {
    jQuery.each(jQuery("ul.art-menu>li:not(:last-child)"), function(a, b) { jQuery('<li class="art-menu-li-separator"><span class="art-menu-separator"> </span></li>').insertAfter(b); });
    if (!jQuery.browser.msie || parseInt(jQuery.browser.version) > 6) {
        return;
    }
    jQuery.each(jQuery("ul.art-menu li"), function(a, b) {
        b.j = jQuery(b);
        b.UL = b.j.children("ul:first");
        if (b.UL.length == 0) {
            return;
        }
        b.A = b.j.children("a:first");
        this.onmouseenter = function() {
            this.j.addClass("art-menuhover");
            this.UL.addClass("art-menuhoverUL");
            this.A.addClass("art-menuhoverA");
        };
        this.onmouseleave = function() {
            this.j.removeClass("art-menuhover");
            this.UL.removeClass("art-menuhoverUL");
            this.A.removeClass("art-menuhoverA");
        };
    });
});
jQuery(function() {
    if (!jQuery.browser.msie || parseInt(jQuery.browser.version) > 7) {
        return;
    }
    var a = jQuery("div.art-content");
    if (a.length !== 1) {
        return;
    }
    var b = a.parent().children(".art-layout-cell:not(.art-content)");
    jQuery(window).bind("resize", function() {
        if (a.w == a.parent().width()) {
            return;
        }
        var c = 0;
        a.css("width", "0");
        b.each(function() { c += this.clientWidth; });
        a.w = a.parent().width();
        a.css("width", a.w - c);
    }).trigger("resize");
    jQuery("div.art-content-layout-row").each(function() { this.c = jQuery(this).children(".art-layout-cell"); }).bind("resize", function() {
        if (this.h == this.clientHeight) {
            return;
        }
        this.c.css("height", "auto");
        this.h = this.clientHeight;
        this.c.css("height", this.h + "px");
    }).trigger("resize");
});

function artButtonSetup(a) {
    jQuery.each(jQuery("a." + a + ", button." + a + ", input." + a), function(d, e) {
        var c = jQuery(e);
        if (!c.parent().hasClass("art-button-wrapper")) {
            if (!c.hasClass("art-button")) {
                c.addClass("art-button");
            }
            jQuery("<span class='art-button-wrapper'><span class='art-button-l'> </span><span class='art-button-r'> </span></span>").insertBefore(c).append(c);
            if (c.hasClass("active")) {
                c.parent().addClass("active");
            }
        }
        c.mouseover(function() { jQuery(this).parent().addClass("hover"); });
        c.mouseout(function() {
            var f = jQuery(this);
            f.parent().removeClass("hover");
            if (!f.hasClass("active")) {
                f.parent().removeClass("active");
            }
        });
        c.mousedown(function() {
            var f = jQuery(this);
            f.parent().removeClass("hover");
            if (!f.hasClass("active")) {
                f.parent().addClass("active");
            }
        });
        c.mouseup(function() {
            var f = jQuery(this);
            if (!f.hasClass("active")) {
                f.parent().removeClass("active");
            }
        });
    });
}

jQuery(function() { artButtonSetup("art-button"); });
jQuery(function() { artButtonSetup("button"); });

Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

function BeginRequestHandler(b, a) {
    $("#loading").dialog({ height: 60, modal: true, closeOnEscape: false, draggable: false, resizable: false, show: "fade", hide: "fade", open: function(c, d) { $(".ui-dialog-titlebar-close").hide(); } });
}

function EndRequestHandler(b, a) {
    artButtonSetup("art-button");
    artButtonSetup("button");
    $("#loading").dialog("close");
    if (a.get_error() != undefined) {
        var m = a.get_error().message.replace("Sys.WebForms.PageRequestManagerServerErrorException: ", "");
        a.set_errorHandled(true);
        alert(m.toLocaleString());
    }
}

;