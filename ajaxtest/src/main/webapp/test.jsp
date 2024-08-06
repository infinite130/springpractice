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
<p onclick="test()">ajax 호출하기</p>
<script>
	function test(){
		
		$.ajax({
			type : "GET",
			url : "get.do",
			data : {
				kor : "${kor}",
				us : "${us}"
			},
			
			error : function(error){
				
				console.log("error");
			},
			success : function(data){
				console.log("success")
			}
			
		});
		
		
	}

</script>

</body>
</html>