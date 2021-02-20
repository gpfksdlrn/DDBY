package com.cinema.ddby.user.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.cinema.ddby.user.model.vo.Coupon;
import com.cinema.ddby.user.model.vo.Movie;
import com.cinema.ddby.user.model.vo.Scheduler;
import com.cinema.ddby.user.model.vo.User;

public interface ReservationService {

	ArrayList<Scheduler> getScheduler(String Tday);

	ArrayList<Scheduler> getTitleScheduler(HashMap<String, String> map);

	int getMovieage(String ms_title);

	Movie getMovieInfo(int ms_no);

	Scheduler getNumScheduler(int ms_no);

	ArrayList<String> getSeat(int ms_no);

	int chkSeat(HashMap<String, String> map);

	ArrayList<Coupon> getCoupon(User loginUser);

	int usedCoupon(HashMap<String, String> map);

	int usedPoint(HashMap<String, String> map);

	int usedCouponCount(HashMap<String, String> map);

	int usedSeat(HashMap<String, String> sMap);

	int buyListInsert(HashMap<String, String> map);

	int getResernum(HashMap<String, String> map);

	int addPoint(HashMap<String, String> iMap);

	int getPoint(String user_email);

	int pointListIn(HashMap<String, String> map);

	int mcount_Update(HashMap<String, String> map);

}
