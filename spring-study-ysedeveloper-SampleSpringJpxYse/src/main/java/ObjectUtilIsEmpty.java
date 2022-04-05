import org.springframework.util.ObjectUtils;

public class ObjectUtilIsEmpty {

	public static void main(String[] args) {
		
		Object obj = null;
		System.out.println(ObjectUtils.isEmpty(obj));
		//		true
		
		obj = "";
		System.out.println(ObjectUtils.isEmpty(obj));
		//		true

		obj = new String[] {};
		System.out.println(ObjectUtils.isEmpty(obj));
		//		true

		obj = new Object();
		System.out.println(ObjectUtils.isEmpty(obj));
		//		false

		obj = "abc";
		System.out.println(ObjectUtils.isEmpty(obj));
		//		false

		obj = 123;
		System.out.println(ObjectUtils.isEmpty(obj));
		//		false

	}

}
