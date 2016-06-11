<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>

<script src="/resources/js/carousel.js"></script>
<style type="text/css">
#main_img {
	max-width: 100%;
	height: auto;
}
.grid-divider{
text-align: center;
}
</style>
<script type="text/javascript">
$(function(){
	$('#btn').click(function(){
		alert('로그인을 해주세요');
	})
})
</script>
</head>
<body>
	<!-- body -->
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
	 <div class="carousel-inner" role="listbox">
			<img data-src="holder.js/900x500/auto/#777:#777" alt="900x500"
				src="/resources/img/mainTestimg2.jpg" data-holder-rendered="true"
				id="main_img">
			<div class="carousel-caption">
				<h2 class="text-center">
					<b>온라인 스터디 Cocoro에 오신걸 환영합니다.</b>
				</h2>
					<div class="input-group">
					 <input type="text" class="form-control" name="searchWord" placeholder="로그인을 해주세요.." id="search_key" value=""> 
					 <span class="input-group-btn"><button class="btn btn-info" type="" id="btn">Search</button></span>
					</div>
			</div>
    </div>
    </div>
	<!-- 첫번째 메뉴 -->	
	<div class="row" style="margin-top: 50px;">
        <div class="col-md-6 text-center">
          <h2>Cocoro에 오신걸 환영합니다!!</h2><br><br>
          <h4>#태그를 이용해 회원님만의 스터디를 만들어보세요</h4>
          <h4>회원님이 만드실때 등록하신 #태그를 보고</h4>
          <h4>다른 회원분들이 가입신청을 할겁니다.</h4>
          <h4>여러분만의 스터디를 만들어서 사람들을 모집해보세요</h4>
        </div>
        <div class="col-md-6">
			<img src="/resources/img/Main.png" class="img-responsive" style="height: 270px;width: 480px;" alt="Responsive image">
		</div>
    </div>
    <!-- 두번쨰 메뉴 -->
    <div class="row" style="margin-top: 50px;">
        <div class="col-md-6 text-center">
          <h2>관심사 추천</h2><br><br>
          <h4>가입할떄 적어주신 #태그와 회원님이 클릭하신</h4>
          <h4>스터디를 바탕으로 회원님에게 적절한 스터디를</h4>
          <h4>매칭해주는 시스템 적용하고있습니다.</h4>
        </div>
        <div class="col-md-6">
			<img src="/resources/img/Main2.png" class="img-responsive" style="height: 270px;width: 480px;" alt="Responsive image">
		</div>
    </div>
    <!-- 세번째 메뉴 -->
      <div class="row" style="margin-top: 50px;">
        <div class="col-md-6 text-center">
          <h2>스터디관리 시스템</h2><br><br>
          <h4>회원님만의 스터디룸을 만들어보세요!</h4>
          <h4>용도에따라 커스텀할 수 있게 Cocoro가 노력하고있습니다.</h4>
         <a href="../layout/mainLayout.jsp?body=../page/Join/JoinForm.jsp"><button class="btn-lg btn-success">가입하러가기</button></a>
        </div>
        <div class="col-md-6">
			<img src="/resources/img/Main3.png" class="img-responsive" style="height: 270px;width: 480px; margin-left: 15px;" alt="Responsive image">
		</div>
    </div>
</body>
</html>