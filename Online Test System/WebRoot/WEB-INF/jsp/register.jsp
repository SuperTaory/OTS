<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="top.jsp"%>
<%
	String error = (String) session.getAttribute("err");
	String passwderror = "passwderror";
	String usererror = "usererror";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	if (error != null && error.equals(passwderror)) {
%>
<script type="text/javascript">
	alert("两次输入密码不同，请重新输入！")
</script>
<%
	} else if (error != null && error.equals(usererror)) {
%>
<script type="text/javascript">
	alert("用户名已存在，请重新创建！")
</script>
<%
	}
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
</head>
<body>

	<div align="center" style="margin-top:40px">
		<h3>注册</h3>
	</div>
	<div style="margin-left:340px;margin-top:40px">
		<form class="form-horizontal"
			action="${pageContext.request.contextPath }/users/registersubmit.action"
			method="post">
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="inputEmail3"
						name="username" placeholder="请输入用户名" value="${userinfo.username }">
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
				<label for="inputPassword3" class="col-sm-2 control-label">确认密码</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="inputPassword3"
						name="repassword" placeholder="请确认密码">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">年龄</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="inputPassword3"
						name="userage" placeholder="请输入年龄" value="${userinfo.userage }">
				</div>
			</div>
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">性别</label>
				<c:if test="${userinfo.usersex=='male' }">
					<label class="radio-inline" style="margin-left:12px"> <input
						type="radio" name="usersex" id="inlineRadio2" value="male" checked="checked">
						male
					</label>
					<label class="radio-inline"> <input type="radio"
						name="usersex" id="inlineRadio3" value="female"> female
					</label>
				</c:if>
				<c:if test="${userinfo.usersex=='female' }">
					<label class="radio-inline" style="margin-left:12px"> <input
						type="radio" name="usersex" id="inlineRadio2" value="male">
						male
					</label>
					<label class="radio-inline"> <input type="radio"
						name="usersex" id="inlineRadio3" value="female" checked="checked"> female
					</label>
				</c:if>
				<c:if test="${userinfo.usersex!='male'&&userinfo.usersex!='female' }">
					<label class="radio-inline" style="margin-left:12px"> <input
						type="radio" name="usersex" id="inlineRadio2" value="male">
						male
					</label>
					<label class="radio-inline"> <input type="radio"
						name="usersex" id="inlineRadio3" value="female"> female
					</label>
				</c:if>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">邮箱</label>
				<div class="col-sm-4">
					<input type="email" class="form-control" id="inputPassword3"
						name="email" placeholder="请输入邮箱" value="${userinfo.email }">
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