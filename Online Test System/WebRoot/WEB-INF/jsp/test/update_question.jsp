<%@page import="com.ttc.ssm.po.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../top.jsp"%>
<%
	User questionUser = new User();
	questionUser = (User) session.getAttribute("user");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>试题维护</title>
<script type="text/javascript">
	function check() {
		return confirm("确认删除？？？");
	}
</script>
</head>
<body>
	<c:if test="${questionNotExist=='questionNotExist' }">
		<script type="text/javascript">
			alert("试题不存在！")
		</script>
	</c:if>
	<c:if test="${addsuccess=='addsuccess' }">
		<script type="text/javascript">
			alert("添加试题成功！")
		</script>
	</c:if>
	<c:if test="${updatesuccess=='updatesuccess' }">
		<script type="text/javascript">
			alert("修改试题成功！")
		</script>
	</c:if>
	<div style="margin-left:80px">
		<h3>试题列表</h3>
		<a style="float:left"
			href="${pageContext.request.contextPath }/test/addQuestion.action">添加试题</a>&nbsp&nbsp
		<a
			href="${pageContext.request.contextPath }/test/managequestion.action?username=<%=questionUser.getUsername() %>">上一级</a>
	</div>
	<form class="form-inline"
		action="${pageContext.request.contextPath }/test/searchQuestion.action?eid=${eid}"
		method="post">
		<div align="right" style="margin-bottom:30px;margin-right:80px">
			<input type="text" class="form-control" name="qname">
			<button type="submit" class="btn btn-default">查询</button>
		</div>
	</form>
	<div style="margin-left:80px;margin-right:80px">
		<table class="table table-hover">
			<tr>
				<td>试卷id</td>
				<td>试题id</td>
				<td>试题题目</td>
				<td>修改</td>
				<td>&nbsp&nbsp&nbsp删除</td>
			</tr>
			<c:forEach items="${questionList }" var="question">
				<tr>
					<td>${question.eid }</td>
					<td>${question.qid }</td>
					<td>${question.tword }</td>
					<c:if test="${question.qid!=null }">
						<td><a
							href="${pageContext.request.contextPath }/test/update_options.action?qid=${question.qid}">修改</a>
						</td>

						<td>
							<form onsubmit="return check()"
								action="${pageContext.request.contextPath }/test/delete_question.action?qid=${question.qid}"
								method="post" class="form-inline">
								<button type="submit" class="btn btn-default">删除</button>
							</form>
						</td>

					</c:if>
					<c:if test="${question.qid==null }">
						<td></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>