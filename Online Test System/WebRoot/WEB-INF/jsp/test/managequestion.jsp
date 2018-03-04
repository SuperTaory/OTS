<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../top.jsp"%>
<%
	session.setAttribute("eid", null);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>试题维护</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<c:if test="${examNotExist=='examNotExist' }">
		<script type="text/javascript">
			alert("试卷名不存在！")
		</script>
	</c:if>
	<c:if test="${voidinput=='voidinput' }">
		<script type="text/javascript">
			alert("输入不能为空！")
		</script>
	</c:if>
	<div style="margin-left:80px">
		<h3>试题维护</h3>
	</div>
	<div style="margin-left:80px;margin-right:80px">
		<form class="form-inline"
			action="${pageContext.request.contextPath }/test/queryQuestion.action?username=${username}"
			method="post">
			<div align="right" style="margin-bottom:30px">
				<input type="text" class="form-control" name="ename">
				<button type="submit" class="btn btn-default">查询</button>
			</div>
		</form>
		<table class="table table-hover">
			<tr>
				<td>试卷id</td>
				<td>试卷名称</td>
				<td>发布者</td>
				<td>操作</td>
			</tr>
			<c:forEach items="${examlist }" var="exam">
				<tr>
					<td>${exam.eid }</td>
					<td>${exam.ename }</td>
					<td>${exam.username }</td>
					<c:if test="${exam.eid!=null }">
						<td><a
							href="${pageContext.request.contextPath }/test/update_question.action?eid=${exam.eid}">管理</a>
						</td>
					</c:if>
					<c:if test="${exam.eid==null }">
						<td></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
