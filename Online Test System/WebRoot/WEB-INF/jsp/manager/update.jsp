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

<title>管理试卷</title>

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
	<div style="margin-left:80px">
		<h3>管理试卷</h3>
		<h5 style="margin-right:150px">
			<a
				href="${pageContext.request.contextPath }/manager/updateUKL.action">上一级</a>
		</h5>
	</div>

	<form class="form-horizontal"
		action="${pageContext.request.contextPath }/manager/updateSubmit.action?eid=${exam.eid}"
		method="post">
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">试卷名称</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="ename"
					value="${exam.ename }" readonly>
			</div>
		</div>
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">所属用户</label>
			<div class="col-sm-2">
				<select class="form-control" name="username">
					<c:forEach items="${userList }" var="user">
					  	<c:if test="${user.username==exam.username }">
						<option value="${user.username }" selected="selected">${user.username }</option>
						</c:if>
						<c:if test="${user.username!=exam.username }">
						<option value="${user.username }">${user.username }</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">试题数量</label>
			<div style="margin-left:247px">
				<div class="row">
					<div class="col-xs-2">
						<input type="text" class="form-control" name="qnumbers"
							value="${exam.qnumbers }" readonly>
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">试卷等级</label>
			<div style="margin-left:247px">
				<c:if test="${exam.elevel==1 }">
					<label class="radio-inline"> <input type="radio"
						name="elevel" id="inlineRadio1" checked="checked" value="1">
						初级
					</label>
					<label class="radio-inline"> <input type="radio"
						name="elevel" id="inlineRadio2" value="2"> 中级
					</label>
					<label class="radio-inline"> <input type="radio"
						name="elevel" id="inlineRadio3" value="3"> 高级
					</label>
				</c:if>
				<c:if test="${exam.elevel==2 }">
					<label class="radio-inline"> <input type="radio"
						name="elevel" id="inlineRadio1" value="1"> 初级
					</label>
					<label class="radio-inline"> <input type="radio"
						name="elevel" id="inlineRadio2" checked="checked" value="2">
						中级
					</label>
					<label class="radio-inline"> <input type="radio"
						name="elevel" id="inlineRadio3" value="3"> 高级
					</label>
				</c:if>
				<c:if test="${exam.elevel==3 }">
					<label class="radio-inline"> <input type="radio"
						name="elevel" id="inlineRadio1" value="1"> 初级
					</label>
					<label class="radio-inline"> <input type="radio"
						name="elevel" id="inlineRadio2" value="2"> 中级
					</label>
					<label class="radio-inline"> <input type="radio"
						name="elevel" id="inlineRadio3" checked="checked" value="3">
						高级
					</label>
				</c:if>
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">试卷类别</label>
			<div style="margin-left:247px">
				<c:if test="${exam.ekind=='性格' }">
					<label class="radio-inline"> <input type="radio"
						name="ekind" id="inlineRadio1" checked="checked" value="性格">
						性格
					</label>
					<label class="radio-inline"> <input type="radio"
						name="ekind" id="inlineRadio2" value="智商"> 智商
					</label>
					<label class="radio-inline"> <input type="radio"
						name="ekind" id="inlineRadio3" value="情商"> 情商
					</label>
				</c:if>
				<c:if test="${exam.ekind=='智商' }">
					<label class="radio-inline"> <input type="radio"
						name="ekind" id="inlineRadio1" value="性格"> 性格
					</label>
					<label class="radio-inline"> <input type="radio"
						name="ekind" id="inlineRadio2" checked="checked" value="智商">
						智商
					</label>
					<label class="radio-inline"> <input type="radio"
						name="ekind" id="inlineRadio3" value="情商"> 情商
					</label>
				</c:if>
				<c:if test="${exam.ekind=='情商' }">
					<label class="radio-inline"> <input type="radio"
						name="ekind" id="inlineRadio1" value="性格"> 性格
					</label>
					<label class="radio-inline"> <input type="radio"
						name="ekind" id="inlineRadio2" value="智商"> 智商
					</label>
					<label class="radio-inline"> <input type="radio"
						name="ekind" id="inlineRadio3" checked="checked" value="情商">
						情商
					</label>
				</c:if>
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
