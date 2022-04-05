/**
 *	댓글을 위한 댓글 객체 
 */

// 댓글 객체가 적용이 됐는지 알기 위해서 console.에 찍는다.

console.log("Replay Module..............");

//replyService 함수 -처리해야할 함수를 가지고 있는 함수 작성: 처리 해야할 함수를 리턴해 주는 함수
var replyService = (function(){

	//------ 실행할 함수 정의 -----------//
	// 댓글 리스트 가져오기 -list (서버에 넘겨주는 데이터 객체, 데이터를 가져오면 실행되는 함수, 오류가 나면 실행되는 함수)
	function list(param, callback, error){
		var no = param.no;
		
		//$ = jQuery 제이쿼리 홈페이지 참조 -> 서버에게 JSON 데이터를 달라고 하는 AJAX함수이다.
		$.getJSON(
			//Ajax의 서버 URL
			"/reply/list.do?no=" + no,
			//서버에서 데이터를 받아오면 후에 파라미터로 받는 데이터로 실행되는 함수
			function(data){
				// callbakc 함수가 있다면
				if(callback){
					// callbakc 함수를 data를 파라미터로 받아서 실행한다.
					callback(data);
				}
			}
			
			//데이터 가져오기에서 실패 했을 때 실행이 되는 함수.
		).fail(
			function(xhr, status, err){
				//error()가 있으면 실행한다.
				if(error) error(err);
				else alert("데이터 가져오기를 실패하셨습니다.");
			}
		);
		// === $.getJSON 함수의 끝
	}
	//----------- list()함수의 끝
	
	//댓글 등록 write 예약어 조심
	function write(reply, callback, error){
		//		alert("reply.js - 댓글 등록 실행 : reply" + JSON.stringify(reply));
		
		//jQuery 의 ajax함수 - load(), getJSON(), ajax()
		$.ajax({
			url: "/reply/write.do",
			type: "post",
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success : function(result){
				if(callback) callback(result);
				else
					alert("댓글 등록이 되었습니다.");
			},
			error: function(xhr, status, er){
				if(error) error(er);
				else
					alert("댓글 등록에 실패 하셨습니다.");
			}
		});
		
	}
	
	//댓글 등록 update 예약어 조심
	function update(reply, callback, error){
		//		alert("reply.js - 댓글 등록 실행 : reply" + JSON.stringify(reply));
		
		//jQuery 의 ajax함수 - load(), getJSON(), ajax()
		$.ajax({
			url: "/reply/update.do",
			type: "patch",
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8", //전달되는 데이터 형식
			success : function(result){
				if(callback) callback(result);
				else
					alert("댓글 수정이 되었습니다.");
			},
			error: function(xhr, status, er){
				if(error) error(er);
				else
					alert("댓글 수정에 실패 하셨습니다.");
			}
		});
		
	}
	
	//댓글 등록 삭제 예약어 조심
	function deleteReply(rno, callback, error){
		//		alert("reply.js - 댓글 등록 실행 : reply" + JSON.stringify(reply));
		
		//jQuery 의 ajax함수 - load(), getJSON(), ajax()
		$.ajax({
			url: "/reply/delete.do?rno=" + rno,
			type: "delete",
//			data: JSON.stringify(reply),
//			contentType: "application/json; charset=utf-8", //번호만 넘기는 필요 없음
			success : function(result){
				if(callback) callback(result);
				else
					alert("댓글 삭제 되었습니다.");
			},
			error: function(xhr, status, er){
				if(error) error(er);
				else
					alert("댓글 삭제 실패 하셨습니다.");
			}
		});
		
	}
	
	
	return {
		list : 		  list,
		write: 		  write,
		update: 	  update,
		deleteReply : deleteReply
	}  //함수를 객체로 만들어서 리턴해준다.
		
})();
