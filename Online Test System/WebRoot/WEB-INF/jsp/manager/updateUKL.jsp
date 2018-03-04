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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>试卷管理</title>

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
	<c:if test="${updateSuccess=='updateSuccess' }">
		<script type="text/javascript">
			alert("修改成功！")
		</script>
	</c:if>
	<c:if test="${examNotExist=='examnotexist' }">
		<script type="text/javascript">
			alert("试卷不存在！")
		</script>
	</c:if>
	<c:if test="${inputvoid=='inputvoid' }">
		<script type="text/javascript">
			alert("输入不能为空！")
		</script>
	</c:if>
	<div style="margin-left:80px">
		<h3>试卷管理</h3>
	</div>
	<div style="margin-left:80px;margin-right:80px">
		<form class="form-inline"
			action="${pageContext.request.contextPath }/manager/searchExam.action"
			method="post">
			<div align="right" style="margin-bottom:30px">
				<input type="text" class="form-control" name="ename">
				<button type="submit" class="btn btn-default">查询</button>
			</div>
		</form>
		<table class="table table-hover">
			<tr>

				<td>试卷id</td>
				<td>试卷名</td>
				<td>所属用户</td>
				<td>试卷类别</td>
				<td>试卷等级</td>
				<td>操作</td>
			</tr>
			<c:forEach items="${examptionsList }" var="exam">
				<tr>
					<td>${exam.eid }</td>
					<td>${exam.ename }</td>
					<td>${exam.username }</td>
					<td>&nbsp&nbsp&nbsp${exam.ekind }</td>
					<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp${exam.elevel }</td>
					<c:if test="${exam.eid!=null }">
						<td><a
							href="${pageContext.request.contextPath }/manager/update.action?ename=${exam.ename}">管理</a>
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
