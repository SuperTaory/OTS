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

<title>历史测试</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>

<body>
	<div align="center" style="margin-top:40px">
		<h3>详细信息</h3>
	</div>
	<div style="margin-left:340px;margin-top:40px">
		<form class="form-horizontal">
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">用户</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="inputPassword3"
						name="userage" value="${history.username }" readonly>
				</div>
			</div>
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">试卷ID</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="inputEmail3"
						name="username" value="${history.eid }" readonly>
				</div>
			</div>

			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">试卷名</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="inputPassword3"
						name="userage" value="${history.ename }" readonly>
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">测试时间</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="inputPassword3"
						name="userage" value="${history.testtime }" readonly>
				</div>
			</div>

			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">测试得分</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="inputPassword3"
						name="userage" value="${history.hscore }" readonly>
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">分析结果</label>
				<div class="col-sm-4">
					<textarea class="form-control" rows="4" name="acontent3" readonly>${history.analysis }</textarea>
				</div>
			</div>
			<div class="form-group" style="margin-left:175px;margin-top:40px">
				<a
					href="${pageContext.request.contextPath }/dotest/historytest.action"
					class="btn btn-default" role="button">返回</a>
			</div>
		</form>
	</div>
</body>
</html>
