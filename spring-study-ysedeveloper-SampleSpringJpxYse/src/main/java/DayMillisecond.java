import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DayMillisecond {

    public static void main(String[] args) {
    	
    	try {
	    	//현재 시간을 millisecond으로
	    	long currentTimeMillis = System.currentTimeMillis();
	    	System.out.println("현지 시간 currentTimeMillis : "+ currentTimeMillis);
	    	
	    	//millisecond을 현재 시간으로 
	    	String nowTime1 = new SimpleDateFormat("yyyy.MM.dd hh:mm:ss").format(currentTimeMillis);
	    	System.out.println("현재 날짜와 시간 : " + nowTime1);
	    	
	    	//특정 시간을 밀리세컨으로 
	    	String nowTime2 = "2021.12.25 23:12:12.123";
			Date nowTime2Str = new SimpleDateFormat("yyyy.mm.dd hh:mm:ss.SSS").parse(nowTime2);
			long nowTime2mil = nowTime2Str.getTime();
			System.out.println("특정 시간  currentTimeMillis : "+ nowTime2mil);
			
			//특정 밀리세컨을 현재시간으로
			String nowTime2re = new SimpleDateFormat("yyyy.mm.dd HH:mm:ss.SSS").format(nowTime2mil);
	    	System.out.println("특정 날짜와 시간 : " + nowTime2re);
			
	    	long dateMilli = new Date().getTime();
	    	System.out.println("date 으로 mill구하기 " + dateMilli);
	    	
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    }

}
