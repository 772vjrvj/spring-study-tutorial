package sample.springjqx.yse.jqxGridDto;


public class Beverages {
	
	 String id;
	 String name;
	 String type;
	 String calories;
	 String totalfat;
	 String protein;
	 
	public Beverages(String id, String name, String type, String calories, String totalfat, String protein) {
		super();
		this.id = id;
		this.name = name;
		this.type = type;
		this.calories = calories;
		this.totalfat = totalfat;
		this.protein = protein;
	}
	

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCalories() {
		return calories;
	}
	public void setCalories(String calories) {
		this.calories = calories;
	}
	public String getTotalfat() {
		return totalfat;
	}
	public void setTotalfat(String totalfat) {
		this.totalfat = totalfat;
	}
	public String getProtein() {
		return protein;
	}
	public void setProtein(String protein) {
		this.protein = protein;
	}
	
	@Override
	public String toString() {
		return "Beverages [id=" + id + ", name=" + name + ", type=" + type + ", calories=" + calories + ", totalfat="
				+ totalfat + ", protein=" + protein + "]";
	}

}
