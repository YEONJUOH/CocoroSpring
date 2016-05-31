<%@page import="cocoro.search.model.Search"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Search search = (Search) request.getAttribute("search");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<!-- 토글 ui -->
<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet">
<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>



<!-- css 파일 -->
<link href="../../css/SearchResult/sidebar.css" rel="stylesheet">
<link href="../../css/SearchResult/dashboard.css" rel="stylesheet">

<!-- 구글 자동 완성 -->
<!-- <script type="text/javascript" src="../js/SearchResult/autoPlaceIn.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDBwAF1ihCTZwN-ZQi5HRcq0B6WdrPEn70&signed_in=true&libraries=places&callback=initAutocomplete"
	async defer></script> -->
	
<script src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places" type="text/javascript"></script>

<script type="text/javascript">
    function initialize() {
        var input = document.getElementById('searchTextField');
        var autocomplete = new google.maps.places.Autocomplete(input);
        google.maps.event.addListener(autocomplete, 'place_changed', function () {
            var place = autocomplete.getPlace();
           
            document.getElementById('lat').value = place.geometry.location.lat();
            document.getElementById('lng').value = place.geometry.location.lng();
            //alert("This function is working!");
            //alert(place.name);
           // alert(place.address_components[0].long_name);

        });
    }
    google.maps.event.addDomListener(window, 'load', initialize); 
</script>

<!-- time picker plugin  -->
<script type="text/javascript"
	src="../../js/SearchResult/jquery.timepicker.js"></script>
<link rel="stylesheet" type="text/css"
	href="../../css/SearchResult/jquery.timepicker.css" />

<script type="text/javascript"
	src="../../js/SearchResult/bootstrap-datepicker.js"></script>
<link rel="stylesheet" type="text/css"
	href="../../css/SearchResult/bootstrap-datepicker.css" />
<script>
	$(function() {
		$('#stepExample1').timepicker({
			'step' : 15
		});
		$('#stepExample2').timepicker({
			'step' : function(i) {
				return (i % 2) ? 15 : 45;
			}
		});
		
		
		$(".check_bar").change(function(){
			
			//꺼질 때
			
			var flag = $(this).parent().hasClass("off");
			
			if(flag){
				$(this).parent().parent().next().find("input").val("");
				$(this).parent().parent().next().find("input").removeAttr("required",true);
			}else{
				$(this).parent().parent().next().find("input").attr("required",true);	
			}
			
			
		});
		
		$(".input_bar").change(function(){
			var str= $(this).val();
			if(str==""){
				$(this).parent().parent().prev().find("input").removeAttr("checked");
				$(this).parent().parent().prev().find("div").addClass("off");
			}else{
				$(this).parent().parent().prev().find("input").attr("checked",true);
				$(this).parent().parent().prev().find("div").removeClass("off");
			}
			
		});
		
		$("#level").change(function(){
			
			$(this).parent().prev().find("input").attr("checked",true);
			$(this).parent().prev().find("div").removeClass("off");
			
			
			
		});
		
		
		
	});

	function formSubmit() {
       
		var params = $("#searchForm").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
		
		$.ajax({
			url : 'doAjaxSearch.jsp',
			type : 'post',
			data : params,
			dataType : 'json',
			success : function(data) {
				$("#main").empty();
				
                var html ="";
				$.each(data, function(index, entry) {
					 <%if(search!=null&&search.getSearchCtg().equals("스터디")){%>
					var html = '';
					
							html +='<div class="row"><div class="col-md-1"></div>';
							html +='<div class="col-md-9"><div class="well well-sm"><div class="row infoBox">';
							html +='<div class="col-xs-3 col-md-3 text-center ">';
							html +='<a href="../../page/preview/previewStudy.jsp?s_id='+entry.s_id+'"><img src="../../img/groupImg.PNG" alt="bootsnipp" class="img-rounded img-responsive" /></a>';
							html +='<div><span class="glyphicon glyphicon-info-sign"></span><span class="glyphicon glyphicon-home"></span></div></div>';
							html +='<div class="col-xs-8 col-md-8 section-box"><h4><b>';
							
							html += entry.s_name+'</b></h4>';
							html += '<p>'+entry.s_intro+'</p>';
							html += '<div class="row rating-desc"><div class="col-md-12">';

					        
					        html += setAttr(entry.attr,entry.attr.length);
					        
					        html+='</div><br><br>';
					        html += getDate(entry.s_start, entry.s_end);
					        html+='</div><div><br><hr/>';
					       	html+='<p>'+entry.s_tag+'</p>';
					        html +='</div></div></div></div></div></div>';
						

				
					
					
						 $('#main').append(html);   
						 <%}%>
						 
						 <%if(search!=null&&search.getSearchCtg().equals("인물")){%>
							var html = '';
						
								html+='<div class="row"><div class="col-md-1"></div><div class="col-md-9">';
								html+='<div class="well well-sm"><div class="row infoBox">';
								html+='<div class="col-xs-3 col-md-3 text-center "><a href="../../layout/mainLayout.jsp?f_o_id='+entry.u_id+'"><img src="../../img/userPic.PNG" alt="bootsnipp" class="img-rounded img-responsive" /></a>';
								html+='<div><span class="glyphicon glyphicon-heart"></span><span id="heart-num">'+entry.u_like_num+'</span>';
							    html+='</div></div><div class="col-xs-8 col-md-8 section-box">';
							    html+='<h4><b>'+entry.u_name +'</b><br></h4><p>'+entry.u_intro +'</p>';
							    html+='<hr /><div>';
							    if(entry.m_major!=""){
							    html+='<h5><b>멘토 활동 분야</b></h5><p>'+entry.m_major+'</p>';}
							    html+='<h5><b>관심사</b></h5><p>'+entry.u_tag+'</p>';
							    html+='</div></div></div></div></div></div>';
							    
							
						 
							    $('#main').append(html);   
						 
						 
						 
						 
						 <%}%>
						 
						 
						 
				});//이치 닫기
				
			},
			error : function() {
				$("#main").empty();
				 $('#main').append("검색 결과가 없습니다."); 
				
			}
		});
		
	};
	
	function setAttr(attr, size){
		var html ="";
		for(i=0;i<size;i++){
			
			html += '<span class="label label-default">'+attr[i]+'</span>&nbsp';
		}
		
		return html;
	}
	
	function getDate(s_start,s_end){
		var html="";
		if(s_start!=null){
		html+='<label>'+s_start+'</label>~&nbsp<label>'+s_end+'</label>';
		}
		return html;
	}
	
	function foo(timestamp){

		var date = new Date(timestamp.time);
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		var day = date.getDay();
		var hour = date.getHours();
		var min = date.getMinutes();
		var sec = date.getSeconds();


		var retVal =   year + "-" + (month < 10 ? "0" + month : month) + "-" 
		                        + (day < 10 ? "0" + day : day);

		return retVal
		}
	
</script>
</head>
<body>
	<div class="container-fluid">



		<div class="row">

			<div class="col-sm-4 col-md-3 sidebar">

				<form class="form-horizontal" role="form" id="searchForm">

					<%
						if (search != null) {
					%>
					<input type="hidden" value="<%=search.getSearchCtg()%>"
						name="searchCtg"> <input type="hidden"
						value="<%=search.getSearchWord()%>" name="searchWord">
					<%
						}
					%>
					
					
					<div class="row com-filter">
				 <label class="radio-inline"><input type="radio"
							value="history" name="com_filter">최신순
						</label><label class="radio-inline"><input type="radio"
							value="total_hit" name="com_filter">인기순</label>
					  <label class="radio-inline"><input type="radio"
							value="s_last_act" name="com_filter">정확성</label>		
					</div>
					
					
					<div class="row mentor-filter">
					<div class="sep"><span class="glyphicon glyphicon-user" id="user-icon"></span></div>
						<label class="radio-inline"> <input type="radio"
							value="mentor" name="mentorFilter">멘토
						</label> <label class="radio-inline"><input type="radio"
							value="all" name="mentorFilter">전체 </label>
					</div>
					<div class="row">
					<div><span class="glyphicon glyphicon-home"  id="study-icon"></span></div>
						<span>
							<h5>
								거리&nbsp&nbsp<input type="checkbox" data-toggle="toggle"
									data-size="mini" data-onstyle="success" value="y"
									name="locCheck" class="check_bar">
							</h5>
							<div class="form-group col-md-12 tfheader">
							<div>
								<input type="text" class="form-control input_bar" id="searchTextField"
									placeholder="서울시 가산동" autocomplete="on" runat="server" > <input
									type="hidden" id="lat" value="" name="lat"> <input
									type="hidden" id="lng" value="" name="lng">
								<div class="tfclear"></div>
								</div>
							</div>
						</span>
					</div>
					<br>

					<div class="row">
						<span>

							<h5>
								시간&nbsp&nbsp<input type="checkbox" data-toggle="toggle"
									data-size="mini" data-onstyle="success" value="y"
									name="timeCheck" class="check_bar">
							</h5>



							<div class="form-group col-md-12">

								<div class="col-md-5 padding-zero">
									<input type="text" class="form-control time input_bar" id="stepExample1"
										placeholder="시작 시간" name="startTime">
								</div>
								<div class="col-md-1"></div>
								<div class="col-md-5 padding-zero">
									<input type="text" class="form-control time input_bar" id="stepExample2"
										placeholder="끝나는 시간" name="endTime">
								</div>

							</div> <br>
						</span>
					</div>
					<div class="row">
						<span>
							<div class="form-group col-md-12">
								<h5 class="col-md-7 padding-zero">

									실력&nbsp&nbsp<input type="checkbox" data-toggle="toggle"
										data-size="mini" data-onstyle="success" value="y"
										name="levelCheck" class="check_bar">
								</h5>


								<div class="form-group col-md-4">
									<select class="form-control" id="level" name="level">
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
										<option>6</option>
										<option>7</option>
										<option>8</option>
										<option>9</option>
									</select>
								</div>


							</div>
						</span>
					</div>
					<div class="row">
						<span>

							<h5 class="col-md-6 padding-zero">

								튜터링&nbsp&nbsp<input type="checkbox" data-toggle="toggle"
									data-size="mini" data-onstyle="success" value="y"
									name="tutorCheck" class="check_bar">
							</h5>
					</div>


				</form>
				<div class="row text-center">
					<div class="controls">
						<button class="btn btn-default" id="filter_btn"
							onclick="formSubmit()">검색</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>