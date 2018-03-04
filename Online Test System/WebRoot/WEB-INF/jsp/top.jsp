<%@page import="com.ttc.ssm.po.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	User user = new User();
	User manager = new User();
	user = (User) session.getAttribute("user");
	manager = (User) session.getAttribute("manager");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
a {
	text-decoration: none
}

a:hover {
	text-decoration: underline
}

.divcss5 {
	background: #CCC;
	color: #FFF;
	weight: 100%;
	height: 70px;
}

.divcss5_left {
	float: left;
	margin-top: 20px;
	margin-left: 80px;
	height: 50px;
	width: 150px;
}

.divcss5_right {
	float: right;
	margin-top: 20px;
	margin-right: 80px;
	width: 150px;
	height: 50px
}
</style>
</head>
<body>
	<div class="divcss5">
		<div class="divcss5_left">
			<div class="btn-group" role="group" aria-label="...">
				<%
					if (user != null && manager == null) {
				%>
				<a class="btn btn-default"
					href="${pageContext.request.contextPath }/home/index.action">首页</a>
				<%
					} else if (user == null && manager != null) {
				%>
				<a class="btn btn-default"
					href="${pageContext.request.contextPath }/home/manager.action">首页</a>
				<%
					} else {
				%>
				<a class="btn btn-default"
					href="${pageContext.request.contextPath }/home/index.action">首页</a>
				<%
					}
				%>

			</div>
		</div>
		<div class="divcss5_right">
			<%
				if (user != null && user.getRole().equals("normal")) {
			%>

			<div class="btn-group">
				<button type="button" class="btn btn-default dropdown-toggle"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					欢迎<%=user.getUsername()%>
					<span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a
						href="${pageContext.request.contextPath }/users/updateuser.action?username=<%=user.getUsername() %>">修改个人信息</a></li>
					<li role="separator" class="divider"></li>
					<li><a
						href="${pageContext.request.contextPath }/dotest/midtest.action?username=<%=user.getUsername() %>">中级测试</a></li>
					<li role="separator" class="divider"></li>
					<li><a
						href="${pageContext.request.contextPath }/dotest/historytest.action?username=<%=user.getUsername() %>">历史测试</a></li>
					<li role="separator" class="divider"></li>
					<li><a
						href="${pageContext.request.contextPath }/users/logout.action">退出</a></li>
				</ul>
			</div>
			<%
				} else if (user != null && user.getRole().equals("vip")) {
			%>

			<div class="btn-group">
				<button type="button" class="btn btn-default dropdown-toggle"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					欢迎VIP-<%=user.getUsername()%>
					<span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a
						href="${pageContext.request.contextPath }/users/updateuser.action?username=<%=user.getUsername() %>">修改个人信息</a></li>
					<li role="separator" class="divider"></li>
					<li><a
						href="${pageContext.request.contextPath }/dotest/midtest.action?username=<%=user.getUsername() %>">中级测试</a></li>
					<li role="separator" class="divider"></li>
					<li><a
						href="${pageContext.request.contextPath }/dotest/hightest.action?username=<%=user.getUsername() %>">高级测试</a></li>
					<li role="separator" class="divider"></li>
					<li><a
						href="${pageContext.request.contextPath }/dotest/historytest.action?username=<%=user.getUsername() %>">历史测试</a></li>
					<li role="separator" class="divider"></li>
					<li><a
						href="${pageContext.request.contextPath }/users/logout.action">退出</a></li>
				</ul>
			</div>
			<%
				} else if (user != null && user.getRole().equals("issuer")) {
			%>

			<div class="btn-group">
				<button type="button" class="btn btn-default dropdown-toggle"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					欢迎<%=user.getUsername()%>
					<span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a
						href="${pageContext.request.contextPath }/users/updateuser.action?username=<%=user.getUsername() %>">修改个人信息</a></li>
					<li role="separator" class="divider"></li>
					<li><a
						href="${pageContext.request.contextPath }/test/createtest.action?username=<%=user.getUsername() %>">创建试卷</a></li>
					<li role="separator" class="divider"></li>
					<li><a
						href="${pageContext.request.contextPath }/test/testlist.action?username=<%=user.getUsername() %>">试卷维护</a></li>
					<li role="separator" class="divider"></li>
					<li><a
						href="${pageContext.request.contextPath }/test/manageanalysis.action?username=<%=user.getUsername() %>">试卷分析维护</a></li>
					<li role="separator" class="divider"></li>
					<li><a
						href="${pageContext.request.contextPath }/test/managequestion.action?username=<%=user.getUsername() %>">试题维护</a></li>
					<li role="separator" class="divider"></li>
					<li><a
						href="${pageContext.request.contextPath }/users/logout.action">退出</a></li>
				</ul>
			</div>
			<%
				} else if (manager != null && manager.getRole().equals("manager")) {
			%>

			<div class="btn-group">
				<button type="button" class="btn btn-default dropdown-toggle"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					欢迎管理员-<%=manager.getUsername()%>
					<span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a
						href="${pageContext.request.contextPath }/manager/userManage.action?username=<%=manager.getUsername() %>">用户管理</a></li>
					<li role="separator" class="divider"></li>
					<li><a
						href="${pageContext.request.contextPath }/manager/updateUKL.action?username=<%=manager.getUsername() %>">试卷管理</a></li>
					<li role="separator" class="divider"></li>
					<li><a
						href="${pageContext.request.contextPath }/manager/managerLogout.action">退出</a></li>
				</ul>
			</div>
			<%
				} else if (manager == null) {
			%>
			<div class="btn-group" role="group" aria-label="...">
				<a class="btn btn-default"
					href="${pageContext.request.contextPath }/users/register.action">注册</a>
			</div>
			<div class="btn-group" role="group" aria-label="...">
				<a class="btn btn-default"
					href="${pageContext.request.contextPath }/users/login.action">登录</a>
			</div>
			<%
				} else if (user == null && manager != null) {
			%>
			<div class="btn-group" role="group" aria-label="...">
				<a class="btn btn-default"
					href="${pageContext.request.contextPath }/home/managerLogin.action">登录</a>
			</div>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>