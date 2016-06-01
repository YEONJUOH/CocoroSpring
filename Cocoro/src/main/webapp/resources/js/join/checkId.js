/**
 * 
 */
var checkFirst = false;
var lastKeyword = '';
var loopSendKeyword = false;

function checkId() {
	if (checkFirst == false) {
		//0.5초 후에 sendKeyword()함수 실행
		setTimeout("sendId();", 500);
		loopSendKeyword = true;
	}
	checkFirst = true;
}

function sendId() {

	if (loopSendKeyword == false)
		return;

	var keyword = $('#useridTmp').val();

	if (keyword == '') {
		lastKeyword = '';
		// document.getElementById('checkMsg').style.color = "black";
		$('#emId').css("color", "black");
		//document.getElementById('checkMsg').innerHTML = "아이디를 입력하세요.";
		$('#emId').text("아이디를 입력하세요.");

	} else if (keyword != lastKeyword) {

		lastKeyword = keyword;

		if (keyword != '') {
			var params = "id=" + encodeURIComponent(keyword);

			$.ajax({
				url : "../web/server/IdServer.jsp",
				type : "post",
				dataType : "text",
				data : params,
				success : displayResult,
				error : function() {
					alert("씨뎅");
				}

			});

		}
	}
	setTimeout("sendId();", 500);
}

function displayResult(data) {

	var resultText = eval(data);

	if (resultText == 0) {

		$('#emId').text("사용 할 수 있는 ID 입니다.");
		$('#emId').css("color", "blue");

	} else {

		$('#emId').text("이미 등록된 ID 입니다");

		$('#emId').css("color", "red");
	}

}

function IdBool() {

	var IdBool = $('#emId').css("color");

	if (IdBool == "rgb(0, 0, 255)") {

		return true;
	} else {
		return false;
	}
}
