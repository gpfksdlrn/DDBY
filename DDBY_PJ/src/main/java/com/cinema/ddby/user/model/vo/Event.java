package com.cinema.ddby.user.model.vo;

import java.sql.Date;

public class Event {
	private int event_num;
	private String event_title;
	private String event_content;
	private Date event_date;
	private String event_b_img;
	private String event_s_img;
	private String event_re_b_img;
	private String event_re_s_img;
	
	public Event() {
		super();
	}

	
	public Event(int event_num, String event_title, String event_content, Date event_date, String event_b_img,
			String event_s_img, String event_re_b_img, String event_re_s_img) {
		super();
		this.event_num = event_num;
		this.event_title = event_title;
		this.event_content = event_content;
		this.event_date = event_date;
		this.event_b_img = event_b_img;
		this.event_s_img = event_s_img;
		this.event_re_b_img = event_re_b_img;
		this.event_re_s_img = event_re_s_img;
	}

	
	public int getEvent_num() {
		return event_num;
	}

	public void setEvent_num(int event_num) {
		this.event_num = event_num;
	}

	public String getEvent_title() {
		return event_title;
	}

	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}

	public String getEvent_content() {
		return event_content;
	}

	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}

	public Date getEvent_date() {
		return event_date;
	}

	public void setEvent_date(Date event_date) {
		this.event_date = event_date;
	}

	public String getEvent_b_img() {
		return event_b_img;
	}

	public void setEvent_b_img(String event_b_img) {
		this.event_b_img = event_b_img;
	}

	public String getEvent_s_img() {
		return event_s_img;
	}

	public void setEvent_s_img(String event_s_img) {
		this.event_s_img = event_s_img;
	}


	public String getEvent_re_b_img() {
		return event_re_b_img;
	}


	public void setEvent_re_b_img(String event_re_b_img) {
		this.event_re_b_img = event_re_b_img;
	}


	public String getEvent_re_s_img() {
		return event_re_s_img;
	}


	public void setEvent_re_s_img(String event_re_s_img) {
		this.event_re_s_img = event_re_s_img;
	}


	@Override
	public String toString() {
		return "Event [event_num=" + event_num + ", event_title=" + event_title + ", event_content=" + event_content
				+ ", event_date=" + event_date + ", event_b_img=" + event_b_img + ", event_s_img=" + event_s_img
				+ ", event_re_b_img=" + event_re_b_img + ", event_re_s_img=" + event_re_s_img + "]";
	}

	

	
}
