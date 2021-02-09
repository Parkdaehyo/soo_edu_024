package com.soo.projectboard;

import java.util.Date;

public class Soo_projectBoardVO {
	
	private int board_seq;
	private String board_content_text;
	private String board_title;
	private String board_writer_name;
	private Date board_reg_date;
	private Date board_mod_date;
	private String board_notice;
	private String board_img_path;
	private String board_del_yn;
	private int board_type;
	private String board_writer_pass;
	private String imageFileName;
	
	
	public int getBoard_seq() {
		return board_seq;
	}


	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}





	public String getBoard_content_text() {
		return board_content_text;
	}





	public void setBoard_content_text(String board_content_text) {
		this.board_content_text = board_content_text;
	}





	public String getBoard_title() {
		return board_title;
	}





	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}






	public String getBoard_writer_name() {
		return board_writer_name;
	}


	public void setBoard_writer_name(String board_writer_name) {
		this.board_writer_name = board_writer_name;
	}


	public Date getBoard_reg_date() {
		return board_reg_date;
	}





	public void setBoard_reg_date(Date board_reg_date) {
		this.board_reg_date = board_reg_date;
	}





	public Date getBoard_mod_date() {
		return board_mod_date;
	}





	public void setBoard_mod_date(Date board_mod_date) {
		this.board_mod_date = board_mod_date;
	}





	public String getBoard_notice() {
		return board_notice;
	}





	public void setBoard_notice(String board_notice) {
		this.board_notice = board_notice;
	}





	public String getBoard_img_path() {
		return board_img_path;
	}





	public void setBoard_img_path(String board_img_path) {
		this.board_img_path = board_img_path;
	}





	public String getBoard_del_yn() {
		return board_del_yn;
	}





	public void setBoard_del_yn(String board_del_yn) {
		this.board_del_yn = board_del_yn;
	}





	public int getBoard_type() {
		return board_type;
	}





	public void setBoard_type(int board_type) {
		this.board_type = board_type;
	}





	public String getBoard_writer_pass() {
		return board_writer_pass;
	}





	public void setBoard_writer_pass(String board_writer_pass) {
		this.board_writer_pass = board_writer_pass;
	}


	public String getImageFileName() {
		return imageFileName;
	}


	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}


	@Override
	public String toString() {
		return "Soo_projectBoardVO [board_seq=" + board_seq + ", board_content_text=" + board_content_text
				+ ", board_title=" + board_title + ", board_write_name=" + board_writer_name + ", board_reg_date="
				+ board_reg_date + ", board_mod_date=" + board_mod_date + ", board_notice=" + board_notice
				+ ", board_img_path=" + board_img_path + ", board_del_yn=" + board_del_yn + ", board_type=" + board_type
				+ ", board_writer_pass=" + board_writer_pass + ", imageFileName=" + imageFileName + "]";
	}


	


	
	
	
	
}


