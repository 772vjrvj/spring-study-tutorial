import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class TimestampMillisecond {

    public static void main(String[] args) {

    	String now = "2009-03-20 10:20:30.111"; // ������ ���Ѿ� ��
    	Timestamp t1 = Timestamp.valueOf(now);
    	System.out.println("t1 �ð� : " + t1);
    	System.out.println("t1 �и�: " + t1.getTime());
    	
    	//Ÿ�ӽ����� �и�����
    	Timestamp t2 = new Timestamp(t1.getTime());
    	System.out.println("t2 : " + t2.getTime());
    	
    	Date date = new Date(); 	//����ð�
    	long time = date.getTime(); //���� �ð� �и�����
    	System.out.println("Date Time in Milliseconds: " + time);
    	 
    	Timestamp t3 = new Timestamp(time);
    	System.out.println("Timestamp Date currentTimeMillis: " + t3);
    	
    	Timestamp t4 = new Timestamp(System.currentTimeMillis());
    	System.out.println("Timestamp System.currentTimeMillis: " + t4);

    	
    }

}
