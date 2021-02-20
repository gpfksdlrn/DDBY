package com.cinema.ddby.user.model.vo;

import java.sql.Date;

public class PointList {
	private String user_email;
	private int point_no;
	private int pl_point;
	private Date iss_date;
	private String point_used;
	
	public PointList() {
		super();
	}

	
	public PointList(String user_email, int point_no, int pl_point, Date iss_date, String point_used) {
		super();
		this.user_email = user_email;
		this.point_no = point_no;
		this.pl_point = pl_point;
		this.iss_date = iss_date;
		this.point_used = point_used;
	}


	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public int getPoint_no() {
		return point_no;
	}

	public void setPoint_no(int point_no) {
		this.point_no = point_no;
	}

	public int getPl_point() {
		return pl_point;
	}

	public void setPl_point(int pl_point) {
		this.pl_point = pl_point;
	}

	public Date getIss_date() {
		return iss_date;
	}

	public void setIss_date(Date iss_date) {
		this.iss_date = iss_date;
	}

	public String getPoint_used() {
		return point_used;
	}

	public void setPoint_used(String point_used) {
		this.point_used = point_used;
	}

	@Override
	public String toString() {
		return "PointList [user_email=" + user_email + ", point_no=" + point_no + ", pl_point=" + pl_point
				+ ", iss_date=" + iss_date + ", point_used=" + point_used + "]";
	}


}
