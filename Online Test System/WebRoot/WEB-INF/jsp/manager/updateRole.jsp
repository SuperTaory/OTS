<%@page import="com.ttc.ssm.po.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../top.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改权限</title>

</head>
<body>
	<div style="margin-left:80px;margin-bottom:40px">
		<h3>修改用户权限</h3>
		<h5 style="margin-right:150px">
			<a
				href="${pageContext.request.contextPath }/manager/userManage.action">上一级</a>
		</h5>
	</div>

	<form class="form-horizontal"
		action="${pageContext.request.contextPath }/manager/updateRoleSubmit.action?userid=${user.userid}"
		method="post">
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">用户id</label>
			<div class="col-sm-1">
				<input type="text" class="form-control" name="userid"
					placeholder="${user.userid }" value="${user.userid }" readonly>
			</div>
		</div>
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
			<div class="col-sm-2">
				<input class="form-control" type="text"
					placeholder="${user.username }" name="username"
					value="${user.username }" readonly>
			</div>
		</div>
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">用户年龄</label>
			<div class="col-sm-1">
				<input class="form-control" type="text"
					placeholder="${user.userage }" name="userage"
					value="${user.userage }" readonly>
			</div>
		</div>
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">用户性别</label>
			<div class="col-sm-1">
				<input class="form-control" type="text"
					placeholder="${user.usersex }" name="usersex"
					value="${user.usersex }" readonly>
			</div>
		</div>
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">用户权限</label>
			<div class="col-sm-2">
				<c:if test="${user.role=='normal'&&user.level==0 }">
					<select class="form-control" name="role">
						<option value="normal" selected="selected">普通</option>
						<option value="vip1">会员一级</option>
						<option value="vip2">会员二级</option>
						<option value="vip3">会员三级</option>
						<option value="issuer">发布者</option>
					</select>
				</c:if>
				<c:if test="${user.role=='vip'&&user.level==1 }">
					<select class="form-control" name="role">
						<option value="normal">普通</option>
						<option value="vip1" selected="selected">会员一级</option>
						<option value="vip2">会员二级</option>
						<option value="vip3">会员三级</option>
						<option value="issuer">发布者</option>
					</select>
				</c:if>
				<c:if test="${user.role=='vip'&&user.level==2 }">
					<select class="form-control" name="role">
						<option value="normal">普通</option>
						<option value="vip1">会员一级</option>
						<option value="vip2" selected="selected">会员二级</option>
						<option value="vip3">会员三级</option>
						<option value="issuer">发布者</option>
					</select>
				</c:if>
				<c:if test="${user.role=='vip'&&user.level==3 }">
					<select class="form-control" name="role">
						<option value="normal">普通</option>
						<option value="vip1">会员一级</option>
						<option value="vip2">会员二级</option>
						<option value="vip3" selected="selected">会员三级</option>
						<option value="issuer">发布者</option>
					</select>
				</c:if>
				<c:if test="${user.role=='issuer'&&user.level==0 }">
					<select class="form-control" name="role">
						<option value="normal">普通</option>
						<option value="vip1">会员一级</option>
						<option value="vip2">会员二级</option>
						<option value="vip3">会员三级</option>
						<option value="issuer" selected="selected">发布者</option>
					</select>
				</c:if>
			</div>
		</div>
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">用户邮箱</label>
			<div class="col-sm-2">
				<input class="form-control" type="email"
					placeholder="${user.email }" name="email" value="${user.email }"
					readonly>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default">提交</button>
			</div>
		</div>
	</form>
</body>
</html>