/**
 *	유용한 함수 작성
 */

// 날짜 객체를 가지고 형태에 맞는 데이터 문자열 만들기

function diplayDateTime(timeStemp){
	//넘어온 날짜 정보를 가지고 날짜 객체로 만든다.
	var dateTime = new Date(timeStemp);
	// yyyy.mm.dd
	
	var month = dateTime.getMonth() + 1;
	if(month < 10) month = "0" + month;
	
	var day = dateTime.getDay() + 1;
	if(day < 10) day = "0" + day;
	
	return dateTime.getFullYear() + "." + month + "." + day;
}
