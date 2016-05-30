$(function() {
    $('#login-form-link').click(function(e) {
		$("#login-form").delay(100).fadeIn(100);
 		$("#register-form").fadeOut(100);
		$('#register-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	$('#register-form-link').click(function(e) {
		$("#register-form").delay(100).fadeIn(100);
 		$("#login-form").fadeOut(100);
		$('#login-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	$('#loginForm').submit(function(e){
		event.preventDefault();
		var params = $('#loginForm').serialize();
		$.ajax({
			url: '../page/Join/LoginOk.jsp',
			type: 'post',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data:params,
			dataType : 'html',
			success : function(data){
				alert('로그인 성공');
				location.href = "../../finalproject/layout/mainLayout.jsp";
			},
			error : function() {
                alert('로그인 실패');
			}
		})
	})
});
