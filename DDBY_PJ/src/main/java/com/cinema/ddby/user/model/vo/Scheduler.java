package com.cinema.ddby.user.model.vo;


public class Scheduler {
    private int ms_no;
    private String ms_title;
    private String ms_showtime;
    private int ms_theater;
    
	public Scheduler(int ms_no, String ms_title, String ms_showtime, int ms_theater) {
		super();
		this.ms_no = ms_no;
		this.ms_title = ms_title;
		this.ms_showtime = ms_showtime;
		this.ms_theater = ms_theater;
	}

	public Scheduler() {
		super();
	}

	public int getMs_no() {
		return ms_no;
	}

	public void setMs_no(int ms_no) {
		this.ms_no = ms_no;
	}

	public String getMs_title() {
		return ms_title;
	}

	public void setMs_title(String ms_title) {
		this.ms_title = ms_title;
	}

	public String getMs_showtime() {
		return ms_showtime;
	}

	public void setMs_showtime(String ms_showtime) {
		this.ms_showtime = ms_showtime;
	}

	public int getMs_theater() {
		return ms_theater;
	}

	public void setMs_theater(int ms_theater) {
		this.ms_theater = ms_theater;
	}

	@Override
	public String toString() {
		return "Scheduler [ms_no=" + ms_no + ", ms_title=" + ms_title + ", ms_showtime=" + ms_showtime + ", ms_theater="
				+ ms_theater + "]";
	}
    
}
