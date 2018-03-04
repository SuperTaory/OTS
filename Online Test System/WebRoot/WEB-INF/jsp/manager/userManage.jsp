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
<title>用户管理</title>
<script type="text/javascript">
	function check() {
		return confirm("确认删除？？？");
	}
</script>
</head>
<body>
	<c:if test="${updateRoleSuccess=='updateRoleSuccess' }">
		<script type="text/javascript">
			alert("修改权限成功！")
		</script>
	</c:if>
	<c:if test="${NotExist=='notexist' }">
		<script type="text/javascript">
			alert("用户名不存在！")
		</script>
	</c:if>
	<c:if test="${voidInput=='voidInput' }">
		<script type="text/javascript">
			alert("输入不能为空！")
		</script>
	</c:if>
	<div style="margin-left:80px">
		<h3>用户管理</h3>
	</div>
	<div style="margin-left:80px;margin-right:80px">
		<form class="form-inline"
			action="${pageContext.request.contextPath }/manager/searchUser.action"
			method="post">
			<div align="right" style="margin-bottom:30px">
				<input type="text" class="form-control" name="username">
				<button type="submit" class="btn btn-default">查询</button>
			</div>
		</form>
		<table class="table table-hover">
			<tr>
				<td></td>
				<td>用户id</td>
				<td>用户名</td>
				<td>角色</td>
				<td>会员等级</td>
				<td>&nbsp&nbsp&nbsp&nbsp操作</td>
				<td>&nbsp&nbsp&nbsp删除</td>
			</tr>
			<c:forEach items="${userList }" var="user">
				<tr>
					<td></td>
					<td>${user.userid }</td>
					<td>${user.username }</td>
					<td>${user.role }</td>
					<td>&nbsp&nbsp&nbsp&nbsp${user.level }</td>
					<c:if test="${user.userid!=null }">
						<td><a
							href="${pageContext.request.contextPath }/manager/updateRole.action?username=${user.username}">修改权限</a>&nbsp&nbsp
						</td>
						<td>
							<form onsubmit="return check()"
								action="${pageContext.request.contextPath }/manager/deleteUser.action?username=${user.username}"
								method="post" class="form-inline">
								<button type="submit" class="btn btn-default">删除</button>
							</form>
						</td>
					</c:if>
					<c:if test="${user.userid==null }">
						<td></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>