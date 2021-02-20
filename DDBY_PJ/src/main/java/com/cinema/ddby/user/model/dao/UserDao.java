package com.cinema.ddby.user.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cinema.ddby.user.model.vo.BuyList;
import com.cinema.ddby.user.model.vo.Coupon;
import com.cinema.ddby.user.model.vo.DIARY;
import com.cinema.ddby.user.model.vo.Movie;
import com.cinema.ddby.user.model.vo.PageInfo;
import com.cinema.ddby.user.model.vo.PointList;
import com.cinema.ddby.user.model.vo.User;

@Repository("uDao")
// 레파지토리의 정의가 무엇일까?
public class UserDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public User getDongmin(String email) {
		return sqlSession.selectOne("userMapper.GetDongmin", email);
	}

	public int idCheck(String id) {
		return sqlSession.selectOne("userMapper.idCheck", id);
	}

	public int nickCheck(String nick) {
		return sqlSession.selectOne("userMapper.nickCheck", nick);
	}

	public int signUp(User u) {
		return sqlSession.insert("userMapper.signUp", u);
	}

	public User loginUser(User u) {
		return sqlSession.selectOne("userMapper.loginUser", u);
	}

	public int updateProfile(User u) {
		return sqlSession.update("userMapper.updateProfile", u);
	}

	public int deleteUser(User loginUser) {
		return sqlSession.update("userMapper.deleteUser", loginUser);
	}

	public int modifyPwd(User loginUser) {
		return sqlSession.update("userMapper.modifyPwd", loginUser);
	}

	public int cListCount(User loginUser) {
		return sqlSession.selectOne("userMapper.cListCount",loginUser);
	}

	public ArrayList<Coupon> couponList(User loginUser, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		//rowBounds 는 마이바티스에서 페이징 처리를 위한 클래스이다.
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		// 실제로 보내는 매개변수는 loginUser 하나이다.
		return (ArrayList)sqlSession.selectList("userMapper.couponList",loginUser,rowBounds);
	}

	public ArrayList<BuyList> getBuyList(String email, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		//rowBounds 는 마이바티스에서 페이징 처리를 위한 클래스이다.
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		// 실제로 보내는 매개변수는 loginUser 하나이다.
		return (ArrayList)sqlSession.selectList("userMapper.getBuyList", email, rowBounds);
	}

	public int bListCount(String email) {
		return sqlSession.selectOne("userMapper.bListCount",email);
	}

	public ArrayList<PointList> pointList(String user_email, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		//rowBounds 는 마이바티스에서 페이징 처리를 위한 클래스이다.
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("userMapper.pointList", user_email, rowBounds);
	}

	public int pListCount(User loginUser) {
		return sqlSession.selectOne("userMapper.pListCount",loginUser);
	}

	public int wishListIn(HashMap<String, String> map) {
		return sqlSession.insert("userMapper.wishListIn", map);
	}

	public int wishListDel(HashMap<String, String> map) {
		return sqlSession.delete("userMapper.wishListDel", map);
	}

	public ArrayList<Movie> getWishMovie(String user_email) {
		return (ArrayList)sqlSession.selectList("userMapper.getWishMovie", user_email);
	}

	public Movie getMovieList(String movie_title) {
		return sqlSession.selectOne("userMapper.getMovieList",movie_title);
	}

	public int bListCount_N(String email) {
		return sqlSession.selectOne("userMapper.bListCount_N",email);
	}

	public ArrayList<BuyList> getBuyList_N(String user_email, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		//rowBounds 는 마이바티스에서 페이징 처리를 위한 클래스이다.
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		// 실제로 보내는 매개변수는 loginUser 하나이다.
		return (ArrayList)sqlSession.selectList("userMapper.getBuyList_N", user_email, rowBounds);
	}

	public int deleteWatching(HashMap<String, String> map) {
		return sqlSession.update("userMapper.deleteWatching",map);
	}

	public ArrayList<BuyList> getBuyLists(String email) {
		return (ArrayList)sqlSession.selectList("userMapper.getBuyLists",email);
	}

	public int diaryInsert(HashMap<String, String> map) {
		return sqlSession.insert("userMapper.diaryInsert", map);
	}

	public int getDiaryCount(String email) {
		return sqlSession.selectOne("userMapper.getDiaryCount",email);
	}

	public ArrayList<DIARY> getDiary(String email, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		//rowBounds 는 마이바티스에서 페이징 처리를 위한 클래스이다.
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		// 실제로 보내는 매개변수는 loginUser 하나이다.
		return (ArrayList)sqlSession.selectList("userMapper.getDiary", email, rowBounds);
	}

	public Movie getBuylistMovie(HashMap<String, String> map) {
		return sqlSession.selectOne("userMapper.getBuylistMovie",map);
	}

	public BuyList getBuyDiary(HashMap<String, String> map) {
		return sqlSession.selectOne("userMapper.getBuyDiary",map);
	}

	public int diaryBuylistUpdate(HashMap<String, String> map) {
		return sqlSession.update("userMapper.diaryBuylistUpdate",map);
	}

	public int diaryDel(HashMap<String, String> map) {
		return sqlSession.delete("userMapper.diaryDel",map);
	}

	public int diaryUpdate(HashMap<String, String> map) {
		return sqlSession.update("userMapper.diaryUpdate",map);
	}

}
