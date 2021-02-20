package com.cinema.ddby.user.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.ddby.user.model.dao.ManagerDao;
import com.cinema.ddby.user.model.vo.Coupon;
import com.cinema.ddby.user.model.vo.Event;
import com.cinema.ddby.user.model.vo.Movie;
import com.cinema.ddby.user.model.vo.Notice;
import com.cinema.ddby.user.model.vo.PageInfo;
import com.cinema.ddby.user.model.vo.User;

@Service("mService")
public class ManagerServiceImpl implements ManagerService{

	@Autowired
	ManagerDao mDao;
	
	// 이벤트 등록
	@Override
	public int inputEvent(Event e) {
		return mDao.inputEvent(e);
	}

	// 이벤트 리스트
	@Override
	public ArrayList<Event> eventList(PageInfo pi) {
		return mDao.eventList(pi);
	}

	@Override
	public Event eventDetail(int no) {
		return mDao.eventDetail(no);
	}

	@Override
	public int updateEvent(Event e) {
		return mDao.updateEvent(e);
	}

	@Override
	public int deleteEvent(int no) {
		return mDao.deleteEvent(no);
	}

	@Override
	public int getEventCount() {
		return mDao.getEventCount();
	}

	@Override
	public int couponIssue(HashMap<String, String> map) {
		return mDao.couponIssue(map);
	}

	@Override
	public int couponCount(String email) {
		return mDao.couponCount(email);
	}

	@Override
	public int couponCheck(HashMap<String, String> map) {
		return mDao.couponCheck(map);
	}

	@Override
	public ArrayList<Event> getEvent() {
		return mDao.getEvent();
	}

	@Override
	public ArrayList<Movie> getMovie() {
		return mDao.getMovie();
	}

	// 영화 상세보기
	@Override
	public Movie movieDetail(String title) {
		return mDao.movieDetail(title);
	}

	@Override
	public ArrayList<String> getStillimg(String title) {
		return mDao.getStillimg(title);
	}

	@Override
	public int getMovieCount() {
		return mDao.getMovieCount();
	}

	@Override
	public ArrayList<Movie> getMovies(PageInfo pi) {
		return mDao.getMovies(pi);
	}

	@Override
	public int getTrailerCount() {
		return mDao.getTrailerCount();
	}

	@Override
	public ArrayList<Movie> getTrailers(PageInfo pi) {
		return mDao.getTrailers(pi);
	}

	@Override
	public int getWishCount(HashMap<String, String> map) {
		return mDao.getWishCount(map);
	}
	
	@Override
	public int findMovieCount(String searchText) {
		return mDao.findMovieCount(searchText);
	}

	@Override
	public ArrayList<Movie> findMovie(String searchText, PageInfo pi) {
		return mDao.findMovie(searchText, pi);
	}

	@Override
	public int writeNotice(HashMap<String, String> map) {
		return mDao.writeNotice(map);
	}

	@Override
	public ArrayList<Notice> getNoticeList(PageInfo pi) {
		return mDao.getNoticeList(pi);
	}

	@Override
	public int findNoticeCount() {
		return mDao.findNoticeCount();
	}

	@Override
	public Notice getNotice(int notice_no) {
		return mDao.getNotice(notice_no);
	}

	@Override
	public int nViewCountUp(int notice_no) {
		return mDao.nViewCountUp(notice_no);
	}

	@Override
	public int noticeUpdate(HashMap<String, String> map) {
		return mDao.noticeUpdate(map);
	}

	@Override
	public int noticeDelete(int no) {
		return mDao.noticeDelete(no);
	}

	@Override
	public ArrayList<Notice> notice() {
		return mDao.notice();
	}

	@Override
	public ArrayList<Movie> getMovieRank(PageInfo pi) {
		return mDao.getMovieRank(pi);
	}


}
