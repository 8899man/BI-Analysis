/* Copyright (c) 2013-2014, Null McNull https://github.com/McNull, LICENSE: MIT */
angular.module("blockUI", ["templates-angularBlockUI"]), angular.module("blockUI").config(["$provide", "$httpProvider", function(a, b) {
    a.decorator("$exceptionHandler", ["$delegate", "$injector", function(a, b) {
        var c, d;
        return function(e, f) {
            d = d || b.get("blockUIConfig"), d.resetOnException && (c = c || b.get("blockUI"), c.instances.reset()), a(e, f)
        }
    }]), b.interceptors.push("blockUIHttpInterceptor")
}]), angular.module("blockUI").run(["$document", function(a) {
    a.find("body").append('<div block-ui="main"></div>')
}]), angular.module("blockUI").provider("blockUIConfig", function() {
    var a = {
        templateUrl: "angular-block-ui/angular-block-ui.tmpl.html",
        delay: 250,
        message: "Loading ...",
        autoBlock: !0,
        resetOnException: !0,
        requestFilter: angular.noop
    };
    this.templateUrl = function(b) {
        a.templateUrl = b
    }, this.template = function(b) {
        a.template = b
    }, this.delay = function(b) {
        a.delay = b
    }, this.message = function(b) {
        a.message = b
    }, this.autoBlock = function(b) {
        a.autoBlock = b
    }, this.resetOnException = function(b) {
        a.resetOnException = b
    }, this.requestFilter = function(b) {
        a.requestFilter = b
    }, this.$get = function() {
        return a
    }
}), angular.module("blockUI").directive("blockUi", ["blockUI", "blockUIConfig", "blockUiLinkFn", function(a, b, c) {
    return {
        scope: !0,
        restrict: "A",
        templateUrl: b.template ? void 0 : b.templateUrl,
        template: b.template,
        link: c
    }
}]).factory("blockUiLinkFn", ["blockUI", "blockUIUtils", function(a, b) {
    return function(c, d, e) {
        var f = d.parent();
        if (f.length) {
            var g = a;
            if ("BODY" === f[0].tagName) var h = c.$on("$viewContentLoaded", function() {
                h(), c.$on("$locationChangeStart", function(a) {
                    c.state.blockCount > 0 && a.preventDefault()
                })
            });
            else {
                f.css("position", "relative");
                var i = e.blockUi ? e.blockUi : "_" + c.$id;
                g = a.instances.get(i);
                var j = d.inheritedData("block-ui");
                j && (g._parent = j);
                var k = e.blockUiPattern;
                if (k) {
                    var l = b.buildRegExp(k);
                    g.pattern(l)
                }
                c.$on("$destroy", function() {
                    g.release()
                }), g.addRef()
            }
            d.addClass("block-ui"), f.data("block-ui", g), c.state = g.state()
        }
    }
}]), angular.module("blockUI").factory("blockUIHttpInterceptor", ["$q", "$injector", "blockUIConfig", function(a, b, c) {
    function d() {
        g = g || b.get("blockUI")
    }

    function e(a) {
        c.autoBlock && !a.$_noBlock && a.$_blocks && (d(), a.$_blocks.stop())
    }

    function f(b) {
        return e(b.config), a.reject(b)
    }
    var g;
    return {
        request: function(a) {
            return c.autoBlock && (c.requestFilter(a) === !1 ? a.$_noBlock = !0 : (d(), a.$_blocks = g.instances.locate(a), a.$_blocks.start())), a
        },
        requestError: f,
        response: function(a) {
            return e(a.config), a
        },
        responseError: f
    }
}]), angular.module("blockUI").factory("blockUI", ["blockUIConfig", "$timeout", "blockUIUtils", "$document", function(a, b, c, d) {
    function e(e) {
        var g, i = this,
            j = {
                id: e,
                blockCount: 0,
                message: a.message,
                blocking: !1
            },
            k = [];
        this._refs = 0, this.start = function(e) {
            j.message = e || a.message, j.blockCount++;
            var f = angular.element(d[0].activeElement);
            f.length && c.isElementInBlockScope(f, i) && (i._restoreFocus = f[0], i._restoreFocus.blur()), g || (g = b(function() {
                g = null, j.blocking = !0
            }, a.delay))
        }, this._cancelStartTimeout = function() {
            //g && (b.cancel(g), g = null)

            if(g){
              b.cancel(g);
              g = null;
            }
        }, this.stop = function() {
            j.blockCount = Math.max(0, --j.blockCount), 0 === j.blockCount && this.reset(!0)
        }, this.message = function(a) {
            j.message = a
        }, this.pattern = function(a) {
            return void 0 !== a && (i._pattern = a), i._pattern
        }, this.reset = function(a) {
            i._cancelStartTimeout(), j.blockCount = 0, j.blocking = !1, !i._restoreFocus || d[0].activeElement && d[0].activeElement !== f[0] || (i._restoreFocus.focus(), i._restoreFocus = null);
            try {
                a && angular.forEach(k, function(a) {
                    a()
                })
            } finally {
                k.length = 0
            }
        }, this.done = function(a) {
            k.push(a)
        }, this.state = function() {
            return j
        }, this.addRef = function() {
            i._refs += 1
        }, this.release = function() {
            --i._refs <= 0 && h.instances._destroy(i)
        }
    }
    var f = d.find("body"),
        g = [];
    g.get = function(a) {
        var b = g[a];
        return b || (b = g[a] = new e(a), g.push(b)), b
    }, g._destroy = function(a) {
        if (angular.isString(a) && (a = g[a]), a) {
            a.reset(), delete g[a.state().id];
            for (var b = g.length; --b;)
                if (g[b] === a) {
                    g.splice(b, 1);
                    break
                }
        }
    }, g.locate = function(a) {
        var b = [];
        c.forEachFnHook(b, "start"), c.forEachFnHook(b, "stop");
        for (var d = g.length; d--;) {
            var e = g[d],
                f = e._pattern;
            f && f.test(a.url) && b.push(e)
        }
        return 0 === b.length && b.push(h), b
    }, c.forEachFnHook(g, "reset");
    var h = g.get("main");
    return h.addRef(), h.instances = g, h
}]), angular.module("blockUI").factory("blockUIUtils", function() {
    var a = {
        buildRegExp: function(a) {
            var b, c = a.match(/^\/(.*)\/([gim]*)$/);
            if (!c) throw Error("Incorrect regular expression format: " + a);
            return b = new RegExp(c[1], c[2])
        },
        forEachFn: function(a, b, c) {
            for (var d = a.length; d--;) {
                var e = a[d];
                e[b].apply(e, c)
            }
        },
        forEachFnHook: function(b, c) {
            b[c] = function() {
                a.forEachFn(this, c, arguments)
            }
        },
        isElementInBlockScope: function(a, b) {
            for (var c = a.inheritedData("block-ui"); c;) {
                if (c === b) return !0;
                c = c._parent
            }
            return !1
        }
    };
    return a
}), angular.module("templates-angularBlockUI", ["angular-block-ui/angular-block-ui.tmpl.html"]), angular.module("angular-block-ui/angular-block-ui.tmpl.html", []).run(["$templateCache", function(a) {
    a.put("angular-block-ui/angular-block-ui.tmpl.html", '<div ng-show="state.blockCount > 0" class="block-ui-overlay" ng-class="{ \'block-ui-visible\': state.blocking }"></div>\n<div ng-show="state.blocking" class="block-ui-message-container">\n  <div class="block-ui-message"><div class="loading-outer"><div class="loading-logo"></div><div class="loading-circle"></div></div></div><div class="loading-text">{{ state.message }}</div>  \n</div>\n')
}]);
