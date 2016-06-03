/**
 * 
 */

function submitFunc(){
	
	var $elements = $('#signup');
	
	//이메일 체크 
	
	 var eBool = emailReturn();
    if(!eBool){
     	
      alert("이메일 형식이 맞지 않습니다.");
      return false;
    }

    
    var iBool = IdBool();
    if(!iBool){
    	alert("사용 불가능한 아이디 입니다.");
    	return false;
    }
    
    var nBool = nameReturn();
    if(!nBool){
    	alert("이름 형식이 맞지 않습니다.");
    	return false;
    }

    var strength = $('.password-verdict').text();
    if(strength=="Weak"){
    	alert("비밀번호의 보안 수준이 낮습니다.");
    	return false;
    	
    }
    
    var pBool =  pwdBool();
    if(!pBool){
    	alert("비밀번호가 일치하지 않습니다.");
    	return false;
    }
    
    $("#signup").removeClass('in');
    $('#signup').removeClass('active');
    
    $("#success").addClass('in');
    $("#success").addClass('active');
    
    return false;
    

}

function scScreen(){
	$("div .modal").modal("hide");
	 $("#success").removeClass('in');
	    $('#success').removeClass('active');
	
}