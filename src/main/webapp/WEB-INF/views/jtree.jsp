<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Simple jsTree</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.8/themes/default/style.min.css" />
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.8/jstree.min.js"></script>
<script>
	$(function () {
		receiveData();
	});


        
	function receiveData() {
    		let url = "/tree";
    		$.ajax({
    			url : url, // ajax와 통신 할 곳
    			dataType : "json", // 수신될 데이터의 타입
    			type : "post", // 통신 방식
    			success : function(data) { // 통신 성공시 수행될 콜백 함수
    				let json = data.items;
    				console.log(json);
    				createJSTree(json);
    				let output = "<ul><li>";
    				$.each(data.items, function(i, e) {
    					output += e.id
    				});
    			},
    			error : function() { // 통신 실패시 수행될 콜백 함수

    			},
    		});
    	}
    	
	function createJSTree(json) {
		console.log(json);
		$('#SimpleJSTree').jstree({
			'core': {'data': json},
			"plugins" : [ "contextmenu" ]
		});
	}
</script>
<style>
/*Now the CSS Created by R.S*/
* {
	margin: 0;
	padding: 0;
}

.tree ul {
	padding-top: 20px;
	position: relative;
	transition: all 0.5s;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
}

.tree li {
	float: left;
	text-align: center;
	list-style-type: none;
	position: relative;
	padding: 20px 5px 0 5px;
	transition: all 0.5s;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
}

/*We will use ::before and ::after to draw the connectors*/
.tree li::before, .tree li::after {
	content: '';
	position: absolute;
	top: 0;
	right: 50%;
	border-top: 1px solid #ccc;
	width: 50%;
	height: 20px;
}

.tree li::after {
	right: auto;
	left: 50%;
	border-left: 1px solid #ccc;
}

/*We need to remove left-right connectors from elements without 
any siblings*/
.tree li:only-child::after, .tree li:only-child::before {
	display: none;
}

/*Remove space from the top of single children*/
.tree li:only-child {
	padding-top: 0;
}

/*Remove left connector from first child and 
right connector from last child*/
.tree li:first-child::before, .tree li:last-child::after {
	border: 0 none;
}
/*Adding back the vertical connector to the last nodes*/
.tree li:last-child::before {
	border-right: 1px solid #ccc;
	border-radius: 0 5px 0 0;
	-webkit-border-radius: 0 5px 0 0;
	-moz-border-radius: 0 5px 0 0;
}

.tree li:first-child::after {
	border-radius: 5px 0 0 0;
	-webkit-border-radius: 5px 0 0 0;
	-moz-border-radius: 5px 0 0 0;
}

/*Time to add downward connectors from parents*/
.tree ul ul::before {
	content: '';
	position: absolute;
	top: 0;
	left: 50%;
	border-left: 1px solid #ccc;
	width: 0;
	height: 20px;
}

.tree li a {
	border: 1px solid #ccc;
	padding: 5px 10px;
	text-decoration: none;
	color: #666;
	font-family: arial, verdana, tahoma;
	font-size: 11px;
	display: inline-block;
	border-radius: 5px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	transition: all 0.5s;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
}

/*Time for some hover effects*/
/*We will apply the hover effect the the lineage of the element also*/
.tree li a:hover, .tree li a:hover+ul li a {
	background: #c8e4f8;
	color: #000;
	border: 1px solid #94a0b4;
}
/*Connector styles on hover*/
.tree li a:hover+ul li::after, .tree li a:hover+ul li::before, .tree li a:hover+ul::before,
	.tree li a:hover+ul ul::before {
	border-color: #94a0b4;
}

/*Thats all. I hope you enjoyed it.
Thanks :)*/
</style>
</head>
<body>
	<div id="SimpleJSTree"></div>
	<div class="container">
		<div class="row">
			<div class="tree">
				<ul>
					<li><a href="#">Parent</a>
						<ul>
							<li><a href="#">Child</a>
								<ul>
									<li><a href="#">Grand Child</a></li>
								</ul></li>
							<li><a href="#">Child</a>
								<ul>
									<li><a href="#">Grand Child</a></li>
									<li><a href="#">Grand Child</a>
										<ul>
											<li><a href="#">Great Grand Child</a></li>
											<li><a href="#">Great Grand Child</a></li>
											<li><a href="#">Great Grand Child</a></li>
										</ul></li>
									<li><a href="#">Grand Child</a></li>
								</ul></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</div>

</body>
</html>

