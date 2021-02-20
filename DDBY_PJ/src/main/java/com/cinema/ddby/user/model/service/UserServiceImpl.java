package com.cinema.ddby.user.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.ddby.user.model.dao.UserDao;
import com.cinema.ddby.user.model.vo.BuyList;
import com.cinema.ddby.user.model.vo.Coupon;
import com.cinema.ddby.user.model.vo.DIARY;
import com.cinema.ddby.user.model.vo.Movie;
import com.cinema.ddby.user.model.vo.PageInfo;
import com.cinema.ddby.user.model.vo.PointList;
import com.cinema.ddby.user.model.vo.User;

@Service("uService")
public class UserServiceImpl implements UserService{
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	private UserDao uDao;
	
	@Override
	public User getDongmin(String email) {
		return uDao.getDongmin(email);
	}

	@Override
	public int idCheck(String id) {
		return uDao.idCheck(id);
	}

	@Override
	public int nickCheck(String nick) {
		return uDao.nickCheck(nick);
	}

	@Override
	public int signUp(User u) {
		return uDao.signUp(u);
	}

	@Override
	public User loginUser(User u) {
		return uDao.loginUser(u);
	}

	@Override
	public int updateProfile(User u) {
		return uDao.updateProfile(u);
	}

	@Override
	public int deleteUser(User loginUser) {
		return uDao.deleteUser(loginUser);
	}

	@Override
	public int modifyPwd(User loginUser) {
		return uDao.modifyPwd(loginUser);
	}

	@Override
	public int cListCount(User loginUser) {
		return uDao.cListCount(loginUser);
	}

	@Override
	public ArrayList<Coupon> couponList(User loginUser, PageInfo pi) {
		return uDao.couponList(loginUser, pi);
	}

	@Override
	public ArrayList<BuyList> getBuyList(String email, PageInfo pi) {
		return uDao.getBuyList(email, pi);
	}

	@Override
	public int bListCount(String email) {
		return uDao.bListCount(email);
	}

	
	@Override
	public int pListCount(User loginUser) {
		return uDao.pListCount(loginUser);
	}

	@Override
	public ArrayList<PointList> pointList(String user_email, PageInfo pi) {
		return uDao.pointList(user_email, pi);
	}

	@Override
	public int wishListIn(HashMap<String, String> map) {
		return uDao.wishListIn(map);
	}
	
	@Override
	public int wishListDel(HashMap<String, String> map) {
		return uDao.wishListDel(map);
	}

	@Override
	public ArrayList<Movie> getWishMovie(String user_email) {
		return uDao.getWishMovie(user_email);
	}

	@Override
	public Movie getMovieList(String movie_title) {
		return uDao.getMovieList(movie_title);
	}

	@Override
	public int bListCount_N(String email) {
		return uDao.bListCount_N(email);
	}

	@Override
	public ArrayList<BuyList> getBuyList_N(String user_email, PageInfo pi) {
		return uDao.getBuyList_N(user_email,pi);
	}

	@Override
	public int deleteWatching(HashMap<String, String> map) {
		return uDao.deleteWatching(map);
	}

	@Override
	public ArrayList<BuyList> getBuyLists(String email) {
		return uDao.getBuyLists(email);
	}

	@Override
	public int diaryInsert(HashMap<String, String> map) {
		return uDao.diaryInsert(map);
	}

	@Override
	public int getDiaryCount(String email) {
		return uDao.getDiaryCount(email);
	}

	@Override
	public ArrayList<DIARY> getDiary(String email, PageInfo pi) {
		return uDao.getDiary(email,pi);
	}

	@Override
	public Movie getBuylistMovie(HashMap<String, String> map) {
		return uDao.getBuylistMovie(map);
	}

	@Override
	public BuyList getBuyDiary(HashMap<String, String> map) {
		return uDao.getBuyDiary(map);
	}

	@Override
	public int diaryBuylistUpdate(HashMap<String, String> map) {
		return uDao.diaryBuylistUpdate(map);
	}

	@Override
	public int diaryDel(HashMap<String, String> map) {
		return uDao.diaryDel(map);
	}

	@Override
	public int diaryUpdate(HashMap<String, String> map) {
		return uDao.diaryUpdate(map);
	}


}
