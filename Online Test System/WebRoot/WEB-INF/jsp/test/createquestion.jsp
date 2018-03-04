<%@page import="com.ttc.ssm.po.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../top.jsp"%>
<%
	int eid = (Integer) session.getAttribute("eid");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>创建试题</title>

</head>
<body>
	<div style="margin-left:80px">
		<h3>创建试题${qnum }-所属卷子id<%=eid%></h3>
	</div>
	<form class="form-horizontal" enctype="multipart/form-data"
		action="${pageContext.request.contextPath }/test/createQuestionSubmit.action?eid=<%=eid %>&qnum=${qnum}&qnumbers=${qnumbers}"
		method="post">

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">问题内容</label>
			<div style="margin-left:247px">
				<div class="row">
					<div class="col-xs-4">
						<input type="text" class="form-control" name="tword"
							placeholder="输入问题内容">
					</div>
				</div>
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">附加题目图片</label>
			<div style="margin-left:247px">
				<input type="file" id="exampleInputFile" name="tpic">
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">附加题目视频</label>
			<div style="margin-left:247px">
				<input type="file" id="exampleInputFile" name="tvideo">
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">附加题目音频</label>
			<div style="margin-left:247px">
				<input type="file" id="exampleInputFile" name="taudio">
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">本题分数</label>
			<div style="margin-left:247px">
				<div class="row">
					<div class="col-xs-2">
						<input type="text" class="form-control" name="tscore"
							placeholder="输入本题分数">
					</div>
				</div>
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">正确答案</label>
			<div style="margin-left:247px">
				<label class="radio-inline"> <input type="radio"
					name="tanswer" id="inlineRadio1" value="A"> A
				</label> <label class="radio-inline"> <input type="radio"
					name="tanswer" id="inlineRadio2" value="B"> B
				</label> <label class="radio-inline"> <input type="radio"
					name="tanswer" id="inlineRadio3" value="C"> C
				</label><label class="radio-inline"> <input type="radio"
					name="tanswer" id="inlineRadio4" value="D"> D
				</label>
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">选项A内容</label>
			<div style="margin-left:247px">
				<div class="row">
					<div class="col-xs-4">
						<input type="text" class="form-control" name="aword"
							placeholder="请输入选项A内容">
					</div>
				</div>
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">附加选项A图片</label>
			<div style="margin-left:247px">
				<input type="file" id="exampleInputFile" name="apic">
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">选项B内容</label>
			<div style="margin-left:247px">
				<div class="row">
					<div class="col-xs-4">
						<input type="text" class="form-control" name="bword"
							placeholder="请输入选项B内容">
					</div>
				</div>
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">附加选项B图片</label>
			<div style="margin-left:247px">
				<input type="file" id="exampleInputFile" name="bpic">
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">选项C内容</label>
			<div style="margin-left:247px">
				<div class="row">
					<div class="col-xs-4">
						<input type="text" class="form-control" name="cword"
							placeholder="请输入选项C内容">
					</div>
				</div>
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">附加选项C图片</label>
			<div style="margin-left:247px">
				<input type="file" id="exampleInputFile" name="cpic">
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">选项D内容</label>
			<div style="margin-left:247px">
				<div class="row">
					<div class="col-xs-4">
						<input type="text" class="form-control" name="dword"
							placeholder="请输入选项D内容">
					</div>
				</div>
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">附加选项D图片</label>
			<div style="margin-left:247px">
				<input type="file" id="exampleInputFile" name="dpic">
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