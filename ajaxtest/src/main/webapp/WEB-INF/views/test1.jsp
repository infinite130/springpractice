<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<form id="form" method="post">
	
		<label for="name">이름:</label>
		<input type="text" id="name" name="name"/>
		<br/>
		<label for="age">나이:</label>
		<input type="text" id="age" name="age"/>
		<br/>
		<button type="submit">전송</button>
	
	</form>
	
	<div id="result"></div>
	
	<script>
		$(document).ready(function(){
			$("#form").submit(function(event){
				event.preventDefault(); // 폼의 기본 제출을 막음
				var name = $("#name").val();
				var age = $("#age").val();
				
				// 비동기 통신
				$.ajax({
					url: "Ajax",
					type: "POST",
					data: {name: name, age: age},
					dataType: "text",
					success: function(response){
						$("#result").html(response);
					},
					error: function(xhr, status, error){
						$("#result").html("오류: " + error);
					}
				});
			});
		});
	</script>

</body>
</html>
