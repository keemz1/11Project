<%@ Page Language="C#" MasterPageFile="~/Pages/Main.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="EC1.Lab.Products" %>

<%@ Register Src="~/Pages/Product/Sub-Pages/GridViewControl.ascx" TagName="WebControl" TagPrefix="GWebControl" %>
<%@ Register Src="~/Pages/Product/Sub-Pages/ProductListViewControl.ascx" TagName="WebControl" TagPrefix="LWebControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .card-item .row {
            margin-bottom: 10px;
        }

        .card-item {
            margin-bottom: 15px;
        }

        .card {
            overflow: hidden;
        }
    </style>
</asp:Content>


<asp:Content ID="ContentProduct" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

    <div class="container-fluid">
        <div class="card">
            <div class="card-header row">
                <div class="col-3"></div>
                    <div class="page-title col text-left" >
                        <h1 style="color:black;">Books</h1>
                    </div>
                    <div class="col-3 text-right">
                        <button type="button" class="btn btn-light" title="View item(s) in cart"
                            runat=server onServerClick="OpenCart">
                            <i class="fa fa-shopping-cart fa-lg" aria-hidden="true"></i>
                            <span class="badge badge-light">
                                <asp:Label ID="lblCartCount" runat="server" Text="0"></asp:Label>
                            </span>
                        </button>
                    </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="left-sidebar sticky card-item col-md-4" data-spy="affix" data-offset-top="205">
                        <asp:HiddenField ID="hfProductId" runat="server" />
                        <asp:HiddenField ID="hfProductName" runat="server" />
                             <div class="productPacket card">
                                <div class="card-header row">
                                    <span class="h5 col text-left">Product Details</span>
                                    <asp:Button runat="server" id="btnAddToCart" cssclass="form-control col-lg-3 col-md-4 col-sm-5 btn btn-default btn-info" Text="Add Item" OnClick="AddItem_Click"/>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-4 text-left">
                                            <span class="h6">Name</span>
                                        </div>
                                        <div class="col">
                                            <asp:TextBox ID="txtproductName" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </div>
                     
                                    <div class="row">
                                        <div class="col-4 text-left">
                                            <span class="h6">Description</span>
                                        </div>
                                        <div class="col">
                                            <asp:TextBox ID="txtShortDescription" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-4 text-left">
                                            <span class="h6">Price</span>
                                        </div>
                                        <div class="col">
                                            <asp:TextBox ID="txtproductPrice" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </div>
                     
                                    <div class="row">
                                        <div class="col-4 text-left">
                                            <span class="h6">Quantity<span style="color: red; margin-left: 5px">*</span></span>
                                        </div>
                                        <div class="col">
                                            <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>

                    <div class="card-item col-md-8">
                            <div class="card">
                                <div class="card-header">
                                    <%--<button id="toggleViewBtn" class="form-control col-md-4 btn btn-default btn-dark">View Products</button>--%>
                                <p style="font-weight:600">
                                    Book List
                                </p>
                                </div>
                                <div class="card-body">
                                    <div class="grid container" overflow-x: auto;white-space: nowrap;">
                                        <GWebControl:WebControl ID="Grid" class="table table-bordered" runat="server" OnCommand="Item_Selected" />
                                    </div>
                                    <div class="product-grid">
                                        <LWebControl:WebControl ID="ListView" runat="server" OnCommand="Item_Selected" />
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">

        $(function () {
            $('.left-sidebar').StickySidebar({
                // Settings
                additionalMarginTop: 80
            });
        });


        (function ($) {
            $.fn.StickySidebar = function (options) {
                var defaults = {
                    'containerSelector': '',
                    'additionalMarginTop': 0,
                    'additionalMarginBottom': 0,
                    'updateSidebarHeight': true,
                    'minWidth': 0,
                    'disableOnResponsiveLayouts': true,
                    'sidebarBehavior': 'modern'
                };
                options = $.extend(defaults, options);

                // Validate options
                options.additionalMarginTop = parseInt(options.additionalMarginTop) || 0;
                options.additionalMarginBottom = parseInt(options.additionalMarginBottom) || 0;

                tryInitOrHookIntoEvents(options, this);

                // Try doing init, otherwise hook into window.resize and document.scroll and try again then.
                function tryInitOrHookIntoEvents(options, $that) {
                    var success = tryInit(options, $that);

                    if (!success) {
                        console.log('TST: Body width smaller than options.minWidth. Init is delayed.');

                        $(document).scroll(function (options, $that) {
                            return function (evt) {
                                var success = tryInit(options, $that);

                                if (success) {
                                    $(this).unbind(evt);
                                }
                            };
                        }(options, $that));
                        $(window).resize(function (options, $that) {
                            return function (evt) {
                                var success = tryInit(options, $that);

                                if (success) {
                                    $(this).unbind(evt);
                                }
                            };
                        }(options, $that))
                    }
                }

                // Try doing init if proper conditions are met.
                function tryInit(options, $that) {
                    if (options.initialized === true) {
                        return true;
                    }

                    if ($('body').width() < options.minWidth) {
                        return false;
                    }

                    init(options, $that);

                    return true;
                }

                // Init the sticky sidebar(s).
                function init(options, $that) {
                    options.initialized = true;

                    // Add CSS
                    $('head').append($('<style>.StickySidebar:after {content: ""; display: table; clear: both;}</style>'));

                    $that.each(function () {
                        var o = {};

                        o.sidebar = $(this);

                        // Save options
                        o.options = options || {};

                        // Get container
                        o.container = $(o.options.containerSelector);
                        if (o.container.length == 0) {
                            o.container = o.sidebar.parent();
                        }

                        // Create sticky sidebar
                        o.sidebar.parents().css('-webkit-transform', 'none'); // Fix for WebKit bug - https://code.google.com/p/chromium/issues/detail?id=20574
                        o.sidebar.css({
                            'position': 'relative',
                            'overflow': 'visible',
                            // The "box-sizing" must be set to "content-box" because we set a fixed height to this element when the sticky sidebar has a fixed position.
                            '-webkit-box-sizing': 'border-box',
                            '-moz-box-sizing': 'border-box',
                            'box-sizing': 'border-box'
                        });

                        // Get the sticky sidebar element. If none has been found, then create one.
                        o.stickySidebar = o.sidebar.find('.StickySidebar');
                        if (o.stickySidebar.length == 0) {
                            o.sidebar.find('script').remove(); // Remove <script> tags, otherwise they will be run again on the next line.
                            o.stickySidebar = $('<div>').addClass('StickySidebar').append(o.sidebar.children());
                            o.sidebar.append(o.stickySidebar);
                        }

                        // Get existing top and bottom margins and paddings
                        o.marginTop = parseInt(o.sidebar.css('margin-top'));
                        o.marginBottom = parseInt(o.sidebar.css('margin-bottom'));
                        o.paddingTop = parseInt(o.sidebar.css('padding-top'));
                        o.paddingBottom = parseInt(o.sidebar.css('padding-bottom'));

                        // Add a temporary padding rule to check for collapsable margins.
                        var collapsedTopHeight = o.stickySidebar.offset().top;
                        var collapsedBottomHeight = o.stickySidebar.outerHeight();
                        o.stickySidebar.css('padding-top', 1);
                        o.stickySidebar.css('padding-bottom', 1);
                        collapsedTopHeight -= o.stickySidebar.offset().top;
                        collapsedBottomHeight = o.stickySidebar.outerHeight() - collapsedBottomHeight - collapsedTopHeight;
                        if (collapsedTopHeight == 0) {
                            o.stickySidebar.css('padding-top', 0);
                            o.stickySidebarPaddingTop = 0;
                        }
                        else {
                            o.stickySidebarPaddingTop = 1;
                        }

                        if (collapsedBottomHeight == 0) {
                            o.stickySidebar.css('padding-bottom', 0);
                            o.stickySidebarPaddingBottom = 0;
                        }
                        else {
                            o.stickySidebarPaddingBottom = 1;
                        }

                        // We use this to know whether the user is scrolling up or down.
                        o.previousScrollTop = null;

                        // Scroll top (value) when the sidebar has fixed position.
                        o.fixedScrollTop = 0;

                        // Set sidebar to default values.
                        resetSidebar();

                        o.onScroll = function (o) {
                            // Stop if the sidebar isn't visible.
                            if (!o.stickySidebar.is(":visible")) {
                                return;
                            }

                            // Stop if the window is too small.
                            if ($('body').width() < o.options.minWidth) {
                                resetSidebar();
                                return;
                            }

                            // Stop if the sidebar width is larger than the container width (e.g. the theme is responsive and the sidebar is now below the content)
                            if (o.options.disableOnResponsiveLayouts) {
                                var sidebarWidth = o.sidebar.outerWidth(o.sidebar.css('float') == 'none');

                                if (sidebarWidth + 50 > o.container.width()) {
                                    resetSidebar();
                                    return;
                                }
                            }

                            var scrollTop = $(document).scrollTop();
                            var position = 'static';

                            // If the user has scrolled down enough for the sidebar to be clipped at the top, then we can consider changing its position.
                            if (scrollTop >= o.container.offset().top + (o.paddingTop + o.marginTop - o.options.additionalMarginTop)) {
                                // The top and bottom offsets, used in various calculations.
                                var offsetTop = o.paddingTop + o.marginTop + options.additionalMarginTop;
                                var offsetBottom = o.paddingBottom + o.marginBottom + options.additionalMarginBottom;

                                // All top and bottom positions are relative to the window, not to the parent elemnts.
                                var containerTop = o.container.offset().top;
                                var containerBottom = o.container.offset().top + getClearedHeight(o.container);

                                // The top and bottom offsets relative to the window screen top (zero) and bottom (window height).
                                var windowOffsetTop = 0 + options.additionalMarginTop;
                                var windowOffsetBottom;

                                var sidebarSmallerThanWindow = (o.stickySidebar.outerHeight() + offsetTop + offsetBottom) < $(window).height();
                                if (sidebarSmallerThanWindow) {
                                    windowOffsetBottom = windowOffsetTop + o.stickySidebar.outerHeight();
                                }
                                else {
                                    windowOffsetBottom = $(window).height() - o.marginBottom - o.paddingBottom - options.additionalMarginBottom;
                                }

                                var staticLimitTop = containerTop - scrollTop + o.paddingTop + o.marginTop;
                                var staticLimitBottom = containerBottom - scrollTop - o.paddingBottom - o.marginBottom;

                                var top = o.stickySidebar.offset().top - scrollTop;
                                var scrollTopDiff = o.previousScrollTop - scrollTop;

                                // If the sidebar position is fixed, then it won't move up or down by itself. So, we manually adjust the top coordinate.
                                if (o.stickySidebar.css('position') == 'fixed') {
                                    if (o.options.sidebarBehavior == 'modern') {
                                        top += scrollTopDiff;
                                    }
                                }

                                if (o.options.sidebarBehavior == 'stick-to-top') {
                                    top = options.additionalMarginTop;
                                }

                                if (o.options.sidebarBehavior == 'stick-to-bottom') {
                                    top = windowOffsetBottom - o.stickySidebar.outerHeight();
                                }

                                if (scrollTopDiff > 0) { // If the user is scrolling up.
                                    top = Math.min(top, windowOffsetTop);
                                }
                                else { // If the user is scrolling down.
                                    top = Math.max(top, windowOffsetBottom - o.stickySidebar.outerHeight());
                                }

                                top = Math.max(top, staticLimitTop);

                                top = Math.min(top, staticLimitBottom - o.stickySidebar.outerHeight());

                                // If the sidebar is the same height as the container, we won't use fixed positioning.
                                var sidebarSameHeightAsContainer = o.container.height() == o.stickySidebar.outerHeight();

                                if (!sidebarSameHeightAsContainer && top == windowOffsetTop) {
                                    position = 'fixed';
                                }
                                else if (!sidebarSameHeightAsContainer && top == windowOffsetBottom - o.stickySidebar.outerHeight()) {
                                    position = 'fixed';
                                }
                                else if (scrollTop + top - o.sidebar.offset().top - o.paddingTop <= options.additionalMarginTop) {
                                    // Stuck to the top of the page. No special behavior.
                                    position = 'static';
                                }
                                else {
                                    // Stuck to the bottom of the page.
                                    position = 'absolute';
                                }
                            }

                            /*
                             * Performance notice: It's OK to set these CSS values at each resize/scroll, even if they don't change.
                             * It's way slower to first check if the values have changed.
                             */
                            if (position == 'fixed') {
                                o.stickySidebar.css({
                                    'position': 'fixed',
                                    'width': o.sidebar.width(),
                                    'top': top,
                                    'left': o.sidebar.offset().left + parseInt(o.sidebar.css('padding-left'))
                                });
                            }
                            else if (position == 'absolute') {
                                var css = {};

                                if (o.stickySidebar.css('position') != 'absolute') {
                                    css.position = 'absolute';
                                    css.top = scrollTop + top - o.sidebar.offset().top - o.stickySidebarPaddingTop - o.stickySidebarPaddingBottom;
                                }

                                css.width = o.sidebar.width();
                                css.left = '';

                                o.stickySidebar.css(css);
                            }
                            else if (position == 'static') {
                                resetSidebar();
                            }

                            if (position != 'static') {
                                if (o.options.updateSidebarHeight == true) {
                                    o.sidebar.css({
                                        'min-height': o.stickySidebar.outerHeight() + o.stickySidebar.offset().top - o.sidebar.offset().top + o.paddingBottom
                                    });
                                }
                            }

                            o.previousScrollTop = scrollTop;
                        };

                        // Initialize the sidebar's position.
                        o.onScroll(o);

                        // Recalculate the sidebar's position on every scroll and resize.
                        $(document).scroll(function (o) {
                            return function () {
                                o.onScroll(o);
                            };
                        }(o));
                        $(window).resize(function (o) {
                            return function () {
                                o.stickySidebar.css({ 'position': 'static' });
                                o.onScroll(o);
                            };
                        }(o));

                        // Reset the sidebar to its default state
                        function resetSidebar() {
                            o.fixedScrollTop = 0;
                            o.sidebar.css({
                                'min-height': '1px'
                            });
                            o.stickySidebar.css({
                                'position': 'static',
                                'width': ''
                            });
                        }

                        // Get the height of a div as if its floated children were cleared. Note that this function fails if the floats are more than one level deep.
                        function getClearedHeight(e) {
                            var height = e.height();

                            e.children().each(function () {
                                height = Math.max(height, $(this).height());
                            });

                            return height;
                        }
                    });
                }
            }
        })(jQuery);




        $(document).ready(function () {
            var isGrid = false;
            var count = 1;
            var btn = document.getElementById('toggleViewBtn');

            var sessionMode = sessionStorage.getItem('mode') || 'grid';
            var sessionIsGrid = sessionMode === 'grid';
            isGrid = !sessionIsGrid;
            toggleView(false);

            function toggleView(isAnimated = true) {

                var animDuration = isAnimated ? 300 : 0;
                if (isGrid) {
                    this.isGrid = false;
                    $('.grid').fadeOut(animDuration, function () { $('.product-grid').fadeIn(animDuration); });
                    document.getElementById('toggleViewBtn').value = "View Products Page";
                } else {
                    this.isGrid = true;
                    $('.product-grid').fadeOut(animDuration, function () { $('.grid').fadeIn(animDuration); });
                    document.getElementById('toggleViewBtn').value = "View Products Page (GridView)";
                }
                sessionStorage.setItem('mode', isGrid ? 'grid' : 'list');
            }

            $('#toggleViewBtn').click(function (e) {
                e.preventDefault();
                toggleView();
            });

            //function to remove query params from a URL
            function removeURLParameter(url, parameter) {
                //better to use l.search if you have a location/link object
                var urlparts = url.split('?');
                if (urlparts.length >= 2) {

                    var prefix = encodeURIComponent(parameter) + '=';
                    var pars = urlparts[1].split(/[&;]/g);

                    //reverse iteration as may be destructive
                    for (var i = pars.length; i-- > 0;) {
                        //idiom for string.startsWith
                        if (pars[i].lastIndexOf(prefix, 0) !== -1) {
                            pars.splice(i, 1);
                        }
                    }

                    url = urlparts[0] + (pars.length > 0 ? '?' + pars.join('&') : "");
                    return url;
                } else {
                    return url;
                }
            }

            function insertParam(key, value) {
                if (history.pushState) {
                    // var newurl = window.location.protocol + "//" + window.location.host + search.pathname + '?myNewUrlQuery=1';
                    var currentUrl = window.location.href;
                    //remove any param for the same key
                    var currentUrl = removeURLParameter(currentUrl, key);

                    //figure out if we need to add the param with a ? or a &
                    var queryStart;
                    if (currentUrl.indexOf('?') !== -1) {
                        queryStart = '&';
                    } else {
                        queryStart = '?';
                    }

                    var newurl = currentUrl + queryStart + key + '=' + value
                    window.history.pushState({ path: newurl }, '', newurl);
                }
            }
            //});
    </script>
</asp:Content>
