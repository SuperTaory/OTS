<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="top.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
</head>
<body>
	<c:if test="${passwdWrong=='passwdWrong' }">
		<script type="text/javascript">
			alert("用户名或密码错误,请重新输入！")
		</script>
	</c:if>
	<div align="center" style="margin-top:40px">
		<h3>用户登录</h3>
	</div>
	<div style="margin-left:340px;margin-top:40px">
		<form class="form-horizontal"
			action="${pageContext.request.contextPath }/users/loginsubmit.action"
			method="post">
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="inputEmail3"
						name="username" placeholder="请输入用户名">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="inputPassword3"
						name="userpasswd" placeholder="请输入密码">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<div class="checkbox">
						<label> <input type="checkbox"> Remember me
						</label> </label> <label style="margin-left:120px"> <a
							onclick="javaScript:alert('暂不支持找回密码');">找回密码</a>
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