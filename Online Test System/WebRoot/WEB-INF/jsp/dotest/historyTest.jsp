<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	int i = 0;
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../top.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>历史测试</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	function check() {
		return confirm("确认删除？？？");
	}
</script>
</head>

<body>
	<c:if test="${notExist=='notExist' }">
		<script type="text/javascript">
			alert("未查找到相关历史测试！")
		</script>
	</c:if>
	<c:if test="${inputvoid=='inputvoid' }">
		<script type="text/javascript">
			alert("输入不能为空！")
		</script>
	</c:if>
	<div style="margin-left:80px">
		<h3>历史测试结果</h3>
	</div>
	<div style="margin-left:80px;margin-right:80px">
		<form class="form-inline"
			action="${pageContext.request.contextPath }/dotest/queryHistoryTest.action"
			method="post">
			<div align="right" style="margin-bottom:30px">
				<input type="text" class="form-control" name="ename">
				<button type="submit" class="btn btn-default">查询</button>
			</div>
		</form>
		<table class="table table-hover">
			<tr>
				<td>序号</td>
				<td>试卷</td>
				<td>得分</td>
				<td>时间</td>
				<td>详细</td>
				<td>&nbsp&nbsp&nbsp删除</td>
			</tr>
			<c:forEach items="${histories }" var="history">
				<tr>

					<td><%=i%></td>
					<td>${history.ename }</td>
					<td>${history.hscore }</td>
					<td>${history.testtime }</td>
					<td><a
						href="${pageContext.request.contextPath }/dotest/detail.action?hid=${history.hid}">查看</a>
					</td>
					<td>
						<form onsubmit="return check()"
							action="${pageContext.request.contextPath }/dotest/deleteHistory.action?hid=${history.hid}"
							method="post" class="form-inline">
							<button type="submit" class="btn btn-default">删除</button>
						</form>
					</td>
				</tr>
				<%
					i++;
				%>
			</c:forEach>
		</table>
	</div>
</body>
</html>
