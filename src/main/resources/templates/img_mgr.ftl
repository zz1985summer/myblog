<!DOCTYPE html>
<html>
	<head>
		<title>My Articles</title>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<link href="/static/bootstrap/bootstrap.css" rel="stylesheet" type="text/css">
		<link href="/static/imgpicker/image-picker.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<div class="container">
    		<div>
        		<div class="text-center" style="padding-bottom: 20px;">
            		<button type="button" class="btn btn-primary select">选择</button>
            		<#-- <button type="button" class="btn btn-primary delete">删除</button> -->
        		</div>
        		
        		<select class="image-picker  show-html" style="display: none;">
        			
            			<#list results as item>
                			<option data-img-src="${item.url}" value="${item.name}">${item.name}</option>
            			</#list>
            		
        		</select>
    			</div>
		</div>
		
		
		<script type="text/javascript" src="/static/js/jquery-3.4.1.min.js"></script>
		<script type="text/javascript" src="/static/bootstrap/bootstrap.js"></script>
		<script type="text/javascript" src="/static/imgpicker/image-picker.min.js"></script>
		
		<script type="text/javascript">
			$("select.image-picker").imagepicker({
				hide_select:true,
				show_label: false
			});
			
			$(document).ready(function(){
   				$(".select").click(function(){
        			window.location.href = "/adminSelectImg/" + $(".image-picker").val() + "/" + ${callback};
    			});
    			<#-- $(".delete").click(function(){
        				window.location.href = "/adminDeleteImg/" + $(".image-picker").val();
    			     }); -->
			});
		</script>
	</body>
</html>