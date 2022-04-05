import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SimpleDateFormatPatternChange {

	public static void main(String[] args) {
		// ��¥ ���� ��ȯ�� parsing ������ try catch�� üũ
		try {
			String strDate = "20200806";
			SimpleDateFormat dtFormat = new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat newDtFormat = new SimpleDateFormat("yyyy-MM-dd");
			// String Ÿ���� Date Ÿ������ ��ȯ
			Date formatDate = dtFormat.parse(strDate); // DateŸ���� ������ ���Ӱ� ������ �������� ��ȯ
			String strNewDtFormat = newDtFormat.format(formatDate);
			System.out.println("���� �� : " + strDate);
			System.out.println("���� �� : " + strNewDtFormat);
		} catch (ParseException e) {
			e.printStackTrace();
		}



	}

}
