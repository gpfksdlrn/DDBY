package com.cinema.ddby.user.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cinema.ddby.user.model.vo.Coupon;
import com.cinema.ddby.user.model.vo.Event;
import com.cinema.ddby.user.model.vo.Movie;
import com.cinema.ddby.user.model.vo.Notice;
import com.cinema.ddby.user.model.vo.PageInfo;
import com.cinema.ddby.user.model.vo.User;

@Repository("mDao")
public class ManagerDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	public int inputEvent(Event e) {
		return sqlSession.insert("managerMapper.inputEvent",e);
	}

	public ArrayList<Event> eventList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("managerMapper.eventList",null,rowBounds);
	}

	public Event eventDetail(int no) {
		return sqlSession.selectOne("managerMapper.eventDetail",no);
	}

	public int updateEvent(Event e) {
		return sqlSession.update("managerMapper.updateEvent",e);
	}

	public int deleteEvent(int no) {
		return sqlSession.delete("managerMapper.deleteEvent",no);
	}

	public int getEventCount() {
		return sqlSession.selectOne("managerMapper.getEventCount");
	}

	public int couponIssue(HashMap<String, String> map) {
		System.out.println(map);
		return sqlSession.insert("managerMapper.couponIssue",map);
	}

	public int couponCount(String email) {
		return sqlSession.update("managerMapper.couponCount",email);
	}

	public int couponCheck(HashMap<String, String> map) {
		return sqlSession.selectOne("managerMapper.couponCheck",map);
	}

	public ArrayList<Event> getEvent() {
		return (ArrayList)sqlSession.selectList("managerMapper.getEvent");
	}

	public ArrayList<Movie> getMovie() {
		return (ArrayList)sqlSession.selectList("managerMapper.getMovie");
	}

	public Movie movieDetail(String title) {
		return sqlSession.selectOne("managerMapper.movieDetail", title);
	}

	public ArrayList<String> getStillimg(String title) {
		return (ArrayList)sqlSession.selectList("managerMapper.getStillimg",title);
	}

	public int getMovieCount() {
		return sqlSession.selectOne("managerMapper.getMovieCount");
	}

	public ArrayList<Movie> getMovies(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		//rowBounds 는 마이바티스에서 페이징 처리를 위한 클래스이다.
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		//보내는 매개변수가 없을 시 null을 써준다.
		return (ArrayList)sqlSession.selectList("managerMapper.getMovies",null,rowBounds);
	}

	public int getTrailerCount() {
		return sqlSession.selectOne("managerMapper.getTrailerCount");
	}

	public ArrayList<Movie> getTrailers(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		//rowBounds 는 마이바티스에서 페이징 처리를 위한 클래스이다.
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		//보내는 매개변수가 없을 시 null을 써준다.
		return (ArrayList)sqlSession.selectList("managerMapper.getTrailers",null,rowBounds);
	}

	public int getWishCount(HashMap<String, String> map) {
		return sqlSession.selectOne("managerMapper.getWishCount",map);
	}

	public int findMovieCount(String searchText) {
		return sqlSession.selectOne("managerMapper.findMovieCount", searchText);
	}

	public ArrayList<Movie> findMovie(String searchText, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		//rowBounds 는 마이바티스에서 페이징 처리를 위한 클래스이다.
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		//보내는 매개변수가 없을 시 null을 써준다.
		return (ArrayList)sqlSession.selectList("managerMapper.findMovie",searchText,rowBounds);
	}

	public int writeNotice(HashMap<String, String> map) {
		return sqlSession.insert("managerMapper.writeNotice",map);
	}

	public ArrayList<Notice> getNoticeList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		//rowBounds 는 마이바티스에서 페이징 처리를 위한 클래스이다.
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		//보내는 매개변수가 없을 시 null을 써준다.
		return (ArrayList)sqlSession.selectList("managerMapper.getNoticeList",null,rowBounds);
	}

	public int findNoticeCount() {
		return sqlSession.selectOne("managerMapper.findNoticeCount");
	}

	public Notice getNotice(int notice_no) {
		return sqlSession.selectOne("managerMapper.getNotice",notice_no);
	}

	public int nViewCountUp(int notice_no) {
		return sqlSession.update("managerMapper.nViewCountUp",notice_no);
	}

	public int noticeUpdate(HashMap<String, String> map) {
		return sqlSession.update("managerMapper.noticeUpdate",map);
	}

	public int noticeDelete(int no) {
		return sqlSession.delete("managerMapper.noticeDelete",no);
	}

	public ArrayList<Notice> notice() {
		return (ArrayList)sqlSession.selectList("managerMapper.getNoticeList");
	}

	public ArrayList<Movie> getMovieRank(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		//rowBounds 는 마이바티스에서 페이징 처리를 위한 클래스이다.
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		//보내는 매개변수가 없을 시 null을 써준다.
		return (ArrayList)sqlSession.selectList("managerMapper.getMovieRank",null,rowBounds);
	}
}
