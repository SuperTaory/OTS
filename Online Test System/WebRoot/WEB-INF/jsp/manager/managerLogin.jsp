<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登录</title>

</head>
<body>
	<c:if test="${loginWrong=='loginWrong' }">
		<script type="text/javascript">
			alert("用户名或密码错误！")
		</script>
	</c:if>
	<div align="center" style="margin-top:40px">
		<h3>管理员登录</h3>
	</div>
	<div style="margin-left:340px;margin-top:40px">
		<form class="form-horizontal"
			action="${pageContext.request.contextPath }/manager/managerLogin.action"
			method="post">
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="inputEmail3"
						name="username" placeholder="请输入用户名">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">Password</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="inputPassword3"
						name="userpasswd" placeholder="请输入密码">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<div class="checkbox">
						<label> <input type="checkbox"> Remember me
						</label> <label style="margin-left:120px">
							<a onclick="javaScript:alert('暂不支持找回密码');">找回密码</a>
						</label>
					</div>

				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">Sign in</button>
				</div>
			</div>
		</form>
	</div>
</body>

</html>