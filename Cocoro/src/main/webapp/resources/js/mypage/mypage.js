$(function(){
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
				div += '<form><div class="input-group">';
				div += '<input type="text" class="form-control" placeholder="Add a comment..">';
				div += '<div class="input-group-btn"><button class="btn btn-default">댓글</button>';
				div +=	'</div></div></form></div></div>';
				
				$('#test').append(div);
			},
		error :	function(){
			alert("실패")
		}
		})
	});
	//수정
	$('#modifyForm').submit(function(e){
		event.preventDefault();
		
		var params = $('#modifyForm').serialize();

		$.ajax({
			url: '/rest/usersModify',
			type: 'post',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data: params,
			dataType : 'json',
			success : function(data){
				alert('성공');
			},
		error :	function(){
			alert('실패');
		}
		})
	});
	
	
	
	// 입금
	$('#inputForm').submit(function(e){
		event.preventDefault();
		var params = $('#inputForm').serialize();
		$.ajax({
			url: '/rest/inputAccount',
			type:'post',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data:params,
			dataType:'json',
			success: function(data){
				alert('성공');
				$('#accountMoney').html("잔액 :" + data.u_balance);
			},
			error : function(){
				alert('돈이 부족합니다.');
			}
		})	
	})
	// 출금
	$('#outputForm').submit(function(e){
		event.preventDefault();
		var params = $('#outputForm').serialize();
		$.ajax({
			url: '/rest/outputAccount',
			type:'post',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data:params,
			dataType:'json',
			success: function(data){
				alert('성공');
				$('#accountMoney').html("잔액 :" + data.u_balance);
			},
			error : function(){
				alert('돈이 부족합니다.');
			}
		});
	});
	
	//팔로우 보여주는 페이지의 높이가 316이넘었을때
	if($('#followYou').height() > 316){
		$('#followYou').css('height',316);
		$('#followYou').css('overflow','hidden');
		$('#more').html("더보기");
	}
	if($('#followMe').height() > 316){
		$('#followMe').css('height',316);
		$('#followMe').css('overflow','hidden');
	}
	if($('#ingStudy').height() > 298){
		$('#ingStudy').css('height',298);
		$('#ingStudy').css('overflow','hidden');
	}
	$("input[name=u_mento_check]").change(function() {
		var check = $(this).val();
		if(check == "T"){
			$('#mentoForm').slideDown();
		}else{
			$('#mentoForm').slideUp();
		}
	})
	
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
			alert('성공');
				div =   '<div class="col-md-12">';
				div += 	'<img src="/resources/img/'+image+'" style="width:7%; height:37px; float: left;">';
				div +=  '&nbsp&nbsp '+name+' <p>&nbsp&nbsp '+cu_comment+'</p></div>';
				
				$(commentUsers).append(div);
		},
		error : function(){
			alert('실패.');
		}
	});
	
}); 
	
	
