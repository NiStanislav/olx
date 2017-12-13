package kz.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import kz.dto.PostDTO;
import kz.dto.UserDTO;

@Entity
@Table(name = "posts")
public class PostEntity {
	
	 @Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 @Column(name = "id", unique = true, nullable = false)
	 private Long id;
	 
	 @Column(name = "title", nullable = false)
	 private String title;
	 
	 @Column(name = "city", nullable = false)
	 private String city;
	 
	 @Column(name = "state", nullable = false)
	 private String state;
	 
	 @Column(name = "image", nullable = false)
	 private String image;
	 
	 @Column(name = "author", nullable = false)
	 private String author;
	 
	 @Column(name = "views", nullable = false)
	 private int views;
	 
	 @Column(name = "date", nullable = false)
	 private String date;
	 
	 @Column(name = "price", nullable = false)
	 private String price;
	 
	 @Column(name = "description", nullable = false)
	 private String description;
	
	 public PostEntity(String title, String city,String state, String image, String author, String price, String description) {
	     this.title = title;
	     this.city = city;
	     this.state = state;
	     this.image = image;
	     this.author = author;
	     this.price = price;
	     this.description = description;
	 }
	 
	 public PostEntity() {}
	 
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
	 
	 public PostDTO toDTO() {
	 	PostDTO u = new PostDTO(id,title,city,state,image,author,price,description,views);
		return u;
	 } 

}
