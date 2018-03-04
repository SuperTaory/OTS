<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="top.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改个人信息</title>
</head>
<body>
	<div align="center" style="margin-top:40px">
		<h3>修改个人信息</h3>
	</div>
	<div style="margin-left:340px;margin-top:40px">
		<form class="form-horizontal"
			action="${pageContext.request.contextPath }/users/updateusersubmit.action?userid=${user.userid}"
			method="post">
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="inputEmail3"
						name="username" value="${user.username }" readonly>
				</div>
			</div>
			
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">年龄</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="inputPassword3"
						name="userage" value="${user.userage }">
				</div>
			</div>
			<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">性别</label>
				<c:if test="${user.usersex=='male' }">
				<label class="radio-inline" style="margin-left:12px"> <input type="radio"
					name="usersex" id="inlineRadio2" value="male" checked="checked">
					male
				</label> <label class="radio-inline"> <input type="radio"
					name="usersex" id="inlineRadio3" value="female">
					female
				</label>
				</c:if>
				<c:if test="${user.usersex=='female' }">
				<label class="radio-inline" style="margin-left:12px"> <input type="radio"
					name="usersex" id="inlineRadio2" value="male" >
					male
				</label> <label class="radio-inline"> <input type="radio"
					name="usersex" id="inlineRadio3" value="female" checked="checked">
					female
				</label>
				</c:if>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">邮箱</label>
				<div class="col-sm-4">
					<input type="email" class="form-control" id="inputPassword3"
						name="email" value="${user.email }">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">提交</button>
				</div>
			</div>
		</form>
	</div>
</body>

</html>