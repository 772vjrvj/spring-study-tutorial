/**
 *	댓글을 위한 댓글 객체 
 */

// 댓글 객체가 적용이 됐는지 알기 위해서 console.에 찍는다.

console.log("member Module..............");

//replyService 함수 -처리해야할 함수를 가지고 있는 함수 작성: 처리 해야할 함수를 리턴해 주는 함수
var memberService = (function(){
	
	function idCheck(id, callback, error){
		
		$.ajax({
			url: "/member/idCheck.do",
			type: "post",
			data: id,
			contentType: "application/json; charset=utf-8",
			success : function(result){
				if(callback) callback(result);
				else
					console.log("아이디 조회에 성공했습니다.");
			},
			error: function(xhr, status, er){
				if(error) error(er);
				else
					console.log("아이디 조회에 실패 했습니다.");
			}
		});
		
	}
	

	return {
		idCheck : idCheck
	} 
		
})();
