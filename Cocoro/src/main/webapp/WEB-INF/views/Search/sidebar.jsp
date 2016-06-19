<%@page import="cocoro.search.domain.Search"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//Search search = (Search)request.getAttribute("search");
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
<link href="/resources/css/SearchResult/sidebar.css" rel="stylesheet">
<link href="/resources/css/SearchResult/dashboard.css" rel="stylesheet">

<!-- 구글 자동 완성 -->
<!-- <script type="text/javascript" src="../js/SearchResult/autoPlaceIn.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDBwAF1ihCTZwN-ZQi5HRcq0B6WdrPEn70&signed_in=true&libraries=places&callback=initAutocomplete"
	async defer></script> -->

<script
	src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"
	type="text/javascript"></script>

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
	src="/resources/js/SearchResult/jquery.timepicker.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/SearchResult/jquery.timepicker.css" />

<script type="text/javascript"
	src="/resources/js/SearchResult/bootstrap-datepicker.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/SearchResult/bootstrap-datepicker.css" />
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

 	function formSubmitS(){
       
		// serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
		//var data =  $('#searchForm').serialize();
		  var json = {};
		 $.each($('#searchForm').serializeArray(), function() {
		   json[this.name] = this.value;
		 }); 
		
	    //var data = JSON.stringify(jQuery('#searchForm').serializeObject());
	    // var data =   jQuery('#searchForm').serializeObject();
		alert(json);
		$.ajax({
			url : '/search/doAjax',
			type : 'post',
			data :  JSON.stringify(json),
			dataType : 'json',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			success : function(data) {
				$("#main").empty();
				
                var html ="";
            	
				$(data.list).each(function(){
					
			
					var html = '';
					
							html +='<div class="row"><div class="col-md-1"></div>';
							html +='<div class="col-md-9"><div class="well well-sm"><div class="row infoBox">';
							html +='<div class="col-xs-3 col-md-3 text-center ">';
							html +='<a href="/"><img src="/resources/img/groupImg.PNG" alt="bootsnipp" class="img-rounded img-responsive" /></a>';
							html +='<div><a href="/study/previewStudy?s_id='+this.s_id +'"><span class="glyphicon glyphicon-info-sign"></span></a><span class="glyphicon glyphicon-home"></span></div></div>';
							html +='<div class="col-xs-8 col-md-8 section-box"><h4><b>';
							
							html += this.s_name+'</b></h4>';
							html += '<p>'+this.s_intro+'</p>';
							html += '<div class="row rating-desc"><div class="col-md-12">';

					        
					        html += setAttr(this.attr,this.attr.length);
					        
					        html+='</div><br><br>';
					        html += getDate(this.s_start, this.s_end);
					        html+='</div><div><br><hr/>';
					       	html+='<p>'+this.s_tag+'</p>';
					        html +='</div></div></div></div></div></div>';
						

				
					
					
						 $('#main').append(html);   
						
						 
						 
						 
				});//이치 닫기
				
			},
			error : function(){
				$("#main").empty();
				 $('#main').append("검색 결과가 없습니다."); 
				
			}
		});
		
	};
	
 	function formSubmitP(){
        
		// serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
		//var data =  $('#searchForm').serialize();
		  var json = {};
		 $.each($('#searchForm').serializeArray(), function() {
		   json[this.name] = this.value;
		 }); 
		
	    //var data = JSON.stringify(jQuery('#searchForm').serializeObject());
	    // var data =   jQuery('#searchForm').serializeObject();
		alert(json);
		$.ajax({
			url : '/search/doAjax',
			type : 'post',
			data :  JSON.stringify(json),
			dataType : 'json',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			success : function(data) {
				$("#main").empty();
				console.log("길이"+data.list.length);
                var html ="";
            	
				$(data.list).each(function(){
					
					
					var html = '';
					
					html+='<div class="row"><div class="col-md-1"></div><div class="col-md-9">';
					html+='<div class="well well-sm"><div class="row infoBox">';
					html+='<div class="col-xs-3 col-md-3 text-center "><a href="../../layout/mainLayout.jsp?f_o_id='+this.u_id+'"><img src="/resources/img/userPic.PNG" alt="bootsnipp" class="img-rounded img-responsive" /></a>';
					html+='<div><span class="glyphicon glyphicon-heart"></span><span id="heart-num">'+this.u_like_num+'</span>';
				    html+='</div></div><div class="col-xs-8 col-md-8 section-box">';
				    html+='<h4><b>'+this.u_name +'</b><br></h4><p>'+this.u_intro +'</p>';
				    html+='<hr /><div>';
				    if(this.m_major!=null){
				    html+='<h5><b>멘토 활동 분야</b></h5><p>'+this.m_major+'</p>';}
				    html+='<h5><b>관심사</b></h5><p>'+this.u_tag+'</p>';
				    html+='</div></div></div></div></div></div>';
				    
				
			 
				    $('#main').append(html);   
						 
						 
						 
				});//이치 닫기
				
			},
			error : function(){
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

                   

                      
					<input type="hidden" value="${search.searchCtg }" name="searchCtg">
					<input type="hidden" value="${search.searchWord }" name="searchWord">



					<div class="row com-filter">
						<label class="radio-inline"><input type="radio"
							value="history" name="com_filter">최신순 </label><label
							class="radio-inline"><input type="radio"
							value="total_hit" name="com_filter">인기순</label> <label
							class="radio-inline"><input type="radio"
							value="s_last_act" name="com_filter">정확성</label>
					</div>


					<div class="row mentor-filter">
						<div class="sep">
							<span class="glyphicon glyphicon-user" id="user-icon"></span>
						</div>
						<label class="radio-inline"> <input type="radio"
							value="mentor" name="mentorFilter">멘토
						</label> <label class="radio-inline"><input type="radio"
							value="all" name="mentorFilter">전체 </label>
					</div>
					<div class="row">
						<div>
							<span class="glyphicon glyphicon-home" id="study-icon"></span>
						</div>
						<span>
							<h5>
								거리&nbsp&nbsp<input type="checkbox" data-toggle="toggle"
									data-size="mini" data-onstyle="success" value="y"
									name="locCheck" class="check_bar">
							</h5>
							<div class="form-group col-md-12 tfheader">
								<div>
									<input type="text" class="form-control input_bar"
										id="searchTextField" placeholder="서울시 가산동" autocomplete="on"
										runat="server" name="address"> 
										<input type="hidden" id="lat" value=""
										name="lat"> <input type="hidden" id="lng" value=""
										name="lng">
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
									<input type="text" class="form-control time input_bar"
										id="stepExample1" placeholder="시작 시간" name="startTime">
								</div>
								<div class="col-md-1"></div>
								<div class="col-md-5 padding-zero">
									<input type="text" class="form-control time input_bar"
										id="stepExample2" placeholder="끝나는 시간" name="endTime">
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
							onclick=
					 <c:if test="${search.searchCtg eq '스터디' }">
					  "formSubmitS()"
					  </c:if>
					   <c:if test="${search.searchCtg eq '인물' }">
					  "formSubmitP()"
					  </c:if>
					
					  >검색</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>