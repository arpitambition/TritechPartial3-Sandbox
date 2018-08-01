@import "buttons.css";


/* BASICS */
html { background: #fff; }
body { font-family: Arial, Helvetica, Verdana, sans-serif; background: #fff; color: #636363; margin: 0; padding: 0; font-size: 87.5%; line-height: 1.28571428571429em; }
hr { margin: 5px 0; clear: both; border: none; border-top: 1px dotted #9a9a9a; }
h1, h2, h3, h4, h5, h6 { color: #525252; font-weight: normal; margin: 0.75em 0; }
h3 { font-size: 14px; font-weight: bold; }
h3.block-gray { color: #636363; background: #cbd0d2; margin: 0 0 1.5em 0; padding: 5px 10px; }
h3.block-gray .small { font-size: 13px; font-weight: normal; }
h3.block-gray .large { font-size: 15px; font-weight: bold; }
 
.clearfix:before, .clearfix:after { content: "\0020"; display: block; height: 0; overflow: hidden; }  
.clearfix:after { clear: both; }  
.clearfix { zoom: 1; }  
.bold { font-weight: bold; }
.highlight { color: #0d3891; }
.red { color: #ff000c; }
.small { font-size: 12px; }

/* LINKS & BUTTON CUSTOMIZE */
a, a:link, a:visited { color: #1865a3; text-decoration: none; }
a:hover, a:active { color: #636363; text-decoration: underline; }
a.gray, a.gray:link, a.gray:visited { color: #636363; text-decoration: none; }
a.gray:hover, a.gray:active { color: #1865a3; text-decoration: underline; }
a.butn { color: #fff !important; text-decoration: none !important; }
.btn.btn-125w { width: 125px; padding: 4px 0; }
.btn.btn-mini { padding: 0 8px; line-height: 18px; }
.btn.btn-mini.btn-mini-35w { padding: 1px 0; width: 35px; line-height: 18px; margin: 2px 0; }


/* ICONS */
.icon-sort-asc { width: 9px; height: 9px; background: transparent url(../img/icon/icon-sort-asc.png) right 4px no-repeat; padding-right: 12px; }
.icon-sort-desc { width: 9px; height: 9px; background: transparent url(../img/icon/icon-sort-desc.png) right 2px no-repeat; padding-right: 12px; }
.icon-arrow-left { width: 17px; height: 17px; background: transparent url(../img/icon/icon-arrow-left.png) no-repeat; display: inline-block; overflow: hidden; text-indent: -999em; }
.icon-arrow-right { width: 17px; height: 17px; background: transparent url(../img/icon/icon-arrow-right.png) no-repeat; display: inline-block; overflow: hidden; text-indent: -999em; }
.icon-search { width: 15px; height: 15px; background: transparent url(../img/icon/icon-search.png) no-repeat; display: inline-block; overflow: hidden; text-indent: -999em; }
.icon-vote { width: 30px; height: 30px; /*background: transparent url(../img/icon/icon-vote-all.png) no-repeat;*/ display: inline-block; overflow: hidden; text-indent: -999em; }
.icon-vote-up { background-position: 0 0; float: left; margin: 5px 2px; }
.icon-vote-up.active, .icon-vote-up:hover { background-position: -30px 0; }
.icon-vote-down { background-position: 0 -30px; float: right; margin: 5px 2px; }
.icon-vote-down.active, .icon-vote-down:hover { background-position: -30px -30px; }
@media only screen and (-webkit-min-device-pixel-ratio: 2) {
	.icon-sort-asc { background: transparent url(../img/icon/icon-sort-asc@2x.png) right 4px no-repeat; background-size: 9px 9px; }
	.icon-sort-desc { background: transparent url(../img/icon/icon-sort-desc@2x.png) right 4px no-repeat; background-size: 9px 9px; }
	.icon-arrow-left { background: transparent url(../img/icon/icon-arrow-left@2x.png) no-repeat; background-size: 17px 17px; }
	.icon-arrow-right { background: transparent url(../img/icon/icon-arrow-right@2x.png) no-repeat; background-size: 17px 17px; }
	.icon-search { background: transparent url(../img/icon/icon-search@2x.png) no-repeat; background-size: 15px 15px; }
	.icon-vote { background: transparent url(../img/icon/icon-vote-all@2x.png) no-repeat; background-size: 60px 60px; }
}

 
/* LAYOUT */
#wrapper { float: left; width: 100%; margin: 0; }
#content { margin-left: 225px; padding: 0 30px 100px 0; min-width: 725px; max-width: 1920px; }
#sidebar { float: left; width: 190px; margin-left: -100%; padding: 0 0 100px 15px; }


/* BOXES/BORDERS */
.borderbox-none { border: none; margin-bottom: 20px; }
.borderbox-gray { border: 1px solid #c4c4c4; margin-bottom: 20px; }
.borderbox-blue { border: 1px solid #2b4b79; margin-bottom: 20px; }
.borderbox-wide-margin-bottom { padding-bottom: 100px; }
.borderbox-header { background: #cbd0d2; padding: 5px 10px; font-weight: bold; font-size: 13px; }
.borderbox-header .btn { font-weight: normal; }
.borderbox-inner { padding: 10px 10px 5px 10px; }
.indent { padding: 0 10px 5px 10px; }


/* PAGINATE */
.paginate-records { font-size: 12px; line-height: 22px; float: left; }
.paginate-page { font-size: 12px; line-height: 22px; float: right; margin: 0 30px 0 0; }
.paginate-page a { margin: 0 15px; }


/* FORM BASIC */
label { font-weight: bold; line-height: 22px; }
input.form-styled { border: 1px solid #e8e8e8; padding: 5px; -webkit-borderbox-radius: 5px; -moz-borderbox-radius: 5px; borderbox-radius: 5px; }
textarea.form-styled { border: 1px solid #e8e8e8; padding: 5px; -webkit-borderbox-radius: 5px; -moz-borderbox-radius: 5px; borderbox-radius: 5px; }
select.form-styled { border: 1px solid #c4c4c4; line-height: 20px; height: 20px; }


/* FORM WRAPPERS */
.form-left { float: left; margin: 0 10px 10px 0; font-size: 12px; }
.form-left select.form-styled { min-width: 200px; }
.form-col { color: #464747; font-size: 12px; }
.form-col-label { clear: both; float: left; width: 120px; font-weight: bold; margin: 0 40px 10px 0; text-align: right; }
.form-col-input { float: left; margin: 0 0 10px 0; }
.form-col-input input.form-styled { width: 320px; }
.form-col-input textarea.form-styled{ width: 100%; }
.form-col-submit { clear: both; margin: 0 0 0 160px; padding: 10px 0; }


/* SIDEBAR (LEFT) */
.sidebar-module { border: 1px solid #2b4b79; margin: 0 0 10px 0; font-size: 12px; }
.sidebar-module a, .sidebar-module a:link, .sidebar-module a:visited { color: #1865a3; text-decoration: none; }
.sidebar-module a:hover, .sidebar-module a:active { color: #1865a3; text-decoration: underline; }
.sidebar-module h5 { background: #acadb3; color: #464747; padding: 5px 10px; margin: 0 0 5px 0; font-size: 13px; font-weight: bold; }
.sidebar-module .inner { padding: 5px 10px; }
.sidebar-module ul.recent { list-style-type: none; margin: 0; padding: 0; }
.sidebar-module ul.recent li { background: transparent url(../img/icon/icon-doc.png) 0 -1px no-repeat;  line-height: 17px; padding: 0 0 5px 25px; }
@media only screen and (-webkit-min-device-pixel-ratio: 2) {
	.sidebar-module ul.recent li { background: transparent url(../img/icon/icon-doc@2x.png) 0 -1px no-repeat; background-size: 17px 17px; }
}
.sidebar-module .input-sidebar { border: 1px solid #e8e8e8; padding: 3px; width: 118px; margin: 0 7px 0 0; -webkit-borderbox-radius: 5px; -moz-borderbox-radius: 5px; borderbox-radius: 5px; float: left; height: 18px; }
.sidebar-module .btn-mini-35w { margin: 1px 0; }
.sidebar-module form { margin: 0 0 10px 0; padding: 0; }


/* HOME */
p.home-intro { margin-bottom: 2em; }
.home-welcome { font-size: 18px; }
#content-home { width: 60%; float: left; }
#sidebar-home { width: 40%; float: left; }
#sidebar-home .inner { margin-left: 20px; background: #f2f2f2; padding: 10px 20px; font-size: 12px; line-height: 1.33333em; }
#sidebar-home ul { list-style-type: none; margin: 0 0 2.5em 0; padding: 0; }
#sidebar-home ul li { margin: 0 0 1em 0; padding: 0; }
#sidebar-home h2 { border-bottom: 1px dotted #525252; padding: 0 0 0.25em 0; }


/* ROUNDTABLE PAGES */
.rt-head { width: 50%; float: left; text-align: left; }
.rt-actions { width: 50%; float: right; text-align: right; margin: 0 0 5px 0; } 
.rt-cat-select { border: 1px solid #c4c4c4; line-height: 30px; height: 30px; font-size: 14px; min-width: 150px; margin: 0 15px; float: right; padding: 5px; }
.rt-btn-post { float: right; }
#rt-idea-wrapper { float: left; width: 100%; }
#rt-idea-wrapper.sidenav { background: #fff url(../img/bg-rt-idea-sidenav.gif) 0 0 repeat-y; }
#rt-idea-main { margin: 0px; padding: 0; }
#rt-idea-main.sidenav { margin-left: 240px; }
#rt-idea-sidenav { float: left; width: 230px; margin-left: -100%; padding: 10px 5px; background: #fff url(../img/bg-rt-idea-sidenav.gif) 0 0 repeat-y; }
#rt-idea-sidenav ul { margin: 0; padding: 0; list-style-type: none; font-size: 17px; }
#rt-idea-sidenav ul li { margin: 0 0 1px 0; padding: 0; }
#rt-idea-sidenav ul li a { padding: 5px 10px; display: block; }
#rt-idea-sidenav ul li a,
#rt-idea-sidenav ul li a:link,
#rt-idea-sidenav ul li a:visited { color: #636363; background: none; text-decoration: none; }
#rt-idea-sidenav ul li.active a,
#rt-idea-sidenav ul li a:hover,
#rt-idea-sidenav ul li a:active { color: #fff; background: #2b4b79; text-decoration: none; }
.rt-idea { padding: 15px 20px 15px 110px; border-bottom: 1px solid #c4c4c4; }
.rt-idea:last-child { border-bottom: none; }
.rt-idea-comment { padding: 15px 20px; border-bottom: 1px solid #c4c4c4; }
.rt-idea-comment:last-child { border-bottom: none; }
.rt-idea h3 { color: #0d3891; font-size: 19px; font-weight: bold; margin: 0.5em 0; padding: 0; }
.rt-idea h3 a,
.rt-idea h3 a:link,
.rt-idea h3 a:visited { color: #0d3891; text-decoration: none; }
.rt-idea h3 a:hover,
.rt-idea h3 a:active { color: #0d3891; text-decoration: underline; }
.rt-idea .tags { font-size: 12px; margin: 0.5em 0; font-weight: bold; }
.rt-idea p,
.rt-idea-comment p { margin: 0.5em 0; padding: 0; }
.rt-idea .author,
.rt-idea-comment .author { font-size: 11px; margin: 0.5em 0; font-weight: bold; }
.rt-idea .meta { font-size: 11px; margin: 0.5em 0; }
.rt-idea-comment .meta { font-size: 12px; margin: 0.5em 0; }
.rt-idea-vote { text-align: center; font-size: 11px; line-height: 1.25em; width: 70px; margin-left: -90px; float: left;}
.rt-idea-comment-count { font-size: 12px; margin-bottom: 0.25em; font-weight: bold; }
select.rt-categories { width: 150px; height: 100px; border: 1px solid #e8e8e8; padding: 3px; }
.rt-categories-btn-group { float: left; background: #cdd3d6; width: 21px; height: 60px; text-align: center; padding: 20px 0; }
.rt-categories-btn-group a { margin: 5px 0; }


/* KB */
.kb-head-wrap { width:705px }
.kb-head-left { float:left; }
.kb-head-right { float:right; font-size: 12px; }
.form-col-kb .form-col-input select.form-styled { width: 205px; }
.form-col-kb .form-col-input input.form-styled { width: 130px; }
.form-col-kb .form-col-label { width: 150px; margin: 0 20px 10px 0; }
.form-col-kb .form-col-submit { clear: both; margin: 0 0 0 170px; padding: 10px 0; }
.form-col-kb .form-col-block-wrap { clear: both; }
.form-col-kb .form-col-block { float: left; margin: 0 40px 10px 0; }


/* REPORTS */
.reports-nav-right { float: right; font-weight: normal; font-size: 12px; padding: 0 10px; }
ul.reports-nav-tab { float: left; list-style-type: none; margin: 3px 0 -3px 0; padding: 0; }
ul.reports-nav-tab li { float: left; margin: 0 3px 0 0; }
ul.reports-nav-tab a,
ul.reports-nav-tab a:link,
ul.reports-nav-tab a:visited {
-webkit-border-top-left-radius: 5px;
-webkit-border-top-right-radius: 5px;
-moz-borderbox-radius-topleft: 5px;
-moz-borderbox-radius-topright: 5px;
border-top-left-radius: 5px;
border-top-right-radius: 5px;
color: #1865a3;
background: #e8e8e8;
padding: 4px 16px;
}
ul.reports-nav-tab a:hover,
ul.reports-nav-tab a:active { color: #6d6d6d; background: #e8e8e8; }
ul.reports-nav-tab li.active a { color: #6d6d6d; background: #fff; }


 
