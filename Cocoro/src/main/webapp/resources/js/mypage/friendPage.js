$(function(){
	//후기
$('#commentForm').submit(function(e){
		event.preventDefault();
		
		var formData = new FormData($(this)[0]);

		$.ajax({
			url: '/users/usersAfter',
			type: 'post',
			contentType: false,
			processData: false,
			data: formData,
			dataType: 'json',
			success : function(data){
				alert('성공');
				var name = $('#name').val();
				var image = $('#image').val();
				
				var div = '<div class="panel panel-default">';
				div += '<div class="panel-body">';
				div += '<img src="/resources/img/'+image+'" class="img-rounded" width="20px">';
				div += ''+name+' 님이 글을 남겼습니다.';
				div += '<div class="clearfix"></div><hr>';
				if(data.c_img != ""){
				div += '<img src="/resources/img/'+data.c_img+'" alt="..." class="img-rounde" width="100%" height="380px;">';
				}
				div += '<p> '+data.c_comment+'</p><hr>';
				div += '<form id="cu_commentForm" method="post"><div class="input-group">';
				div += '<input type="hidden" id="c_id" name="c_id" value="'+data.c_id+'">';
				div += '<input type="hidden" id="u_id" name="u_id" value="${users.u_id}">';
				div += '<input type="text" id="cu_comment" class="form-control" name="cu_comment" placeholder="댓글을 달아보세요.">';
				div += '<input type="hidden" value="${users.u_name}" id="name">';
				div += '<input type="hidden" value="${users.u_image}" id="image">';
				div += '<div class="input-group-btn">';
				div += '<button class="btn btn-default" type="submit" id="commentUsersBtn">댓글</button>';
				div += '</div></div></form><br><div class="input-group" id="commentUsers"></div></div>';

				$('#test').append(div);
			},
		error :	function(){
			alert("실패")
		}
		})
	});
	//팔로우 버튼
	$('#followSend').submit(function(e){
		event.preventDefault();
		
		var params = $('#followSend').serialize();
		var u_id = $('#u_id').val();
		var f_o_id = $('#f_o_id').val();
		
		$.ajax({
			url: '/users/follow',
			type:'post',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data:params,
			dataType:'html',
			success: function(data){
			},
			error : function(){
				alert('팔로우 성공');
				location.href = "/users/friendPage?u_id="+u_id+"&f_o_id="+f_o_id+"";
			}
		})	
	});
	
	//팔로우 취소
	$('#unFollwForm').submit(function(e){
		event.preventDefault();
		
		var params = $('#unFollwForm').serialize();
		var u_id = $('#u_id').val();
		var f_o_id = $('#f_o_id').val();
		
		$.ajax({
			url: '/users/unFollow',
			type:'post',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data:params,
			dataType:'html',
			success: function(data){
			},
			error : function(){
				alert('팔로우 취소');
				location.href = "/users/friendPage?u_id="+u_id+"&f_o_id="+f_o_id+"";
				}
		})	
	});
	//좋아요 버튼
	$('#likesForm').submit(function(e){
		event.preventDefault();
		
		var params = $('#likesForm').serialize();
		var u_id = $('#u_id').val();
		var f_o_id = $('#f_o_id').val();
		
		$.ajax({
			url: '/users/usersLikes',
			type:'post',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data:params,
			dataType:'html',
			success: function(data){
			},
			error : function(){
				alert('좋아요');
				location.href = "/users/friendPage?u_id="+u_id+"&f_o_id="+f_o_id+"";
				}
		})	
	});
	//싫어요 버튼
	$('#unLikesForm').submit(function(e){
		event.preventDefault();
		
		var params = $('#unLikesForm').serialize();
		var u_id = $('#u_id').val();
		var f_o_id = $('#f_o_id').val();
		
		$.ajax({
			url: '/users/usersUnLikes',
			type:'post',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data:params,
			dataType:'html',
			success: function(data){
			},
			error : function(){
				alert('싫어요');
				location.href = "/users/friendPage?u_id="+u_id+"&f_o_id="+f_o_id+"";
				}
		})	
	});

	//쪽지 버튼이눌렸을때정보들을 가져온다
	  $(function(){
		  $("#addClass").click(function () {
				timer = setInterval(function(){ 
				  		var f_o_id = $('#f_o_id').val();
						var u_id = $('#u_id').val();
						var users_image = $('#users_image').val();
						var fUsers_image = $('#fUsers_image').val();
						var users_name = $('#users_name').val();
						var fUsers_name = $('#fUsers_name').val();
						
						var list = {"f_o_id" : f_o_id , "u_id" : u_id};
						
						$.ajax({
							url: '/users/updateMessage',
							type:'post',
							contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
							dataType:'json',
							data: list,
							success: function(data){
						        $('.direct-chat-messages').empty();
								$.each(data,function(key,data){
									if(data.message_o_id == u_id){
										var div =  '<div class="direct-chat-msg doted-border">';
					                     div +=  '<div class="direct-chat-info clearfix">';
					                     div +=  '<span class="direct-chat-name pull-left">'+users_name+'<small>(나)</small></span></div>';
					                     div +=  '<img alt="iamgurdeeposahan" src="/resources/img/'+users_image+'" class="direct-chat-img">';
					                     div +=  '<div class="direct-chat-text">';
					                     div +=  ''+data.message_comment+'</div>';
					                     if(data.message_check == 'T'){
							                 div +=  '<span><small style="float: right;">읽음</small></span>';
							                 }else{
							                 div +=  '<span><small style="float: right;">읽지않음</small></span>';
							                 }
					                     div += '</div>';
					                     
					                     $('.direct-chat-messages').append(div).fadeIn();
									}else{
										var div =  '<div class="direct-chat-msg doted-border">';
					                     div +=  '<div class="direct-chat-info clearfix" style="margin-left: 140px;">';
					                     div +=  '<span class="direct-chat-name pull-left">'+fUsers_name+'</span></div>';
					                     div +=  '<img alt="iamgurdeeposahan" src="/resources/img/'+fUsers_image+'" style="float: right;" class="direct-chat-img">';
					                     div +=  '<div class="direct-chat-text"  style="background-color: #ffc6c6; display: table-cell; width:1%;"> ';
					                     div +=  ''+data.message_comment+'</div>';
					                     div += '</div>';
					                     
					                     $('.direct-chat-messages').append(div);
									}
								})
							},
							error : function(){
								alert('실패');
							}
						})
				},3000);
			  
			  $('#qnimate').addClass('popup-box-on');
		              });
		            
		              $("#removeClass").click(function () {
		            	  clearInterval(timer);
		            $('#qnimate').removeClass('popup-box-on');
		              });
		    })
	
	//쪽지 보내기
	$('#mSendForm').submit(function(e){
		event.preventDefault();
		
		var params = $('#mSendForm').serialize();
		var name = $('#name').val();
		var image = $('#image').val();
		var message_comment = $('#message_comment').val();
		
		$.ajax({
			url: '/users/mSendMessage',
			type:'post',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data: params,
			dataType:'html',
			success: function(data){

                var div =  '<div class="direct-chat-msg doted-border">';
                div +=  '<div class="direct-chat-info clearfix">';
                div +=  '<span class="direct-chat-name pull-left">'+name+'<small>(나)</small></span></div>';
                div +=  '<img alt="iamgurdeeposahan" src="/resources/img/'+image+'" class="direct-chat-img">';
                div +=  '<div class="direct-chat-text">';
                div +=  ''+message_comment+'</div>';
                div += '</div>';
	
                $('.direct-chat-messages').append(div);	
			},
			error : function(){
				alert('실패 ');
			}
		})
	});
	
	//팔로우 보여주는 페이지의 높이가 316이넘었을때
	if($('#followYou').height() > 316){
		$('#followYou').css('height',316);
		$('#followYou').css('overflow','hidden');
	}
	if($('#followMe').height() > 316){
		$('#followMe').css('height',316);
		$('#followMe').css('overflow','hidden');
	}
})

$(document).on("submit","#cu_commentForm",function(e){
	event.preventDefault();
	
	var c_id = $(this).parent().parent().find('#c_id').val();
	var u_id = $(this).parent().parent().find('#u_id').val();
	var cu_comment = $(this).parent().parent().find('#cu_comment').val();
	var commentUsers = $(this).parent().parent().find('#commentUsers');

	var name = $('#name').val();
	var image = $('#image').val();
	
	var allData = {"c_id":c_id , "u_id" : u_id, "cu_comment" : cu_comment};

	$.ajax({
		url: '/rest/commentUsers',
		type:'post',
		data: allData,
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType:'json',
		success: function(data){
			    div =   '<div class="col-md-12">';
				div += 	'<img src="/resources/img/'+image+'" style="width:7%; height:37px; float: left;">';
				div +=  '&nbsp&nbsp '+name+' <p>&nbsp&nbsp '+ cu_comment+'</p></div>';
				
				$(commentUsers).append(div);
		},
		error : function(){
			alert('실패.');
		}
	})
});

