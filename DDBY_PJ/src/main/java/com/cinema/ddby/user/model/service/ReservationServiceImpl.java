package com.cinema.ddby.user.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.ddby.user.model.dao.ReservationDao;
import com.cinema.ddby.user.model.vo.Coupon;
import com.cinema.ddby.user.model.vo.Movie;
import com.cinema.ddby.user.model.vo.Scheduler;
import com.cinema.ddby.user.model.vo.User;

@Service("rService")
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
	ReservationDao rDao;

	@Override
	public ArrayList<Scheduler> getScheduler(String Tday) {
		return rDao.getScheduler(Tday);
	}

	@Override
	public ArrayList<Scheduler> getTitleScheduler(HashMap<String, String> map) {
		return rDao.getTitleScheduler(map);
	}

	@Override
	public int getMovieage(String ms_title) {
		return rDao.getMovieage(ms_title);
	}

	@Override
	public Movie getMovieInfo(int ms_no) {
		return rDao.getMovieInfo(ms_no);
	}

	@Override
	public Scheduler getNumScheduler(int ms_no) {
		return rDao.getNumScheduler(ms_no);
	}

	@Override
	public ArrayList<String> getSeat(int ms_no) {
		return rDao.getSeat(ms_no);
	}

	@Override
	public int chkSeat(HashMap<String, String> map) {
		return rDao.chkSeat(map);
	}

	@Override
	public ArrayList<Coupon> getCoupon(User loginUser) {
		return rDao.getCoupon(loginUser);
	}

	@Override
	public int usedCoupon(HashMap<String, String> map) {
		return rDao.usedCoupon(map);
	}

	@Override
	public int usedPoint(HashMap<String, String> map) {
		return rDao.usedPoint(map);
	}

	@Override
	public int usedCouponCount(HashMap<String, String> map) {
		return rDao.usedCouponCount(map);
	}

	@Override
	public int usedSeat(HashMap<String, String> sMap) {
		return rDao.usedSeat(sMap);
	}

	@Override
	public int buyListInsert(HashMap<String, String> map) {
		return rDao.buyListInsert(map);
	}

	@Override
	public int getResernum(HashMap<String, String> map) {
		return rDao.getResernum(map);
	}

	@Override
	public int addPoint(HashMap<String, String> iMap) {
		return rDao.addPoint(iMap);
	}

	@Override
	public int getPoint(String user_email) {
		return rDao.getPoint(user_email);
	}

	@Override
	public int pointListIn(HashMap<String, String> map) {
		return rDao.pointListIn(map);
	}

	@Override
	public int mcount_Update(HashMap<String, String> map) {
		return rDao.mcount_Update(map);
	}



}
