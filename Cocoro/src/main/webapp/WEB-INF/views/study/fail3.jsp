<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>
<script type="text/javascript">
$(document).ready(
		function() { 
			fn_check(); 
			});

function fn_check() {
	alert("가상계좌의 금액이 부족하여 신청이 취소되었습니다.\n계좌를 충천한 후 다시 신청해주세요.")
	location.href = "/users/afterMain";
}

</script>
</body>
</html>