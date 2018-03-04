<%@page import="com.ttc.ssm.po.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<c:if test="${levelWrong=='levelWrong' }">
		<script type="text/javascript">
			alert("权限不足，无法进行此测试！")
		</script>
	</c:if>
	<c:if test="${issuer=='notsupport' }">
		<script type="text/javascript">
			alert("暂不支持发布者进行测试！")
		</script>
	</c:if>
	<c:if test="${notExist=='notExist' }">
		<script type="text/javascript">
			alert("未查找到相关试卷！")
		</script>
	</c:if>
	<c:if test="${inputvoid=='inputvoid' }">
		<script type="text/javascript">
			alert("输入不能为空！")
		</script>
	</c:if>
	<c:if test="${registsuccess=='registsuccess' }">
		<script type="text/javascript">
			alert("注册成功！")
		</script>
	</c:if>
	<div style="margin-left:80px">
		<h3>${level }</h3>
	</div>
	<div style="margin-left:80px;margin-right:80px">
		<form class="form-inline"
			action="${pageContext.request.contextPath }/dotest/queryAllTest.action"
			method="post">
			<div align="right" style="margin-bottom:30px">
				<input type="text" class="form-control" name="ename">
				<button type="submit" class="btn btn-default">查询所有</button>
			</div>
		</form>
		<table class="table table-hover">
			<tr>
				<td>试卷名称</td>
				<td>试卷类别</td>
				<td>试卷等级</td>
			</tr>
			<c:forEach items="${examptions }" var="exam">
				<tr>
					<td><a
						href="${pageContext.request.contextPath }/dotest/startTest.action?eid=${exam.eid}">${exam.ename }</a>
					</td>
					<td>&nbsp&nbsp&nbsp&nbsp${exam.ekind }</td>
					<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp${exam.elevel }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>