import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.javassist.expr.Instanceof;

import sun.security.jca.GetInstance.Instance;

public class testMain {
	
	public enum Color {
	    RED, GREEN, BLUE;

	    public void colorInfo() { 
	        System.out.println("Universal Color"); 
	    }
	}

	public enum Week {
	    MONDAY, TUSEDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY
	    
	}
		
	public static void main(String[] args) {

		Color.BLUE.colorInfo();
		
		Week today = Week.MONDAY;
		
		System.out.println("today : " + today);

//		Color color = Color.BLUE;
//		
//		System.out.println("color : "+ color);
		
		long l = (10L-1)/10L + 1;
		System.out.println("l:"+l);
		
		
		long ll = (17-1)/5 + 1;
		System.out.println("ll : " + ll);
		System.out.println("ll : " + (17-1)/5 + 1);
		
		
		
		long startPage 
		= (1 - 1) / 10 * 10;
		System.out.println("startPage : " + startPage);
		
		int dd = (int)Math.ceil((double)12/(double)5);
		
		System.out.println("dd : " + dd);
		
		
		
    	
		
	}

}
