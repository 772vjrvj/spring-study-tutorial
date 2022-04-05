import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class TimestampMillisecond {

    public static void main(String[] args) {

    	String now = "2009-03-20 10:20:30.111"; // 형식을 지켜야 함
    	Timestamp t1 = Timestamp.valueOf(now);
    	System.out.println("t1 시간 : " + t1);
    	System.out.println("t1 밀리: " + t1.getTime());
    	
    	//타임스탬프 밀리세컨
    	Timestamp t2 = new Timestamp(t1.getTime());
    	System.out.println("t2 : " + t2.getTime());
    	
    	Date date = new Date(); 	//현재시간
    	long time = date.getTime(); //현재 시간 밀리세컨
    	System.out.println("Date Time in Milliseconds: " + time);
    	 
    	Timestamp t3 = new Timestamp(time);
    	System.out.println("Timestamp Date currentTimeMillis: " + t3);
    	
    	Timestamp t4 = new Timestamp(System.currentTimeMillis());
    	System.out.println("Timestamp System.currentTimeMillis: " + t4);

    	
    }

}
