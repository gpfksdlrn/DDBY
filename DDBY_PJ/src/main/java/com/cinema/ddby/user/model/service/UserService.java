package com.cinema.ddby.user.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.cinema.ddby.user.model.vo.BuyList;
import com.cinema.ddby.user.model.vo.Coupon;
import com.cinema.ddby.user.model.vo.DIARY;
import com.cinema.ddby.user.model.vo.Movie;
import com.cinema.ddby.user.model.vo.PageInfo;
import com.cinema.ddby.user.model.vo.PointList;
import com.cinema.ddby.user.model.vo.User;

public interface UserService {

	User getDongmin(String email);

	int idCheck(String id);

	int nickCheck(String nick);

	int signUp(User u);

	User loginUser(User u);

	int updateProfile(User u);

	int deleteUser(User loginUser);

	int modifyPwd(User loginUser);
	
	int cListCount(User loginUser);
	
	ArrayList<Coupon> couponList(User loginUser, PageInfo pi);

	ArrayList<BuyList> getBuyList(String email, PageInfo pi);

	int bListCount(String email);

	ArrayList<PointList> pointList(String user_email, PageInfo pi);

	int pListCount(User loginUser);

	int wishListIn(HashMap<String, String> map);

	int wishListDel(HashMap<String, String> map);

	ArrayList<Movie> getWishMovie(String user_email);

	Movie getMovieList(String movie_title);

	int bListCount_N(String email);

	ArrayList<BuyList> getBuyList_N(String user_email, PageInfo pi);

	int deleteWatching(HashMap<String, String> map);

	ArrayList<BuyList> getBuyLists(String email);

	int diaryInsert(HashMap<String, String> map);

	int getDiaryCount(String email);

	ArrayList<DIARY> getDiary(String email, PageInfo pi);

	Movie getBuylistMovie(HashMap<String, String> map);

	BuyList getBuyDiary(HashMap<String, String> map);

	int diaryBuylistUpdate(HashMap<String, String> map);

	int diaryDel(HashMap<String, String> map);

	int diaryUpdate(HashMap<String, String> map);

}
