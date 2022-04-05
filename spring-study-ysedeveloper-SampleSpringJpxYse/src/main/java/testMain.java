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

    	
		
	}

}
