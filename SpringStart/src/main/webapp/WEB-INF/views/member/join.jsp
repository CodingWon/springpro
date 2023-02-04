<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
		<div class="container">
		  <h2>Panel Heading</h2>
		  <div class="panel panel-default">
		    <div class="panel-heading">회원가입</div>
		    <div class="panel-body">
		    	<form>
		    		<table class = "table table-bordered" style="text-align: center; border: 1px solid #dddddd;">
		    			<tr>
		    				<td style="width: 110px; vertical-align:middle;">아이디</td>
		    				<td><input class="form-control" type="text" maxlength="20" placeholder ="아이디 입력 하세요" /></td>
		    				<td><button class="btn btn-primary btn-sm">중복 확인</button></td>		    				
		    			</tr>
		    		</table>
		    	</form> 
		    </div>
		  </div>
		</div>
</body>
</html>