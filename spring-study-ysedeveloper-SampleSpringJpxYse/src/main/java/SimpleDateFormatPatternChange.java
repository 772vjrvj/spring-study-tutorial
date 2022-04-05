import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SimpleDateFormatPatternChange {

	public static void main(String[] args) {
		// 날짜 형식 변환시 parsing 오류를 try catch로 체크
		try {
			String strDate = "20200806";
			SimpleDateFormat dtFormat = new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat newDtFormat = new SimpleDateFormat("yyyy-MM-dd");
			// String 타입을 Date 타입으로 변환
			Date formatDate = dtFormat.parse(strDate); // Date타입의 변수를 새롭게 지정한 포맷으로 변환
			String strNewDtFormat = newDtFormat.format(formatDate);
			System.out.println("포맷 전 : " + strDate);
			System.out.println("포맷 후 : " + strNewDtFormat);
		} catch (ParseException e) {
			e.printStackTrace();
		}



	}

}
