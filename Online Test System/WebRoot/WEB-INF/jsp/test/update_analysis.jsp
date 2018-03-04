<%@page import="com.ttc.ssm.po.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../top.jsp"%>
<%
	User analysisUser = new User();
	analysisUser = (User) session.getAttribute("user");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改试卷分析</title>

</head>
<body>
	<div style="margin-left:80px;margin-bottom:30px">
		<h3>修改试卷分析</h3>
		<h5 style="margin-right:150px">
			<a
				href="${pageContext.request.contextPath }/test/manageanalysis.action?username=<%=analysisUser.getUsername() %>">上一级</a>
		</h5>
	</div>
	<form class="form-horizontal"
		action="${pageContext.request.contextPath }/test/analysisSubmit.action?eid=${eid}"
		method="post">
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">评分等级A:</label>
			<div class="col-sm-6">
				<textarea class="form-control" rows="4" name="acontent1">${analysis.acontent1 }</textarea>
			</div>
		</div>
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">评分等级B:</label>
			<div class="col-sm-6">
				<textarea class="form-control" rows="4" name="acontent2">${analysis.acontent2 }</textarea>
			</div>
		</div>
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">评分等级C:</label>
			<div class="col-sm-6">
				<textarea class="form-control" rows="4" name="acontent3">${analysis.acontent3 }</textarea>
			</div>
		</div>
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">评分等级D:</label>
			<div class="col-sm-6">
				<textarea class="form-control" rows="4" name="acontent4">${analysis.acontent4 }</textarea>
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