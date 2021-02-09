package com.soo.projectuser;

import java.util.Date;

public class Soo_projectUserVO {
	
	
	private int soo_user_seq;
	private String soo_user_name;
	private String soo_user_password;
	private String soo_user_birth;
	private String soo_user_phone;
	private String soo_user_zipcode;
	private String soo_user_addr1;
	private String soo_user_addr2;
	private String soo_user_mail;
	private String soo_user_nick;
	private int soo_user_type;
	private String roadAddress;
	private String jibunAddress;
	private Date accessTime;
	
	
	public int getSoo_user_seq() {
		return soo_user_seq;
	}
	public void setSoo_user_seq(int soo_user_seq) {
		this.soo_user_seq = soo_user_seq;
	}
	public String getSoo_user_name() {
		return soo_user_name;
	}
	public void setSoo_user_name(String soo_user_name) {
		this.soo_user_name = soo_user_name;
	}
	public String getSoo_user_password() {
		return soo_user_password;
	}
	public void setSoo_user_password(String soo_user_password) {
		this.soo_user_password = soo_user_password;
	}
	public String getSoo_user_birth() {
		return soo_user_birth;
	}
	public void setSoo_user_birth(String soo_user_birth) {
		this.soo_user_birth = soo_user_birth;
	}
	public String getSoo_user_phone() {
		return soo_user_phone;
	}
	public void setSoo_user_phone(String soo_user_phone) {
		this.soo_user_phone = soo_user_phone;
	}
	public String getSoo_user_zipcode() {
		return soo_user_zipcode;
	}
	public void setSoo_user_zipcode(String soo_user_zipcode) {
		this.soo_user_zipcode = soo_user_zipcode;
	}
	public String getSoo_user_addr1() {
		return soo_user_addr1;
	}
	public void setSoo_user_addr1(String soo_user_addr1) {
		this.soo_user_addr1 = soo_user_addr1;
	}
	public String getSoo_user_addr2() {
		return soo_user_addr2;
	}
	public void setSoo_user_addr2(String soo_user_addr2) {
		this.soo_user_addr2 = soo_user_addr2;
	}
	public String getSoo_user_mail() {
		return soo_user_mail;
	}
	public void setSoo_user_mail(String soo_user_mail) {
		this.soo_user_mail = soo_user_mail;
	}
	public String getSoo_user_nick() {
		return soo_user_nick;
	}
	public void setSoo_user_nick(String soo_user_nick) {
		this.soo_user_nick = soo_user_nick;
	}
	public int getSoo_user_type() {
		return soo_user_type;
	}
	public void setSoo_user_type(int soo_user_type) {
		this.soo_user_type = soo_user_type;
	}
	public Date getAccessTime() {
		return accessTime;
	}
	public void setAccessTime(Date accessTime) {
		
		Date date = new Date();
		
		
		this.accessTime = date;
	}
	public String getRoadAddress() {
		return roadAddress;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}
	public String getJibunAddress() {
		return jibunAddress;
	}
	public void setJibunAddress(String jibunAddress) {
		this.jibunAddress = jibunAddress;
	}
	@Override
	public String toString() {
		return "Soo_projectUserVO [soo_user_seq=" + soo_user_seq + ", soo_user_name=" + soo_user_name
				+ ", soo_user_password=" + soo_user_password + ", soo_user_birth=" + soo_user_birth
				+ ", soo_user_phone=" + soo_user_phone + ", soo_user_zipcode=" + soo_user_zipcode + ", soo_user_addr1="
				+ soo_user_addr1 + ", soo_user_addr2=" + soo_user_addr2 + ", soo_user_mail=" + soo_user_mail
				+ ", soo_user_nick=" + soo_user_nick + ", soo_user_type=" + soo_user_type + ", roadAddress="
				+ roadAddress + ", jibunAddress=" + jibunAddress + ", accessTime=" + accessTime + "]";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*private int num;

	private int ftp_user_seq;
	
	//	user이름
	private String ftp_user_name;
	
	//	user 생년월일
	private String ftp_user_birth;
	
	//	user 핸드폰번호
	private String ftp_user_phone;
	
	//	user 우편번호
	private String ftp_user_zipcode;
	
	//	user 주소1
	private String ftp_user_addr1;
	
	//	user 주소2
	private String ftp_user_addr2;
	
	//	user 이메일
	private String ftp_user_mail;

	public String getFtp_user_name() {
		return ftp_user_name;
	}

	public void setFtp_user_name(String ftp_user_name) {
		this.ftp_user_name = ftp_user_name;
	}

	public String getFtp_user_birth() {
		return ftp_user_birth;
	}

	public void setFtp_user_birth(String ftp_user_birth) {
		this.ftp_user_birth = ftp_user_birth;
	}

	public String getFtp_user_phone() {
		return ftp_user_phone;
	}

	public void setFtp_user_phone(String ftp_user_phone) {
		this.ftp_user_phone = ftp_user_phone;
	}

	public String getFtp_user_zipcode() {
		return ftp_user_zipcode;
	}

	public void setFtp_user_zipcode(String ftp_user_zipcode) {
		this.ftp_user_zipcode = ftp_user_zipcode;
	}

	public String getFtp_user_addr1() {
		return ftp_user_addr1;
	}

	public void setFtp_user_addr1(String ftp_user_addr1) {
		this.ftp_user_addr1 = ftp_user_addr1;
	}

	public String getFtp_user_addr2() {
		return ftp_user_addr2;
	}

	public void setFtp_user_addr2(String ftp_user_addr2) {
		this.ftp_user_addr2 = ftp_user_addr2;
	}

	public String getFtp_user_mail() {
		return ftp_user_mail;
	}

	public void setFtp_user_mail(String ftp_user_mail) {
		this.ftp_user_mail = ftp_user_mail;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getFtp_user_seq() {
		return ftp_user_seq;
	}

	public void setFtp_user_seq(int ftp_user_seq) {
		this.ftp_user_seq = ftp_user_seq;
	}

*/
	
		
}
