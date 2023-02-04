<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function registerChk(){
			var memID = $("#memID").val();
			console.log(memID);
	 		$.ajax({
				url : "<c:url value='/memRegisterCheck.do' />",
				type:"get",
				data : {"memID" : memID},
				success : function(result){
					// 중복 유무 출력(result =1 사용할 수 있는 아이디 , result =0 사용할 수 없는 아이디)
					if(result==1){
						$("#checkMessage").html("사용할 수 있는 아이디 입니다.");
						$("#checkType").attr("class","modal-content panel-success");
					}else{
						$("#checkMessage").html("사용할 수 없는 아이디 입니다.");
						$("#checkType").attr("class","modal-content panel-warning");
					}
					
					$("#myModal").modal("show");
				}, 
				error : ()=>{alert("error");}
			}) 
		}
	
	
	</script>
</head>
<body>

		<div class="container">
			<jsp:include page="../common/header.jsp" />
		  <h2>Panel Heading</h2>
		  <div class="panel panel-default">
		    <div class="panel-heading">회원가입</div>
		    <div class="panel-body">
		    	<form  action="<c:url value='/memRegister.do' />" method="post">
		    		<table class = "table table-bordered" style="text-align: center; border: 1px solid #dddddd;">
		    			<tr>
		    				<td style="width: 110px; vertical-align:middle;">아이디</td>
		    				<td><input id="memID" name="memID" class="form-control" type="text" maxlength="20" placeholder ="아이디 입력 하세요" /></td>
		    				<td><button type="button" class="btn btn-primary btn-sm" onclick ="registerChk();">중복 확인</button></td>		    				
		    			</tr>
    					<tr>
		    				<td style="width: 110px; vertical-align:middle;">비밀번호</td>
		    				<td><input id="memPassword1" name="memPassword1" onkeyup="passwordChk();" class="form-control" type="password" maxlength="20" /></td>		
		    			</tr>
	    				<tr>
		    				<td style="width: 110px; vertical-align:middle;">비밀번호 확인</td>
		    				<td><input id="memPassword2" name="memPassword2" onkeyup="passwordChk();" class="form-control" type="password" maxlength="20" /></td>		
		    			</tr>
	    				<tr>
		    				<td style="width: 110px; vertical-align:middle;">사용자 이름</td>
		    				<td><input id="memName" name="memName" class="form-control" type="text" maxlength="20" /></td>		
		    			</tr>
    					<tr>
		    				<td style="width: 110px; vertical-align:middle;">나이</td>
		    				<td><input id="memAge" name="memAge" class="form-control" type="text" maxlength="20" /></td>		
		    			</tr>
	    				<tr>
		    				<td style="width: 110px; vertical-align:middle;">성별</td>
		    				<td colspan="2">
		    					<div class="form-group" style="text-align: center; margin:0 auto;">
		    						<div class="btn-group" data-toggle="buttons">
		    							<label class="btn btn-primary active">
		    								<input id="memGender" name="memGender" type="radio" autocomplete="off" value="남자" checked/>남자
		    							</label>
	    								<label class="btn btn-primary">
		    								<input id="memGender" name="memGender" type="radio" autocomplete="off" value="여자" checked/>여자
		    							</label>
		    							
		    						</div>
		    					</div>
		    				</td>		
		    			</tr>
	    				<tr>
		    				<td style="width: 110px; vertical-align:middle;">이메일</td>
		    				<td><input id="memEamil" name="memEamil" class="form-control" type="text" maxlength="20" /></td>		
		    			</tr>
		    			<tr>
		    				<td colspan="3" style="text-align:left;">
		    					<input type="submit" class="btn btn-primary btn-sm pull-right" value="등록"/>
		    				</td>
		    			</tr>
		    		</table>
		    	</form> 
		    </div>
		    <!-- 다일로그창 -->
		    <!-- Modal -->
					<div id="myModal" class="modal fade" role="dialog">
					  <div class="modal-dialog">
					  
					    <!-- Modal content-->
					    <div id="checkType" class="modal-content panel-info">
					      <div class="modal-header panel-heading">
					        <button type="button" class="close" data-dismiss="modal">&times;</button>
					        <h4 class="modal-title">메시지 확인</h4>
					      </div>
					      <div class="modal-body">
					        <p id="checkMessage"></p>
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