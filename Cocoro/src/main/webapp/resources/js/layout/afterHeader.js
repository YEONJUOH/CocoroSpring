$(function(){
	timer = setInterval(function(){ 
	
	
	var u_id = $('#u_id').val();

	$.ajax({
		url: '/rest/headerMessage?u_id='+u_id,
		type: 'post',
		contentType: "application/json; charset=UTF-8",
		dataType: 'json',
		success : function(data){
			if( data != null){			
			$('#headerMeesage').empty();
			for(i = 0 ; i< data.length;i++){
				
			var div =	'<a href="/users/friendPage?u_id=${users.u_id}&f_o_id='+data[i].u_id+'">';
			
            div +=  '<span class="photo"><img alt="avatar" src="/resources/img/'+data[i].u_image+'"></span>';
            div +=  '<span class="subject">';
            div +=  '<span class="from">'+data[i].u_name+'</span>';
            div +=  '</span>';
            div +=  '<span class="message">'+data[i].message_comment+'</span> </a>'
			
            $('#headerNewMassage').html('Message<span class="badge" style="background-color:red; color:#fff">New</span>');
            $('#headerMeesage').append(div);
			}
			}else{
				var	div = '<a href="#"><span class="message">쪽지함이 비었어요 ㅠ .. </span></a>';
		       	
		        $('#headerNewMassage').html('Message');
		        $('#headerMeesage').append(div);
			}
		},
	error :	function(){
       	var	div = '<a href="#"><span class="message">쪽지함이 비었어요 ㅠ .. </span></a>';
       	
        $('#headerNewMassage').html('Message');
        $('#headerMeesage').append(div);
	}
})
	},3000);
	//헤더 채팅창 사이즈조절 ( 추후에 고치자 ㅠㅠ )
	$('#headerMeesage').css('height',298);
	$('#headerMeesage').css('overflow','scroll');
	
	$('#searchKey').keyup(function(){
		var u_id = $('#u_id').val();

		$('#autoSearch').empty();
		$.getJSON('/rest/autoSearch',{searchKey:$('#searchKey').val()},function(data){
				$('#autoForm').css('display','flex');
				for(i=0;i<data.length;i++){
				var div = '<div class="input-group" id="commentUsers" style="margin-top: 3px">';
				div += '<div class="col-md-12"><a href="/users/friendPage?u_id='+u_id+'&f_o_id='+data[i].u_id+'"><img src="/resources/img/'+data[i].u_image+'" style="width:40px; height:37px; float: left;"></a>';
				div += '&nbsp&nbsp'+data[i].u_name+'  <p>&nbsp&nbsp'+data[i].u_tag+'</p></div></div>';
				
				$('#autoSearch').append(div).hide().fadeIn(2000);
				}
		})
	})
	
});


