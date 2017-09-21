$(document).ready(function() {
	$('#signForm').submit(function(event) {
		event.preventDefault();
		var id = $('#nid').val();
		var pwd = $('#npwd').val();
		
		
		console.log(id, pwd);

		$.post("http://httpbin.org/post", {
			"id" : id,
			"pwd" : pwd
		}, function(data) {
			var myModal = $('#myModal');
			myModal.modal();
			myModal.find('.modal-body').text(data.form.id + '님 회원가입 되었습니다.');
		});
	});
});
$(function() {

});