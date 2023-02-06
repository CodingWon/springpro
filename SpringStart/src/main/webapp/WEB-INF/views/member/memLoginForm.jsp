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
  <script type="text/javascript">
	$(document).ready(function(){
		
		
		if(${!empty msgType}){
		
			$("#messageType").attr("class" , "modal-content panel-warning");
			$("#myMessage").modal("show");
		}
	})
  
  </script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
		<div class="container">
		  <h2>Panel Heading</h2>
		  <div class="panel panel-default">
		    <div class="panel-heading">Panel Heading</div>
		    <div class="panel-body">
		    
   		 	<form  action="<c:url value='/memLogin.do' />" method="post">
		    		<table class = "table table-bordered" style="text-align: center; border: 1px solid #dddddd;">
		    			<tr>
		    				<td style="width: 110px; vertical-align:middle;">아이디</td>
		    				<td><input id="memID" name="memID" class="form-control" type="text" maxlength="20" placeholder ="아이디 입력 하세요" /></td>
		    			</tr>
    					<tr>
		    				<td style="width: 110px; vertical-align:middle;">비밀번호</td>
		    				<td><input name="memPassword"  type="password"  /></td>		
		    			</tr>
		    			<tr>
		    				<td colspan="3" style="text-align:left;">
		    					  <input type="submit" class="btn btn-primary btn-sm pull-right" value="로그인"/>
		    				</td>
		    			</tr>
		    		</table>
		    	</form> 
		    
		    </div>
		    
		    <!-- 실패시 -->
					<div id="myMessage" class="modal fade" role="dialog">
					  <div class="modal-dialog">
					  
					    <!-- Modal content-->
					    <div id ="messageType" class="modal-content panel-info">
					      <div class="modal-header panel-heading">
					        <button type="button" class="close" data-dismiss="modal">&times;</button>
					        <h4 class="modal-title">${msgType}</h4>
					      </div>
					      <div class="modal-body">
					        <p id="checkMessage">${msg}</p>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					      </div>
					    </div>
					  </div>
					</div>
		  </div>
		</div>
</body>
</html>