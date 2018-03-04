<%@page import="com.ttc.ssm.po.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../top.jsp"%>
<%
	int eid = (Integer) session.getAttribute("eid");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>创建试卷分析</title>

</head>
<body>
	<div style="margin-left:80px">
		<h3>创建试卷分析-所属试卷id<%=eid%></h3>
	</div>
	<form class="form-horizontal"
		action="${pageContext.request.contextPath }/test/analysisSubmit.action?eid=<%=eid %>"
		method="post">
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">评分等级A:</label>
			<div class="col-sm-6">
				<textarea class="form-control" rows="4" name="acontent1"></textarea>
			</div>
		</div>
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">评分等级B:</label>
			<div class="col-sm-6">
				<textarea class="form-control" rows="4" name="acontent2"></textarea>
			</div>
		</div>
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">评分等级C:</label>
			<div class="col-sm-6">
				<textarea class="form-control" rows="4" name="acontent3"></textarea>
			</div>
		</div>
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">评分等级D:</label>
			<div class="col-sm-6">
				<textarea class="form-control" rows="4" name="acontent4"></textarea>
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default">下一步></button>
			</div>
		</div>
	</form>
</body>
</html>