/**
 * 
 */

function nameReturn(){
	var name = $('#username').val();
	
	var regExp =  /^[가-힣]{2,4}$|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
	
	if (name.match(regExp)) {
		
		return true;
	}else{
		return false;
	}
	
}