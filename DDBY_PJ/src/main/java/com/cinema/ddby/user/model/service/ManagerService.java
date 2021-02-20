package com.cinema.ddby.user.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.cinema.ddby.user.model.vo.Coupon;
import com.cinema.ddby.user.model.vo.Event;
import com.cinema.ddby.user.model.vo.Movie;
import com.cinema.ddby.user.model.vo.Notice;
import com.cinema.ddby.user.model.vo.PageInfo;
import com.cinema.ddby.user.model.vo.User;

public interface ManagerService {

	int inputEvent(Event e);

	ArrayList<Event> eventList(PageInfo pi);

	Event eventDetail(int no);

	int updateEvent(Event e);

	int deleteEvent(int no);

	int getEventCount();

	int couponIssue(HashMap<String, String> map);

	int couponCount(String email);

	int couponCheck(HashMap<String, String> map);

	ArrayList<Event> getEvent();

	ArrayList<Movie> getMovie();

	Movie movieDetail(String title);

	ArrayList<String> getStillimg(String title);

	int getMovieCount();

	ArrayList<Movie> getMovies(PageInfo pi);

	int getTrailerCount();

	ArrayList<Movie> getTrailers(PageInfo pi);

	int getWishCount(HashMap<String, String> map);

	int findMovieCount(String searchText);
	
	ArrayList<Movie> findMovie(String searchText, PageInfo pi);

	int writeNotice(HashMap<String, String> map);

	ArrayList<Notice> getNoticeList(PageInfo pi);

	int findNoticeCount();

	Notice getNotice(int notice_no);

	int nViewCountUp(int notice_no);

	int noticeUpdate(HashMap<String, String> map);

	int noticeDelete(int no);

	ArrayList<Notice> notice();

	ArrayList<Movie> getMovieRank(PageInfo pi);

}
