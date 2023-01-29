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
			listHtml+= `</table>`
  			$("#view").html(listHtml);		
  	}
  </script>
</head>
<body>
 
<div class="container">
  <h2>Spring 02</h2>
  <div class="panel panel-default">
    <div class="panel-heading">Panel Heading</div>
    <div class="panel-body" id="view">Panel Content</div>
    <div class="panel-footer">Panel footer</div>
  </div>
</div>

</body>
</html>
