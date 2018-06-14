package com.health.DTO;

import org.springframework.web.multipart.MultipartFile;

public class cosmeticDTO {
	private String cos_no;
	private String cos_name;
	private String cos_type;
	private String ing;
	private String brand;
	private String price;
	private String like_count;
	private String reg_no;
	private String reg_dt;
	private String chg_no;
	private String chg_dt;
	private String ing_name;
	private String file_check;
	private String search;
	private String good;
	private String bad;
	private String img_path;
	private String img_name;
	private String thumb_name;
	private String ori_img_name;
	private String read_more;
	public String getRead_more() {
		return read_more;
	}
	public void setRead_more(String read_more) {
		this.read_more = read_more;
	}
	public String getOri_img_name() {
		return ori_img_name;
	}
	public void setOri_img_name(String ori_img_name) {
		this.ori_img_name = ori_img_name;
	}
	MultipartFile upfile;
	public MultipartFile getUpfile(){
		return upfile;
	}
	public void setUpfile(MultipartFile upfile){
		this.upfile = upfile;
	}	
	
	
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	public String getImg_name() {
		return img_name;
	}
	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}
	public String getThumb_name() {
		return thumb_name;
	}
	public void setThumb_name(String thumb_name) {
		this.thumb_name = thumb_name;
	}
	public String getThumb_path() {
		return thumb_path;
	}
	public void setThumb_path(String thumb_path) {
		this.thumb_path = thumb_path;
	}
	String thumb_path;

	
	public String getGood() {
		return good;
	}
	public void setGood(String good) {
		this.good = good;
	}
	public String getBad() {
		return bad;
	}
	public void setBad(String bad) {
		this.bad = bad;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getFile_check() {
		return file_check;
	}
	public void setFile_check(String file_check) {
		this.file_check = file_check;
	}
	public String getIng_name() {
		return ing_name;
	}
	public void setIng_name(String ing_name) {
		this.ing_name = ing_name;
	}
	public String getCos_no() {
		return cos_no;
	}
	public void setCos_no(String cos_no) {
		this.cos_no = cos_no;
	}
	public String getCos_name() {
		return cos_name;
	}
	public void setCos_name(String cos_name) {
		this.cos_name = cos_name;
	}
	public String getCos_type() {
		return cos_type;
	}
	public void setCos_type(String cos_type) {
		this.cos_type = cos_type;
	}
	public String getIng() {
		return ing;
	}
	public void setIng(String ing) {
		this.ing = ing;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getLike_count() {
		return like_count;
	}
	public void setLike_count(String like_count) {
		this.like_count = like_count;
	}
	public String getReg_no() {
		return reg_no;
	}
	public void setReg_no(String reg_no) {
		this.reg_no = reg_no;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getChg_no() {
		return chg_no;
	}
	public void setChg_no(String chg_no) {
		this.chg_no = chg_no;
	}
	public String getChg_dt() {
		return chg_dt;
	}
	public void setChg_dt(String chg_dt) {
		this.chg_dt = chg_dt;
	}
	
	
}
