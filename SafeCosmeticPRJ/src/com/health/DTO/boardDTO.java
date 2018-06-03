package com.health.DTO;

import org.springframework.web.multipart.MultipartFile;

public class boardDTO {
	String bo_no;
	String title;
	String content;
	String cnt;
	String reg_no;
	String reg_dt;
	String chg_no;
	String chg_dt;
	String img_path;
	String img_name;
	String ori_img_name;
	String thumb_name;
	String thumb_path;
	MultipartFile upfile;
	public MultipartFile getUpfile(){
		return upfile;
	}
	public void setUpfile(MultipartFile upfile){
		this.upfile = upfile;
	}	
	public String getBo_no() {
		return bo_no;
	}
	public void setBo_no(String bo_no) {
		this.bo_no = bo_no;
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
	public String getImg_name() {
		return img_name;
	}
	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
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
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	public String getOri_img_name() {
		return ori_img_name;
	}
	public void setOri_img_name(String ori_img_name) {
		this.ori_img_name = ori_img_name;
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
	
}
