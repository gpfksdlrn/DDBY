package com.cinema.ddby.user.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cinema.ddby.user.model.vo.Coupon;
import com.cinema.ddby.user.model.vo.Movie;
import com.cinema.ddby.user.model.vo.Scheduler;
import com.cinema.ddby.user.model.vo.User;

@Repository("rDao")
public class ReservationDao {

	
	@Autowired
	SqlSessionTemplate sqlSession;

	public ArrayList<Scheduler> getScheduler(String Tday) {
		return (ArrayList)sqlSession.selectList("reservationMapper.getScheduler",Tday);
	}

	public ArrayList<Scheduler> getTitleScheduler(HashMap<String, String> map) {
		return (ArrayList)sqlSession.selectList("reservationMapper.getTitleScheduler",map);
	}

	public int getMovieage(String ms_title) {
		return sqlSession.selectOne("reservationMapper.getMovieage",ms_title);
	}

	public Movie getMovieInfo(int ms_no) {
		return sqlSession.selectOne("managerMapper.getMovieInfo", ms_no);
	}

	public Scheduler getNumScheduler(int ms_no) {
		return sqlSession.selectOne("reservationMapper.getNumScheduler",ms_no);
	}

	public ArrayList<String> getSeat(int ms_no) {
		return (ArrayList)sqlSession.selectList("reservationMapper.getSeat",ms_no);
	}

	public int chkSeat(HashMap<String, String> map) {
		return sqlSession.selectOne("reservationMapper.chkSeat",map);
	}

	public ArrayList<Coupon> getCoupon(User loginUser) {
		return (ArrayList)sqlSession.selectList("reservationMapper.getCoupon", loginUser);
	}

	public int usedCoupon(HashMap<String, String> map) {
		return sqlSession.update("reservationMapper.usedCoupon",map);
	}

	public int usedPoint(HashMap<String, String> map) {
		return sqlSession.update("reservationMapper.usedPoint",map);
	}

	public int usedCouponCount(HashMap<String, String> map) {
		return sqlSession.update("reservationMapper.usedCouponCount",map);
	}

	public int usedSeat(HashMap<String, String> sMap) {
		return sqlSession.update("reservationMapper.usedSeat",sMap);
	}

	public int buyListInsert(HashMap<String, String> map) {
		return sqlSession.insert("reservationMapper.buyListInsert",map);
	}

	public int getResernum(HashMap<String, String> map) {
		return sqlSession.selectOne("reservationMapper.getResernum",map);
	}

	public int addPoint(HashMap<String, String> iMap) {
		return sqlSession.update("reservationMapper.addPoint",iMap);
	}

	public int getPoint(String user_email) {
		return sqlSession.selectOne("reservationMapper.getPoint",user_email);
	}

	public int pointListIn(HashMap<String, String> map) {
		return sqlSession.insert("reservationMapper.pointListIn",map);
	}

	public int mcount_Update(HashMap<String, String> map) {
		return sqlSession.update("reservationMapper.mcount_Update",map);
	}

}
