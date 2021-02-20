package com.cinema.ddby.user.model.vo;

import java.sql.Date;

public class BuyList {
    
    private int buy_no;
    private String user_email;
    private Date buy_date;
    private int reservation_no;
    private String movie_title;
    private int pay_money;
    private String pay_way;
    private String refund;
    private String seat_no;
    private int theater;
    private String showtime;
    private int buy_person;
    private int ms_no;
    private String watching;
    private String diary_write;
    
	public BuyList() {
		super();
	}
	
	public BuyList(int buy_no, String user_email, Date buy_date, int reservation_no, String movie_title, int pay_money,
			String pay_way, String refund, String seat_no, int theater, String showtime, int buy_person, int ms_no,
			String watching, String diary_write) {
		super();
		this.buy_no = buy_no;
		this.user_email = user_email;
		this.buy_date = buy_date;
		this.reservation_no = reservation_no;
		this.movie_title = movie_title;
		this.pay_money = pay_money;
		this.pay_way = pay_way;
		this.refund = refund;
		this.seat_no = seat_no;
		this.theater = theater;
		this.showtime = showtime;
		this.buy_person = buy_person;
		this.ms_no = ms_no;
		this.watching = watching;
		this.diary_write = diary_write;
	}


	public int getBuy_no() {
		return buy_no;
	}
	public void setBuy_no(int buy_no) {
		this.buy_no = buy_no;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public Date getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(Date buy_date) {
		this.buy_date = buy_date;
	}
	public int getReservation_no() {
		return reservation_no;
	}
	public void setReservation_no(int reservation_no) {
		this.reservation_no = reservation_no;
	}
	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	public int getPay_money() {
		return pay_money;
	}
	public void setPay_money(int pay_money) {
		this.pay_money = pay_money;
	}
	public String getPay_way() {
		return pay_way;
	}
	public void setPay_way(String pay_way) {
		this.pay_way = pay_way;
	}
	public String getRefund() {
		return refund;
	}
	public void setRefund(String refund) {
		this.refund = refund;
	}
	public String getSeat_no() {
		return seat_no;
	}
	public void setSeat_no(String seat_no) {
		this.seat_no = seat_no;
	}
	public int getTheater() {
		return theater;
	}
	public void setTheater(int theater) {
		this.theater = theater;
	}
	public String getShowtime() {
		return showtime;
	}
	public void setShowtime(String showtime) {
		this.showtime = showtime;
	}
	public int getBuy_person() {
		return buy_person;
	}
	public void setBuy_person(int buy_person) {
		this.buy_person = buy_person;
	}
	public int getMs_no() {
		return ms_no;
	}
	public void setMs_no(int ms_no) {
		this.ms_no = ms_no;
	}	
	public String getWatching() {
		return watching;
	}
	public void setWatching(String watching) {
		this.watching = watching;
	}
	public String getDiary_write() {
		return diary_write;
	}
	public void setDiary_write(String diary_write) {
		this.diary_write = diary_write;
	}


	@Override
	public String toString() {
		return "BuyList [buy_no=" + buy_no + ", user_email=" + user_email + ", buy_date=" + buy_date
				+ ", reservation_no=" + reservation_no + ", movie_title=" + movie_title + ", pay_money=" + pay_money
				+ ", pay_way=" + pay_way + ", refund=" + refund + ", seat_no=" + seat_no + ", theater=" + theater
				+ ", showtime=" + showtime + ", buy_person=" + buy_person + ", ms_no=" + ms_no + ", watching="
				+ watching + "]";
	}



	
    
}
