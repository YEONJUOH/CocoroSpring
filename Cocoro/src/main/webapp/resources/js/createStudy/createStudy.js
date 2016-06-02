
// 디파짓 설정,시간 설정 사용 안할경우 
$(document).ready(function() {
	$('#s_deposit-1').click(function() {
		$('#s_deposit_set').attr('disabled', 'true');
	});
	$('#s_deposit-0').click(function() {
		$('#s_deposit_set').removeAttr('disabled');
	});

	$('#s_time_check-1').click(function() {
		$('#s_t_start').attr('disabled', 'true');
		$('#s_t_end').attr('disabled', 'true');
	});
	$('#s_time_check-0').click(function() {
		$('#s_t_start').removeAttr('disabled');
		$('#s_t_end').removeAttr('disabled');
	});
});

