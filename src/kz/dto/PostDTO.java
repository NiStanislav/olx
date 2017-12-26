package kz.dto;

public class PostDTO {

	 private long id;
	 private String title;
	 private String city;
	 private String state;
	 private String image;
	 private String author;
	 private int views;
	 private String date;
	 private int price;
	 private String description;
	 private String category;
	 private String phone;

	 public PostDTO(long id,String title, String city,String state, String image, String author, int price, String description,int views,String category,String phone) {
		 this.id = id;
	     this.title = title;
	     this.city = city;
	     this.state = state;
	     this.image = image;
	     this.author = author;
	     this.price = price;
	     this.description = description;
	     this.views = views;
	     this.category = category;
	     this.phone = phone;
	 }

	 public PostDTO(String title, String image, long id) {
	     this.title = title;
	     this.image = image;
	     this.id = id;
	 }


	 public int getPrice() {
	     return this.price;
	 }

	 public void setId(long id) {
	     this.id = id;
	 }

	 public void setDate(String date) {
	     this.date = date;
	 }

	 public void setViews(int views) {
	     this.views = views;
	 }

	 public long getId() {
	     return this.id;
	 }

	 public int getViews() {
	     return this.views;
	 }

	 public String getDate() {
	     return this.date;
	 }

	 public String getTitle() {
	     return this.title;
	 }

	 public String getCity() {
	     return this.city;
	 }

	 public String getState() {
	     return this.state;
	 }

	 public String getImage() {
	     return this.image;
	 }

	 public String getAuthor() {
	     return this.author;
	 }

	 public String getDescription() {
	     return this.description;
	 }

	 public void setDescription(String description) {
	     this.description = description;
	 }
	 
	 public String getCategory() {
	     return this.category;
	 }
	
	 public void setCategory(String category) {
	     this.category = category;
	 }
	 
	 public String getPhone() {
	     return this.phone;
	 }
	
	 public void setPhone(String phone) {
	     this.phone = phone;
	 }
}
