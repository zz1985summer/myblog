<!DOCTYPE html>
<html>
	<head>
		<title>Login</title>
		<meta charset="UTF-8" />		
		<link href="/static/css/login.css" rel="stylesheet">
		
	</head>
	<body>
		<form action="/user/login" method="post">
			UserName:<input type="text" name="username" />
			Password:<input type="password" name="password" />
			<input type="submit" value="Sign in" />
		</form>
	</body>
</html>