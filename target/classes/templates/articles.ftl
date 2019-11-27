<#assign security=JspTaglibs["http://www.springframework.org/security/tags"]/> 

<!DOCTYPE html>
<html>
	<head>
		<title>My Articles</title>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<link href="/static/bootstrap/bootstrap.css" rel="stylesheet" type="text/css">
		<link href="/static/css/articles.css" type="text/css" rel="stylesheet">		
	</head>
	<body>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="#">Ghost_Dark's Home</a>
			
    		<ul class="nav">
      			<li class="nav-item">
        			<a class="nav-link" href="/" style="">Home</a>
      			</li>
      			<li class="nav-item">
        			<a class="nav-link" href="/about_me">About</a>
      			</li>
      			<li class="nav-item">
        			<a class="nav-link" href="/login">Login</a>
      			</li>
    		</ul>
		</nav>
		
		<div class="badge_nav">
			<#-- 动态生成 -->
		</div>
		
		<div class="container">
			<#-- 文章内容列表 -->
			<div class="list-group" id="page_list">
				
			</div>
			
		</div>
		
		<nav aria-label="..." style="margin-top:20px;">
      		<ul id="idx_pagination" class="pagination justify-content-center">
    							
  			</ul>
      	</nav>
	
	
	<script type="text/javascript" src="/static/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="/static/bootstrap/bootstrap.js"></script>
	<script type="text/javascript" src="/static/js/articles.js"></script>
	</body>
</html>