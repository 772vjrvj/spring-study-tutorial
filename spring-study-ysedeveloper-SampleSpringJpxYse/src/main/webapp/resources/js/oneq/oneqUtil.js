

var oneqUtil = {
	isEmpty : function(value){
		if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){ 
			return true; 
		}else{ 
			return false; 
		} 
	},
	
	isNumber : function(value){
        //숫자가 아닌 것 체크
        var num = /^[0-9]*$/g;
        if(!num.test(value)){
            alert('숫자를 입력하세요');
            return false;
        }

        //0으로 시작 체크
        var zeroStart = /^0/g;
        if(zeroStart.test(value)){
            alert('0으로 시작할 수 없습니다.');
            return false;
        }
        
        return true;
		
	},
	
	siteList : function(siCode, guCode, site){
		
		var reqData = {
			site : site,
			siCode: siCode,
			guCode: guCode
		};
		
		var result;
		
		$.ajax({
			contentType:'application/json',
		    url:'/oneqMain1/oneqsiteList', //request 보낼 서버의 경로
		    type:'POST', // 메소드(get, post, put 등)
		    dataType: "json",
		    async: false, //동기: false, 비동기(기본값): ture
		    data: JSON.stringify(reqData), //보낼 데이터,
			timeout: 2*60*60*1000, //2 hours,
		    success: function(data) {
		        //서버로부터 정상적으로 응답이 왔을 때 실행
		    	result = data;
		    },
		    error: function(err) {
		    	console.log('err : ', err);
		        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
		    }
		});
		
		return result;
	},
}
