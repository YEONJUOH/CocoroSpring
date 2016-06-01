$(function(){
	$('#submitbtn').click(function(){
			alert($('#name').val());
		if($('#password').val ="" ||  $('#name').val == ""|| $('#reenterpassword').val == ""|| $('#searchTextField').val == ""|| $('#birth').val == ""){
			alert("nono");
		} else {
			$('#Joinform').submit();
		}
	})
		$('#Email').keyup(function(){
				$.getJSON('JoinSearch',{searchKey:$('#Email').val()},function(data){
					$.each(data,function(key,value){
						var div = '<div>';
						div += '<h6>'+value.u_email+ '은 중복된 값입니다</h6>';
						div += '</div>';
						$('#joinResult').append(div);
					})
				})
			})
})