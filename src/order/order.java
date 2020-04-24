package order;

public class order {
	private int id;
	private String price;
	private String chackingdate;
	private String chackoutdate;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public order(String price, String chackingdate, String chackoutdate) {
		
		this.price = price;
		this.chackingdate = chackingdate;
		this.chackoutdate = chackoutdate;
	}
	public order(int id, String price, String chackingdate, String chackoutdate) {
	
		this.id = id;
		this.price = price;
		this.chackingdate = chackingdate;
		this.chackoutdate = chackoutdate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getChackingdate() {
		return chackingdate;
	}
	public void setChackingdate(String chackingdate) {
		this.chackingdate = chackingdate;
	}
	public String getChackoutdate() {
		return chackoutdate;
	}
	public void setChackoutdate(String chackoutdate) {
		this.chackoutdate = chackoutdate;
	}
	

}
