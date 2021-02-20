package com.cinema.ddby.user.model.vo;

import java.sql.Date;

public class User {
	private String user_name;
	private String user_email;
	private String user_password;
	private String user_nickname;
	private String user_img;
	private String user_re_img;
	private String user_marketing;
	private String user_status;
	private int user_point;
	private int user_coupon;
	private Date user_enrolldate;
	
	public User() {
		super();
	}

	public User(String user_name, String user_email, String user_password, String user_nickname, String user_img,
			String user_re_img, String user_marketing, String user_status, int user_point, int user_coupon,
			Date user_enrolldate) {
		super();
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_password = user_password;
		this.user_nickname = user_nickname;
		this.user_img = user_img;
		this.user_re_img = user_re_img;
		this.user_marketing = user_marketing;
		this.user_status = user_status;
		this.user_point = user_point;
		this.user_coupon = user_coupon;
		this.user_enrolldate = user_enrolldate;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getUser_img() {
		return user_img;
	}

	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}

	public String getUser_re_img() {
		return user_re_img;
	}

	public void setUser_re_img(String user_re_img) {
		this.user_re_img = user_re_img;
	}

	public String getUser_marketing() {
		return user_marketing;
	}

	public void setUser_marketing(String user_marketing) {
		this.user_marketing = user_marketing;
	}

	public String getUser_status() {
		return user_status;
	}

	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}

	public int getUser_point() {
		return user_point;
	}

	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}

	public int getUser_coupon() {
		return user_coupon;
	}

	public void setUser_coupon(int user_coupon) {
		this.user_coupon = user_coupon;
	}

	public Date getUser_enrolldate() {
		return user_enrolldate;
	}

	public void setUser_enrolldate(Date user_enrolldate) {
		this.user_enrolldate = user_enrolldate;
	}

	@Override
	public String toString() {
		return "User [user_name=" + user_name + ", user_email=" + user_email + ", user_password=" + user_password
				+ ", user_nickname=" + user_nickname + ", user_img=" + user_img + ", user_re_img=" + user_re_img
				+ ", user_marketing=" + user_marketing + ", user_status=" + user_status + ", user_point=" + user_point
				+ ", user_coupon=" + user_coupon + ", user_enrolldate=" + user_enrolldate + "]";
	}
	
	
}