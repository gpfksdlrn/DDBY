package com.cinema.ddby.user.model.vo;

import java.sql.Date;

public class Movie {
	private String movie_title;
	private String movie_title_eng;
	private String movie_director;
	private String movie_poster;
	private String movie_actor;
	private Date movie_release_date;
	private String movie_tem;
	private int movie_running_time;
	private int movie_age;
	private String movie_country;
	private String movie_story;
	private String movie_big_img;
	private String movie_headline;
	private String movie_youtube;
	private int movie_guestcount;
	
	public Movie() {
		super();
	}

	

	public Movie(String movie_title, String movie_title_eng, String movie_director, String movie_poster,
			String movie_actor, Date movie_release_date, String movie_tem, int movie_running_time, int movie_age,
			String movie_country, String movie_story, String movie_big_img, String movie_headline, String movie_youtube,
			int movie_guestcount) {
		super();
		this.movie_title = movie_title;
		this.movie_title_eng = movie_title_eng;
		this.movie_director = movie_director;
		this.movie_poster = movie_poster;
		this.movie_actor = movie_actor;
		this.movie_release_date = movie_release_date;
		this.movie_tem = movie_tem;
		this.movie_running_time = movie_running_time;
		this.movie_age = movie_age;
		this.movie_country = movie_country;
		this.movie_story = movie_story;
		this.movie_big_img = movie_big_img;
		this.movie_headline = movie_headline;
		this.movie_youtube = movie_youtube;
		this.movie_guestcount = movie_guestcount;
	}



	public String getMovie_title() {
		return movie_title;
	}

	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}

	public String getMovie_title_eng() {
		return movie_title_eng;
	}

	public void setMovie_title_eng(String movie_title_eng) {
		this.movie_title_eng = movie_title_eng;
	}

	public String getMovie_director() {
		return movie_director;
	}

	public void setMovie_director(String movie_director) {
		this.movie_director = movie_director;
	}

	public String getMovie_poster() {
		return movie_poster;
	}

	public void setMovie_poster(String movie_poster) {
		this.movie_poster = movie_poster;
	}

	public String getMovie_actor() {
		return movie_actor;
	}

	public void setMovie_actor(String movie_actor) {
		this.movie_actor = movie_actor;
	}

	public Date getMovie_release_date() {
		return movie_release_date;
	}

	public void setMovie_release_date(Date movie_release_date) {
		this.movie_release_date = movie_release_date;
	}

	public String getMovie_tem() {
		return movie_tem;
	}

	public void setMovie_tem(String movie_tem) {
		this.movie_tem = movie_tem;
	}

	public int getMovie_running_time() {
		return movie_running_time;
	}

	public void setMovie_running_time(int movie_running_time) {
		this.movie_running_time = movie_running_time;
	}

	public int getMovie_age() {
		return movie_age;
	}

	public void setMovie_age(int movie_age) {
		this.movie_age = movie_age;
	}

	public String getMovie_country() {
		return movie_country;
	}

	public void setMovie_country(String movie_country) {
		this.movie_country = movie_country;
	}

	public String getMovie_story() {
		return movie_story;
	}

	public void setMovie_story(String movie_story) {
		this.movie_story = movie_story;
	}

	public String getMovie_big_img() {
		return movie_big_img;
	}

	public void setMovie_big_img(String movie_big_img) {
		this.movie_big_img = movie_big_img;
	}

	public String getMovie_headline() {
		return movie_headline;
	}

	public void setMovie_headline(String movie_headline) {
		this.movie_headline = movie_headline;
	}

	public String getMovie_youtube() {
		return movie_youtube;
	}

	public void setMovie_youtube(String movie_youtube) {
		this.movie_youtube = movie_youtube;
	}
	
	public int getMovie_guestcount() {
		return movie_guestcount;
	}

	public void setMovie_guestcount(int movie_guestcount) {
		this.movie_guestcount = movie_guestcount;
	}

	@Override
	public String toString() {
		return "Movie [movie_title=" + movie_title + ", movie_title_eng=" + movie_title_eng + ", movie_director="
				+ movie_director + ", movie_poster=" + movie_poster + ", movie_actor=" + movie_actor
				+ ", movie_release_date=" + movie_release_date + ", movie_tem=" + movie_tem + ", movie_running_time="
				+ movie_running_time + ", movie_age=" + movie_age + ", movie_country=" + movie_country
				+ ", movie_story=" + movie_story + ", movie_big_img=" + movie_big_img + ", movie_headline="
				+ movie_headline + ", movie_youtube=" + movie_youtube + ", movie_guestcount=" + movie_guestcount + "]";
	}


}
