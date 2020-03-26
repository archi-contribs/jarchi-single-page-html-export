<!--
Single-page HTML Export

Created with Archi (https://www.archimatetool.com) and the following jArchi script:
https://github.com/archi-contribs/jarchi-single-page-html-export

Copyright (c) 2020 Phillip Beauvoir & Jean-Baptiste Sarrodie - MIT License
-->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>{{modelTitle}}</title>
    <!-- <link rel="stylesheet" href="normalize.css"> -->
	<style>
	{{normalize}}
	</style>
    <!-- <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet"> -->
	<style>
	{{regular}}
	</style>
	<style>
		body {
			font-family: 'Roboto', sans-serif;
			margin: 0;
		}
		nav {
			margin: 0;
			padding: 0;
			padding-left: 10px;
			overflow: hidden;
			background-color: #0074D9;
			color: #fff;
			top: 0;
  		position: fixed;
  		width: 100%;
  		height: 60px;
  		line-height: 60px;
  		z-index: 1000;
  		transition: all .3s;
		}
		nav label[for=menu] {
			font-size: 35px;
		}
		nav label[for=id-model] {
			padding-left: 10px;
		}
		nav * {
			display: table-cell;
    	vertical-align: middle;
		}
		aside {
			margin: 0;
			padding: 0;
			width: 350px;
			background-color: #37474f;
			color: #DDDDDD;
			height: 100%; /* 100% - nav.height */
			position: fixed; /* Make it stick, even on scroll */
			top:0;
		}
		aside header {
			height: 60px; /* Same as nav */
			padding: 0 10px;
		  vertical-align: middle;
		  display: table-cell;
		}
		aside header label[for=menu] {
			position: absolute;
			top: 10px;
			right: 20px;
			font-size: 35px;
		}
		article {
			margin-top: 60px;
			padding: 20px;
			height: calc(100% - 100px); /* 100% - nav.height - article.padding */
			background-color: #fff;
			overflow: auto; /* Enable scrolling if the sidenav has too much content */
			position: fixed;
			transition: all .3s;
		}
		#menu:checked ~ article {
				margin-left: 350px;
		}
		#menu:checked ~ nav {
				margin-left: 350px;
		}
		#menu:checked ~ nav label[for=menu] {
			display: none;
		}
		article header {
			background-color: #eceff1;
			margin: -20px -20px 0 -20px;
			padding: 20px;
			color: #546e7a;
		}
		img {
			max-width: 100%;
			margin: 20px 0;
		}
		body > input {
			display: none;
		}
		/* TABLE ================================================= */
		table {
			border-collapse: collapse;
			border-spacing: 0;
			text-align: left;
			/*border: 1px solid #dddddd;*/
			width: calc(100% - 1px);
		}
		td, th {
			padding: 10px 15px;
			border: 1px solid #dddddd;
		}
		th {
			text-align: left;
			font-weight: 700;
			color: #666666;
		}
		/* TABS ================================================= */
		.tabs {
			position: relative;
			overflow: hidden;
		}
		.tabs > input {
			display: none;
		}
		.tabs > input + * {
			width: 100%;
		}
		.tabs > input + label {
			width: auto;
			padding: 0 25px 15px 25px;
			text-transform: uppercase;
			color: #aaaaaa;
		}
		.tabs > input:checked + label {
			color: #666666;
			border-bottom: 2px solid #0074D9;
		}
		.tabs > .row {
			width: 100%;
			display: table;
			table-layout: fixed;
			position: relative;
			border-spacing: 0;
			margin: 18px 0 0 0;
			padding: 25px 0 0 0;
			border-top: 1px solid #e0e0e0;
		}
		.tabs > .row:before, .tabs > .row:after {
			display: none;
		}
		.tabs > .row > *, .tabs > .row img {
			display: table-cell;
			vertical-align: top;
			margin: 0;
			width: 100%;
		}
		.three.tabs > .row {
			width: 300%;
			left: -200%;
		}
		.three.tabs > input:nth-of-type(1):checked ~ .row {
			margin-left: 200%;
		}
		.three.tabs > input:nth-of-type(2):checked ~ .row {
			margin-left: 100%;
		}
		.three.tabs > label img {
			width: 30%;
			margin: 5% 0 5% 5%;
		}
		.tabs.four .row {
			width: 400%;
			left: -300%;
		}
		.tabs.four input:nth-of-type(1):checked ~ .row {
			margin-left: 300%;
		}
		.tabs.four input:nth-of-type(2):checked ~ .row {
			margin-left: 200%;
		}
		.tabs.four input:nth-of-type(3):checked ~ .row {
			margin-left: 100%;
		}
		/* TREE ================================================= */
		ol.tree {
			padding-left: 30px;
			padding-right: 10px;
			margin: 0;
			font-size: smaller;
			height: calc(100% - 60px);
			overflow: auto; /* Enable scrolling if the sidenav has too much content */
		}
		ol.tree li {
			position: relative;
			margin-left: -15px;
			list-style: none;
		}
		ol.tree li.view {
			margin-left: -1px !important;
		}
		ol.tree li.view a, ol.tree li.view label {
			background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABHUlEQVR42mNgAALxkkXc2DADw39GBkJAKm0zl0jm6v+SOWt/ImOg2D/xnFWKRBkgmbv29380oFG26TPRBkgADbj77v9/ZKxaAjHg4Iv/97FhFAPEc9b+3nbn/39krFQEMUAja/ZjbBjFADGgAZ1Hfv9HxnIFG8EGCES0K2DDqAZkr/kmnr32BzIGiQlkr5VnoBSIZa35IZq5+g8ICxSsFyDHgD+vP/34L5279jt/5lJBgdCu+0D8H0nJf0bBtFVy2DBD6CpmYAx9AkYz0FtrvmJ1ATQh/VMu3vABGYtmrf5L34R06+3//8iY5IS0+db//8iYtISUvfZP7Z6v/5GxTP7GL0QlJJnCVZwSOeteSedteI+MQWJCuWtlCAUBACpIZ/AV0p6pAAAAAElFTkSuQmCC) 0 0 no-repeat;
			color: #DDDDDD;
			padding-left: 21px;
			text-decoration: none;
			display: block;
		}
		ol.tree li.view input:checked + label{
			font-weight: 700;
		}
		ol.tree li input {
			position: absolute;
			left: 0;
			margin-left: 0;
			opacity: 0;
			z-index: 2;
			cursor: pointer;
			height: 1em;
			width: 1em;
			top: 0;
		}
		ol.tree li input + ol {
			background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAYAAABWdVznAAAABHNCSVQICAgIfAhkiAAAANFJREFUKJGN0TGLg0AQBeDRIXcBa9HaWkRSiLhFUqQ+0oRw5PwV+Y1bSASLtUgIWSyDtUKumN1rss3B7d7U88F7PIDXRVG05pxfiqLYI+I7uC7Lsq9pmp5N01zLsjx4nuc7wTzP30SkhBBDkiTbfwGttSYi1ff9kOf5ByK+OYFB1ni/gUFCiCEMw5X5sxcDgCAIlr7vL5xAKaW7rrvXdX0ax/HsjCSlfDDGjoi4tJYmIiWlfKRpurNuYYZr2/bGGDs6h4vjeMM5v1RV9flnDAD4ASfhkWnpPbM4AAAAAElFTkSuQmCC) 40px 0px no-repeat;
			margin: -0.938em 0 0 -44px; /* 15px */
			height: 1em;
		}
		ol.tree li input + ol > li {
			display: none;
			margin-left: -14px !important;
			padding-left: 1px;
		}
		ol.tree li label {
			background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAB3RJTUUH4wobCSUYZeJ4jQAAAAlwSFlzAAAOdAAADnQBaySz1gAAAARnQU1BAACxjwv8YQUAAADFSURBVHjaY2QAgv/H7ZmAFAsQg+h/QPyH0fIgiCYImICa44D0RyD+CcTfofRToLgVMQYwAhW+BNJiWOSOAXEh1EUw1yDTn4CufAAy4DOQw0OMbVhAEwuUMQ+IzyDZgNW7aHwDIM6BBdwbqP9JAe+BmI2JRE0YroJ54T8oQMkygUIXgA0g1xCQq5mo4gJyASPMgH8MZAYgCIBi4QsQKzFA8gPMbwRtBgJlIP4EMqAWiCcDcQiJlv8C4lywadDszEaqAaAsDwA2gTLa4k4cBwAAAABJRU5ErkJggg==) 15px 0px no-repeat;
			cursor: pointer;
			display: block;
			padding-left: 37px;
		}
		ol.tree li input:checked + ol {
			background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAYAAABWdVznAAAABHNCSVQICAgIfAhkiAAAALNJREFUKJG1j7EKwjAQhu8SRPcS6lRwbyEIQWgQH8BF0EX6uqVdOjRTB+FwrEvf4KKDdJAa6NJv/r/jO4ClQaXUMYqi7ZzxMAwvLMuy01rv5gjOuScYY251XXfM7N8BmNk3TfPI8/wOUsq1Mebati2FJCLqrbWFlHLzfQRRJElycs79SMzsiahP0/SCiGLSmGXZuaqqjpn9mGGtLf6OAQCEEKsxb5IRAhGFUmofx/EheHlRPvgBhvMrcqjgAAAAAElFTkSuQmCC) 40px 3px no-repeat;
			margin: -1.25em 0 0 -44px; /* 20px */
			padding: 1.563em 0 0 80px;
			height: auto;
		}
		ol.tree li input:checked + ol > li {
			display: block; margin: 0 0 0.125em;  /* 2px */
		}
		ol.tree li input:checked + ol > li:last-child {
			margin: 0 0 0.063em; /* 1px */
		}
		/* VISIBILITY RULES ================================================= */
		.hidden {
			position: absolute;
			left: -9999999px;
		}
		#id-model:checked ~ article .id-model {
			position: static;
		}
		{{visibilityRules}}
	</style>
  </head>
	<body>
		<input type="checkbox" id="menu" checked>
		<input id='id-model' type='radio' name='views' checked>
		{{inputCheckbox}}

		<aside class="navigation">
			<header>
			  <h3>Content</h3>
			  <label for="menu">×</label>
			</header>
			<ol class="tree">
				{{treeContent}}
			</ol>
		</aside>

		<nav>
			<label for="menu">☰</label>
			<label for="id-model">
				<h3>{{modelTitle}}</h3>
			</label>
		</nav>

		<article>
			<header>
			 	<h2 class="hidden id-model">{{modelTitle}}</h2>
				{{header}}
			</header>

			<img class="hidden id-model">
			{{images}}

			<div class="tabs three" style="text-align: center;">
				<input id='tab-1' type='radio' name='tabgroup' checked />
				<label for="tab-1">Documentation</label>
				<input id='tab-3' type='radio' name='tabgroup'>
				<label for="tab-3">Elements</label>
				<input id='tab-4' type='radio' name='tabgroup'>
				<label for="tab-4">Relationships</label>
				<div class="row" style="text-align: left;">
					<div>
						<div class="hidden id-model">{{modelPurpose}}</div>
						{{documentation}}
					</div>
					
					<div>
						<table>
							<thead><tr>
								<th>Name</th>
								<th>Type</th>
								<th>Documentation</th>
							</tr></thead>
							<tbody>
								<tr class="hidden">
									<td></td>
									<td></td>
									<td></td>
								</tr>
								{{elements}}
							</tbody>
						</table>
					</div>
					
					<div>
						<table>
							<thead><tr>
								<th>Name</th>
								<th>Type</th>
								<th>Source</th>
								<th>Target</th>
								<th>Documentation</th>
							</tr></thead>
							<tbody>
								<tr class="hidden">
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								{{relationships}}
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</article>
	</body>
</html>







