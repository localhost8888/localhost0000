$(document).ready(function(){var n="<div id=container>";n+="<header>\n    <div class=\"outer\">\n        <div class=\"inner\">\n            <div class=\"nav-wrap\">\n                \n                    <div class=\"promotion badge\">\n                        ON SALE\n                    </div>\n                \n                <span class=\"collapser button primary\">\n                    <i class=\"icon icon-bars fa fa-bars\"></i>\n                </span>\n                <!-- Navigation -->\n                <nav>\n                    <ul class=\"unstyled\">\n<li>\n<a href='http://komodoide.com' title='Home' target='_self'>\n<span class='link-name'>Home</span>\n</a>\n</li>\n<li>\n<a href='http://komodoide.com/features' title='Features' target='_self'>\n<span class='link-name'>Features</span>\n</a>\n</li>\n<li class=\"has-sub\">\n<a href='http://forum.komodoide.com/' title='Community' target='_self'>\n<span class='link-name'>Community</span>\n<i class='icon icon-sort-down'></i>\n</a>\n<ul class=\"\">\n<li>\n<a href='http://forum.komodoide.com/' title='Forums' target='_self'>\n<span class='link-name'>Forums</span>\n</a>\n</li>\n<li>\n<a href='http://komodoide.com/screencasts' title='Screencasts' target='_self'>\n<span class='link-name'>Screencasts</span>\n</a>\n</li>\n<li>\n<a href='http://komodoide.com/resources' title='Resources' target='_self'>\n<span class='link-name'>Resources</span>\n</a>\n</li>\n<li>\n<a href='http://komodoide.com/resources/submit-instructions/' title='Contribute' target='_self'>\n<span class='link-name'>Contribute</span>\n</a>\n</li>\n</ul>\n</li>\n<li>\n<a href='http://komodoide.com/blog' title='Blog' target='_self'>\n<span class='link-name'>Blog</span>\n</a>\n</li>\n<li>\n<a href='http://komodoide.com/download' title='Try' target='_self'>\n<span class='link-name'>Try</span>\n</a>\n</li>\n<li>\n<a href='http://komodoide.com/pricing' title='Buy & Upgrade' target='_self'>\n<span class='link-name'>Buy & Upgrade</span>\n</a>\n</li>\n</ul>\n                </nav>\n            </div>\n\n            <!-- Logo -->\n            <a href=\"http://komodoide.com\"><figure id=\"header-logo\"></figure></a>\n        </div>\n    </div>\n</header>\n",n+="</div>",$($(n)).insertBefore("#main"),$("header .collapser").click(function(){$("#container header nav").toggleClass("expanded")})});