<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/library/css/login.css" rel="stylesheet" type="text/css">
<title>登陆系统</title>
</head>
<body>
	<form action="/library/UserFunction" method="post">
		<input type="hidden" name="method" value="login" />
		<div class="login-main">
			<div class="login-top"></div>
			<div class="login-logo">
				<a href="#" target="_blank"><img src="../images/logo.png"
					alt="login" width="294" height="68" /></a>
			</div>
			<div class="login-input">
				<span>用户名</span>
				<div>
					<input type="text" name="username" id="user" />
				</div>
				<span>密码</span>
				<div>
					<input type="password" name="password" id="pw" />
				</div>
			</div>

			<div class="login-button">
				<div class="checkbox">
					<input type="checkbox" name="ispersis" id="ispersis" value="1" /><span>记住我</span>
				</div>
				<div class="button">
					<input type="submit" value="登&nbsp;&nbsp;&nbsp;&nbsp;录"
						class="submit">
				</div>
			</div>
			<div style="clear: both;"></div>
			<div class="login-bottom"></div>
			<div class="back">
				<a href="../">&laquo;返回首页</a>
			</div>
		</div>
	</form>
</body>
</html>