package com.cinema.ddby.user.model.vo;

import java.sql.Date;

public class Coupon {
	private String user_email;
	private int coupon_num;
	private Date coupon_date;
	private String coupon_title;
	private String coupon_used;
	
	public Coupon() {
		super();
	}

	public Coupon(String user_email, int coupon_num, Date coupon_date, String coupon_title, String coupon_used) {
		super();
		this.user_email = user_email;
		this.coupon_num = coupon_num;
		this.coupon_date = coupon_date;
		this.coupon_title = coupon_title;
		this.coupon_used = coupon_used;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public int getCoupon_num() {
		return coupon_num;
	}

	public void setCoupon_num(int coupon_num) {
		this.coupon_num = coupon_num;
	}

	public Date getCoupon_date() {
		return coupon_date;
	}

	public void setCoupon_date(Date coupon_date) {
		this.coupon_date = coupon_date;
	}

	public String getCoupon_title() {
		return coupon_title;
	}

	public void setCoupon_title(String coupon_title) {
		this.coupon_title = coupon_title;
	}

	public String getCoupon_used() {
		return coupon_used;
	}

	public void setCoupon_used(String coupon_used) {
		this.coupon_used = coupon_used;
	}

	@Override
	public String toString() {
		return "Coupon [user_email=" + user_email + ", coupon_num=" + coupon_num + ", coupon_date=" + coupon_date
				+ ", coupon_title=" + coupon_title + ", coupon_used=" + coupon_used + "]";
	}
}
