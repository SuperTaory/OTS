<%@page import="com.ttc.ssm.po.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../top.jsp"%>
<%
	String error = (String) session.getAttribute("examerror");
	String examerror = "examerror";
	String voiderror = "voidname";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	if (error != null && error.equals(examerror)) {
%>
<script type="text/javascript">
	alert("试卷名已存在，请重新创建！")
</script>
<%
	} else if (error != null && error.equals(voiderror)) {
%>
<script type="text/javascript">
	alert("试卷名不能为空，请重新创建！")
</script>
<%
	}
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>创建试卷</title>

</head>
<body>
	<div style="margin-left:80px">
		<h3>创建试卷</h3>
		<h5 style="margin-right:150px">
			<a
				href="${pageContext.request.contextPath }/home/index.action">上一级</a>
		</h5>
	</div>

	<form class="form-horizontal"
		action="${pageContext.request.contextPath }/test/createtestsubmit.action"
		method="post">
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">试卷名称</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="ename"
					placeholder="输入试卷名称">
			</div>
		</div>
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">试卷发布者</label>
			<div class="col-sm-4">
				<input class="form-control" type="text" placeholder="${username }"
					name="username" value="${username }" readonly>
			</div>
		</div>
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">试题数量</label>
			<div style="margin-left:247px">
				<div class="row">
					<div class="col-xs-2">
						<input type="text" class="form-control" name="qnumbers"
							placeholder="输入试题数量">
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">试卷等级</label>
			<div style="margin-left:247px">
				<label class="radio-inline"> <input type="radio"
					name="elevel" id="inlineRadio1" checked="checked" value="1">
					初级
				</label> <label class="radio-inline"> <input type="radio"
					name="elevel" id="inlineRadio2" value="2"> 中级
				</label> <label class="radio-inline"> <input type="radio"
					name="elevel" id="inlineRadio3" value="3"> 高级
				</label>
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">试卷类别</label>
			<div style="margin-left:247px">
				<label class="radio-inline"> <input type="radio"
					name="ekind" id="inlineRadio1" checked="checked" value="性格">
					性格
				</label> <label class="radio-inline"> <input type="radio"
					name="ekind" id="inlineRadio2" value="智商"> 智商
				</label> <label class="radio-inline"> <input type="radio"
					name="ekind" id="inlineRadio3" value="情商"> 情商
				</label>
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