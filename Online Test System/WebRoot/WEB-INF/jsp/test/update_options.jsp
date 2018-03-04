<%@page import="com.ttc.ssm.po.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../top.jsp"%>
<%
	String a = "A";
	String b = "B";
	String c = "C";
	String d = "D";
	int eid = (Integer) session.getAttribute("eid");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>试题维护</title>

</head>
<body>
	<div style="margin-left:80px">
		<h3>修改试题--${question.tword }</h3>
		<h5>
			<a
				href="${pageContext.request.contextPath }/test/update_question.action?eid=<%=eid %>">上一级</a>
		</h5>
	</div>
	<form class="form-horizontal" enctype="multipart/form-data"
		action="${pageContext.request.contextPath }/test/updateQuestionSubmit.action?qid=${question.qid}"
		method="post">

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">修改问题题目</label>
			<div style="margin-left:247px">
				<div class="row">
					<div class="col-xs-4">
						<input type="text" class="form-control" name="tword"
							value="${question.tword }">
					</div>
				</div>
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">附加题目图片</label>
			<div style="margin-left:247px">
				<c:if test="${question.tpic !=null}">
					<img src="/pic/${question.tpic}" width=200 height=140 />
					<br />
				</c:if>
				<input type="file" id="exampleInputFile" name="tpic">
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">附加题目视频</label>
			<div style="margin-left:247px">
				<c:if test="${question.tvideo !=null}">
					<video src="/pic/${question.tvideo}" width=200 height=140 controls />
					<br />
				</c:if>

			</div>
			<div style="margin-left:247px">
				<input type="file" id="exampleInputFile" name="tvideo">
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">附加题目音频</label>
			<div style="margin-left:247px">
				<c:if test="${question.taudio !=null}">
					<audio src="/pic/${question.taudio}" width=200 height=140 controls />
				</c:if>
			</div>
			<div style="margin-left:247px">
				<input type="file" id="exampleInputFile" name="taudio">
			</div>
		</div>
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">管理附加文件</label>
			<div>
				<label class="checkbox-inline"> <input type="checkbox"
					name="pic" value="deletepic"> 删除图片
				</label> <label class="checkbox-inline"> <input type="checkbox"
					name="video" value="deletevideo"> 删除视频
				</label> <label class="checkbox-inline"> <input type="checkbox"
					name="audio" value="deleteaudio"> 删除音频
				</label>
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">修改本题分数</label>
			<div style="margin-left:247px">
				<div class="row">
					<div class="col-xs-2">
						<input type="text" class="form-control" name="tscore"
							value="${question.tscore }">
					</div>
				</div>
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">修改正确答案</label>
			<c:if test="${question.tanswer=='A' }">
				<div style="margin-left:247px">
					<label class="radio-inline"> <input type="radio"
						name="tanswer" id="inlineRadio1" value="A" checked="checked">
						A
					</label> <label class="radio-inline"> <input type="radio"
						name="tanswer" id="inlineRadio2" value="B"> B
					</label> <label class="radio-inline"> <input type="radio"
						name="tanswer" id="inlineRadio3" value="C"> C
					</label><label class="radio-inline"> <input type="radio"
						name="tanswer" id="inlineRadio4" value="D"> D
					</label>
				</div>
			</c:if>
			<c:if test="${question.tanswer=='B' }">
				<div style="margin-left:247px">
					<label class="radio-inline"> <input type="radio"
						name="tanswer" id="inlineRadio1" value="A"> A
					</label> <label class="radio-inline"> <input type="radio"
						name="tanswer" id="inlineRadio2" value="B" checked="checked">
						B
					</label> <label class="radio-inline"> <input type="radio"
						name="tanswer" id="inlineRadio3" value="C"> C
					</label><label class="radio-inline"> <input type="radio"
						name="tanswer" id="inlineRadio4" value="D"> D
					</label>
				</div>
			</c:if>
			<c:if test="${question.tanswer=='C' }">
				<div style="margin-left:247px">
					<label class="radio-inline"> <input type="radio"
						name="tanswer" id="inlineRadio1" value="A"> A
					</label> <label class="radio-inline"> <input type="radio"
						name="tanswer" id="inlineRadio2" value="B"> B
					</label> <label class="radio-inline"> <input type="radio"
						name="tanswer" id="inlineRadio3" value="C" checked="checked">
						C
					</label><label class="radio-inline"> <input type="radio"
						name="tanswer" id="inlineRadio4" value="D"> D
					</label>
				</div>
			</c:if>
			<c:if test="${question.tanswer=='D' }">
				<div style="margin-left:247px">
					<label class="radio-inline"> <input type="radio"
						name="tanswer" id="inlineRadio1" value="A"> A
					</label> <label class="radio-inline"> <input type="radio"
						name="tanswer" id="inlineRadio2" value="B"> B
					</label> <label class="radio-inline"> <input type="radio"
						name="tanswer" id="inlineRadio3" value="C"> C
					</label><label class="radio-inline"> <input type="radio"
						name="tanswer" id="inlineRadio4" value="D" checked="checked">
						D
					</label>
				</div>
			</c:if>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">修改选项A内容</label>
			<div style="margin-left:247px">
				<div class="row">
					<div class="col-xs-4">
						<input type="text" class="form-control" name="aword"
							value="${options.aword }">
					</div>
				</div>
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">附加选项A图片</label>
			<div style="margin-left:247px">
				<c:if test="${options.apic !=null}">
					<img src="/pic/${options.apic}" width=120 height=80 />
					<br />
				</c:if>
				<input type="file" id="exampleInputFile" name="apic">
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">修改选项B内容</label>
			<div style="margin-left:247px">
				<div class="row">
					<div class="col-xs-4">
						<input type="text" class="form-control" name="bword"
							value="${options.bword }">
					</div>
				</div>
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">附加选项B图片</label>
			<div style="margin-left:247px">
				<c:if test="${options.bpic !=null}">
					<img src="/pic/${options.bpic}" width=120 height=80 />
					<br />
				</c:if>
				<input type="file" id="exampleInputFile" name="bpic">
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">修改选项C内容</label>
			<div style="margin-left:247px">
				<div class="row">
					<div class="col-xs-4">
						<input type="text" class="form-control" name="cword"
							value="${options.cword }">
					</div>
				</div>
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">附加选项C图片</label>
			<div style="margin-left:247px">
				<c:if test="${options.cpic !=null}">
					<img src="/pic/${options.cpic}" width=120 height=80 />
					<br />
				</c:if>
				<input type="file" id="exampleInputFile" name="cpic">
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">修改选项D内容</label>
			<div style="margin-left:247px">
				<div class="row">
					<div class="col-xs-4">
						<input type="text" class="form-control" name="dword"
							value="${options.dword }">
					</div>
				</div>
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">附加选项D图片</label>
			<div style="margin-left:247px">
				<c:if test="${options.dpic !=null}">
					<img src="/pic/${options.dpic}" width=120 height=80 />
					<br />
				</c:if>
				<input type="file" id="exampleInputFile" name="dpic">
			</div>
		</div>
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">管理选项图片</label>
			<div>
				<label class="checkbox-inline"> <input type="checkbox"
					name="pica" value="deletepic"> 删除A选项图片
				</label> <label class="checkbox-inline"> <input type="checkbox"
					name="picb" value="deletepic"> 删除B选项图片
				</label> <label class="checkbox-inline"> <input type="checkbox"
					name="picc" value="deletepic"> 删除C选项图片
				</label> <label class="checkbox-inline"> <input type="checkbox"
					name="picd" value="deletepic"> 删除D选项图片
				</label>
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