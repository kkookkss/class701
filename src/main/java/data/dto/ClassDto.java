package data.dto;

import java.sql.Timestamp;

public class ClassDto {
	private String class_id;
	private String title;
	private String mentor;
	private String content;
	private String thumbnail_image;
	private String main_image;
	private String price;
	private String class_option;
	private Timestamp releasedate;
	private String category_id;
	
	public String getMain_image() {
		return main_image;
	}
	public void setMain_image(String main_image) {
		this.main_image = main_image;
	}
	
	public String getMentor() {
		return mentor;
	}
	public void setMentor(String mentor) {
		this.mentor = mentor;
	}
	public String getClass_option() {
		return class_option;
	}
	public void setClass_option(String class_option) {
		this.class_option = class_option;
	}
	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getThumbnail_image() {
		return thumbnail_image;
	}
	public void setThumbnail_image(String thumbnail_image) {
		this.thumbnail_image = thumbnail_image;
	}
	public Timestamp getReleasedate() {
		return releasedate;
	}
	public void setReleasedate(Timestamp releasedate) {
		this.releasedate = releasedate;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCategory_id() {
		return category_id;
	}
	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	
	
}
