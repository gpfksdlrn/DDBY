package com.cinema.ddby.user.model.vo;

import java.sql.Date;

public class DIARY {
    private int dia_no;
    private String dia_email;
    private Date dia_date;
    private String dia_couple;
    private String dia_content;
    
    
	public DIARY() {
		super();
	}
    
	public DIARY(int dia_no, String dia_email, Date dia_date, String dia_couple, String dia_content) {
		super();
		this.dia_no = dia_no;
		this.dia_email = dia_email;
		this.dia_date = dia_date;
		this.dia_couple = dia_couple;
		this.dia_content = dia_content;
	}

	public int getDia_no() {
		return dia_no;
	}

	public void setDia_no(int dia_no) {
		this.dia_no = dia_no;
	}

	public String getDia_email() {
		return dia_email;
	}

	public void setDia_email(String dia_email) {
		this.dia_email = dia_email;
	}

	public Date getDia_date() {
		return dia_date;
	}

	public void setDia_date(Date dia_date) {
		this.dia_date = dia_date;
	}

	public String getDia_couple() {
		return dia_couple;
	}

	public void setDia_couple(String dia_couple) {
		this.dia_couple = dia_couple;
	}

	public String getDia_content() {
		return dia_content;
	}

	public void setDia_content(String dia_content) {
		this.dia_content = dia_content;
	}

	@Override
	public String toString() {
		return "DIARY [dia_no=" + dia_no + ", dia_email=" + dia_email + ", dia_date=" + dia_date + ", dia_couple="
				+ dia_couple + ", dia_content=" + dia_content + "]";
	}
    
    
}
