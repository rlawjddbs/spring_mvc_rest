<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/jsp_prj/common/css/main_v190130.css" />
<style type="text/css">
	#wrap{ margin: 0px auto; width:800px; height:860px;  }
	#header{ mwidth:800px; height:140px; background:#FFF url('http://localhost:8080/jsp_prj/common/images/header_bg.png'); position:relative; }
	#headerTitle{ font-family: HY견고딕, 고딕; font-size: 35px; font-weight:bold; text-align:center; position:absolute; left:300px; top:30px; }
	#container{ width:800px; }
	#footer{ width:800px; height:120px; }
	#footerTitle{ float:right; font-size:15px; padding-top:20px; padding-right: 20px;}
	/* td{ padding:10px; } */
	#subject { padding-top:10px; }
	#subject > a { padding-left:10px; padding-right:10px; color:blue; font-weight:bold; transition-duration:0.3s; }
	#subject > a:hover { text-decoration:none; color:#A3CB38; }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#put").click(function() {
			$.ajax({
				url:"method/put/asdfasdfasdf",
				type:"PUT",
				dataType:"json",
				data:JSON.stringify({ name:'김정윤', age:31, job:'개발자' }), // JSON.stringify 를 쓰면 json이 문자열로 나타난다.
				contentType:"application/json",
				error:function( xhr ){
					alert( xhr.status );
					alert( xhr.responseText );
				},
				success:function( json ){
					var output ="";
					output +="아이디 : <strong>"+json.id+"</strong> ";
					output +="비번 : <strong>"+json.password+"</strong> ";
					output +="이름 : <strong>"+json.name+"</strong> ";
					
					$("#putView").html(output);
					/* alert( json );
					alert( json.id );
					alert( json.password );
					alert( json.name ); */
					// location.href=json.url;
				}
			});
		});
	}); // ready
</script>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<div id="headerTitle">SIST Class4</div>
		</div>
		<div id="container">
			<a href="method/get?name=jinkyung">GET방식</a>
			<form action="method/post" method="post">
				<input type="submit" value="POST 전송" />
			</form>

			<form action="method/put" method="put"> <!-- method를 put으로 설정해도 get으로 처리되기 때문에 안 됨 -->
				<input type="button" id="put" value="PUT 전송" />
			</form>
			<div id="putView">
				
			</div>
			
		</div>
		<div id="footer">
			<div id="footerTitle">copyright&copy; all right reserve class 4</div>
		</div>
	</div>
</body>
</html>