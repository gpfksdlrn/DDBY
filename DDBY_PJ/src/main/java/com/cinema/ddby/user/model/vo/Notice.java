package com.cinema.ddby.user.model.vo;

import java.sql.Date;

public class Notice {
	private int notice_no;
	private String notice_title;
	private String notice_content;
	private Date notice_date;
	private int notice_count;
	
	public Notice() {
		super();
	}
	
	public Notice(int notice_no, String notice_title, String notice_content, Date notice_date, int notice_count) {
		super();
		this.notice_no = notice_no;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
		this.notice_count = notice_count;
	}
	
	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public Date getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}

	public int getNotice_count() {
		return notice_count;
	}

	public void setNotice_count(int notice_count) {
		this.notice_count = notice_count;
	}

	@Override
	public String toString() {
		return "Notice [notice_no=" + notice_no + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", notice_date=" + notice_date + ", notice_count=" + notice_count + "]";
	}

}
