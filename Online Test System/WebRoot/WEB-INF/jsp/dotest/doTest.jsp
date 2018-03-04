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
	int i = 0;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>在线测试</title>

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
		return confirm("确认交卷？");
	}
</script>
</head>

<body>
	<div align="center">
		<h3>开始答题：${examption.ename }</h3>
	</div>
	<form class="form-horizontal" onsubmit="return check()"
		action="${pageContext.request.contextPath }/dotest/doTestSubmit.action?eid=${examption.eid}"
		method="post">
		<div style="margin-left:80px;margin-right:80px;border:1px solid #eee">
			<table class="table table-hover">

				<c:forEach items="${questionsList }" var="question">
					<tr class="success">
						<td><h4>
								问题<%=i + 1%>：${question.tword }
							</h4></td>
						<td></td>

					</tr>
					<c:if test="${question.tpic !=null}">
						<tr>

							<td><c:if test="${question.tpic !=null}">
									<img style="margin-left:20px" src="/pic/${question.tpic}"
										width=240 height=160 />
									<br />
								</c:if></td>
							<td></td>

						</tr>
					</c:if>
					<c:if test="${question.tvideo !=null}">
						<tr>

							<td><c:if test="${question.tvideo !=null}">
									<video style="margin-left:20px" src="/pic/${question.tvideo}"
										width=240 height=160 controls />
									<br />
								</c:if></td>
							<td></td>

						</tr>
					</c:if>
					<c:if test="${question.taudio !=null}">
						<tr>

							<td><c:if test="${question.taudio !=null}">
									<audio style="margin-left:20px" src="/pic/${question.taudio}"
										width=240 height=160 controls />
									<br />
								</c:if></td>
							<td></td>

						</tr>
					</c:if>


					<c:forEach items="${optionsList }" var="options">
						<c:if test="${options.qid==question.qid }">
							<tr>

								<td><label class="radio-inline"> <input
										type="radio" name="num<%=i%>" id="inlineRadio1" value="A">
										A. ${options.aword }
								</label></td>

								<td><label class="radio-inline"> <input
										type="radio" name="num<%=i%>" id="inlineRadio1" value="B">
										B. ${options.bword }
								</label></td>

							</tr>
							<c:if test="${options.apic !=null&&options.bpic !=null}">
								<tr>

									<td><label class="radio-inline"> <c:if
												test="${options.apic !=null}">
												<img src="/pic/${options.apic}" width=120 height=80 />
												<br />
											</c:if>
									</label></td>

									<td><label class="radio-inline"> <c:if
												test="${options.bpic !=null}">
												<img src="/pic/${options.bpic}" width=120 height=80 />
												<br />
											</c:if>
									</label></td>

								</tr>
							</c:if>
							<tr>

								<td><label class="radio-inline"> <input
										type="radio" name="num<%=i%>" id="inlineRadio1" value="C">
										C. ${options.cword }
								</label></td>

								<td><label class="radio-inline"> <input
										type="radio" name="num<%=i%>" id="inlineRadio1" value="D">
										D. ${options.dword }
								</label></td>

							</tr>
							<c:if test="${options.cpic !=null&&options.dpic !=null}">
								<tr>

									<td><label class="radio-inline"> <c:if
												test="${options.cpic !=null}">
												<img src="/pic/${options.cpic}" width=120 height=80 />
												<br />
											</c:if>
									</label></td>


									<td><label class="radio-inline"> <c:if
												test="${options.dpic !=null}">
												<img src="/pic/${options.dpic}" width=120 height=80 />
												<br />
											</c:if>
									</label></td>

								</tr>
							</c:if>
						</c:if>
					</c:forEach>
					<%i++;%>
				</c:forEach>
			</table>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-10 col-sm-10">
				<button type="submit" class="btn btn-default">交卷</button>
			</div>
		</div>
	</form>
</body>
</html>
