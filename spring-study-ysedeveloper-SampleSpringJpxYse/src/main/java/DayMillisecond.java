import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DayMillisecond {

    public static void main(String[] args) {
    	
    	try {
	    	//���� �ð��� millisecond����
	    	long currentTimeMillis = System.currentTimeMillis();
	    	System.out.println("���� �ð� currentTimeMillis : "+ currentTimeMillis);
	    	
	    	//millisecond�� ���� �ð����� 
	    	String nowTime1 = new SimpleDateFormat("yyyy.MM.dd hh:mm:ss").format(currentTimeMillis);
	    	System.out.println("���� ��¥�� �ð� : " + nowTime1);
	    	
	    	//Ư�� �ð��� �и��������� 
	    	String nowTime2 = "2021.12.25 23:12:12.123";
			Date nowTime2Str = new SimpleDateFormat("yyyy.mm.dd hh:mm:ss.SSS").parse(nowTime2);
			long nowTime2mil = nowTime2Str.getTime();
			System.out.println("Ư�� �ð�  currentTimeMillis : "+ nowTime2mil);
			
			//Ư�� �и������� ����ð�����
			String nowTime2re = new SimpleDateFormat("yyyy.mm.dd HH:mm:ss.SSS").format(nowTime2mil);
	    	System.out.println("Ư�� ��¥�� �ð� : " + nowTime2re);
			
	    	long dateMilli = new Date().getTime();
	    	System.out.println("date ���� mill���ϱ� " + dateMilli);
	    	
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    }

}
