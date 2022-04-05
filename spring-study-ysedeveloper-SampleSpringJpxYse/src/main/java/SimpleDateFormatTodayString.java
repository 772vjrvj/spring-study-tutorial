import java.text.SimpleDateFormat;
import java.util.Date;

public class SimpleDateFormatTodayString {

	public static void main(String[] args) {
        try{
            //Date to String º¯È¯
        	SimpleDateFormat sDate1 = new SimpleDateFormat("yyyyMMdd");
            SimpleDateFormat sDate2 = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat sDate3 = new SimpleDateFormat("yyyy.MM.dd");
            SimpleDateFormat sDate4 = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat sDate5 = new SimpleDateFormat("yyyy/MM/dd");
            SimpleDateFormat sDate6 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");

            System.out.println(sDate1.format(new Date())); //20211104
            System.out.println(sDate2.format(new Date())); //2021-11-04
            System.out.println(sDate3.format(new Date())); //2021.11.04
            System.out.println(sDate4.format(new Date())); //2021-11-04
            System.out.println(sDate5.format(new Date())); //2021/11/04
            System.out.println(sDate6.format(new Date())); //2021-11-04 09:39:29.700

        }catch (Exception e){
            System.out.println(e.toString());
        }


	}

}
