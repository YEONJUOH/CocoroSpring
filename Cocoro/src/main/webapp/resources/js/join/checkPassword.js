
function checkPWD(){
	var pwd1 = $('#password').val();
	var pwd2 = $('#reenterpassword').val();
	
	 if(pwd1!=pwd2){
		   $('#emPwd').css("color","red");
		   $('#emPwd').text("동일한 암호를 입력하세요."); 
		  }else{
			  $('#emPwd').css("color","black");
			   $('#emPwd').text("암호가 확인되었습니다."); 
	
	
}
}

function checkEmpty(){
	
	var pwd1 = $('#password').val();
	var pwd2 = $('#reenterpassword').val();
	
	if(pwd1=="" && pwd2==""){
		
		$('#emPwd').text("");
	}
	
	
}

function pwdBool(){
	var pwd1 = $('#password').val();
	var pwd2 = $('#reenterpassword').val();
	 if(pwd1==pwd2)
		 return true;
	 else
		 return false;

}




