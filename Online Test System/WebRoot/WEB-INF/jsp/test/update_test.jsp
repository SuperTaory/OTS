<%@page import="com.ttc.ssm.po.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../top.jsp"%>
<%User updateUser= new User();
 updateUser = (User)session.getAttribute("user"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>试卷维护</title>

</head>
<body>
	<div style="margin-left:80px">
		<h3>试卷维护</h3>
		<h5 style="margin-right:150px">
			<a
				href="${pageContext.request.contextPath }/test/testlist.action?username=<%=updateUser.getUsername() %>">上一级</a>
		</h5>
	</div>

	<form class="form-horizontal"
		action="${pageContext.request.contextPath }/test/managetestsubmit.action?eid=${exam.eid}"
		method="post">
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">试卷名称</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="ename" autofocus
					placeholder="${exam.ename }" value="${exam.ename }">
			</div>
		</div>
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">试卷发布者</label>
			<div class="col-sm-4">
				<input class="form-control" type="text"
					placeholder="${exam.username }" name="username"
					value="${exam.username }" readonly>
			</div>
		</div>
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">试题数量</label>
			<div style="margin-left:247px">
				<div class="row">
					<div class="col-xs-2">
						<input type="text" class="form-control" name="qnumbers"
							value="${exam.qnumbers }" readonly
							placeholder="${exam.qnumbers }">
					</div>
				</div>
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