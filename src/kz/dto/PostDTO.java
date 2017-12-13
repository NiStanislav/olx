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
	 private String price;
	 private String description;

	 public PostDTO(long id,String title, String city,String state, String image, String author, String price, String description,int views) {
		 this.id = id;
	     this.title = title;
	     this.city = city;
	     this.state = state;
	     this.image = image;
	     this.author = author;
	     this.price = price;
	     this.description = description;
	     this.views = views;
	 }

	 public PostDTO(String title, String image, long id) {
	     this.title = title;
	     this.image = image;
	     this.id = id;
	 }


	 public String getPrice() {
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
}
