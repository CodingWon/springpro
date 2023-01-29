<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Spring01</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  	$(document).ready(()=>{
  		loadList();
  	});
  	
  	function loadList(){
  		//서버와 통신
  		$.ajax({
  			url : "boardList.do",
  			type : "get",
  			dataType : "json",
  			success : makeView,
  			error : function(){alert("error");}
  			
  		})
  	}
  	
  	function makeView(data){
  		console.log(data);
  		var listHtml =`<table class ="table table-bordered" >
				  		 <tr>
					  		<td>번호</td>
					 		<td>제목</td>
							<td>작성자</td>
							<td>작성일</td>
							<td>조회수</td>
						</tr>`;
			$.each(data,(index,obj) => {
				listHtml +=`
				  		 <tr>
				  		 <td>\${obj.idx}</td>
				 		 <td>\${obj.title}</td>
						 <td>\${obj.writer}</td>
						 <td>\${obj.indate}</td>
						 <td>\${obj.count}</td>
						 </tr>`
				});			
				listHtml+= `
						<tr>
							<td colspan='5'>
							<button class ="btn btn-primary btn-sm" onclick ="goForm()">글쓰기</button>
							</td>
						</tr>
						</table>`
  			$("#view").html(listHtml);		
  	}
  	
  	function goForm(){
  		$("#view").css("display","none"); // list 감추기
  		$("#wForm").css("display","block"); // form 보이기
  	}
  	
  	function goList(){
  		$("#view").css("display","block"); // list 감추기
  		$("#wForm").css("display","none"); // form 보이기
  	}
  </script>
</head>
<body>
 
<div class="container">
  <h2>Spring 02</h2>
  <div class="panel panel-default">
    <div class="panel-heading">Panel Heading</div>
    <div class="panel-body" id="view">Panel Content </div>
     <div class="panel-body" id="wForm" style="display:none">
     	<form class="form-horizontal">
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="title">제목</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="title"  name="title">
			    </div>
			  </div>
		  	  <div class="form-group">
			    <label class="control-label col-sm-2" for="id">내용</label>
			    <div class="col-sm-10">
			      <textarea row="14" class="form-control" id="content" name="content" ></textarea>
			    </div>
			  </div>
		  	  <div class="form-group">
			    <label class="control-label col-sm-2" for="writer">작성자</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="writer"  name="writer">
			    </div>
			  </div>
			  <input type="button" class="btn btn-primary" value="등록">
			  <input type="reset" class="btn btn-warn" value="취소" >
			   <input type="button" class="btn btn-warn" onclick="goList()" value="리스트" >
		  </form>
	    </div>
    <div class="panel-footer">Panel footer</div>
  </div>
</div>

</body>
</html>
