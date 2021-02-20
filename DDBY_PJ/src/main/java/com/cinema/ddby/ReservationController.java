package com.cinema.ddby;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cinema.ddby.user.model.service.ManagerService;
import com.cinema.ddby.user.model.service.ReservationService;
import com.cinema.ddby.user.model.vo.Coupon;
import com.cinema.ddby.user.model.vo.Movie;
import com.cinema.ddby.user.model.vo.Scheduler;
import com.cinema.ddby.user.model.vo.User;
import com.sun.javafx.collections.MappingChange.Map;

@SessionAttributes("loginUser")

@Controller
public class ReservationController {

	@Autowired
	private ReservationService rService;

	@Autowired
	private ManagerService mService;

	@RequestMapping("showtime.do")
	public String showtime(Model model, HttpSession session) {
		User loginUser = (User) session.getAttribute("loginUser");

		ArrayList<Movie> mv = mService.getMovie();

		model.addAttribute("mv", mv);
		model.addAttribute("loginUser", loginUser);

		return "showtime";
	}

	@RequestMapping("scheduler.do")
	public String scheduler(HttpSession session,Model model) {
		User loginUser = (User) session.getAttribute("loginUser");

		ArrayList<Movie> mv = mService.getMovie();

		model.addAttribute("mv", mv);
		model.addAttribute("loginUser", loginUser);

		return "scheduler";
	}
	
	@RequestMapping("seat.do")
	public String seat(@RequestParam(value = "ms_no", required = false) int ms_no,
			@RequestParam(value = "msg", required = false) String msg, Model model, HttpSession session) {

		User loginUser = (User) session.getAttribute("loginUser");

		Movie mv = rService.getMovieInfo(ms_no);
		Scheduler sc = rService.getNumScheduler(ms_no);

		model.addAttribute("mv", mv);
		model.addAttribute("sc", sc);
		model.addAttribute("loginUser", loginUser);

		if (msg != null) {
			model.addAttribute("msg", "true");
		}

		return "seat";
	}

	@ResponseBody
	@RequestMapping(value = "dateScheduler.do", produces = "application/text; charset=UTF-8")
	public String dateScheduler(String Tday, Model model) {

		ArrayList<Scheduler> sc = rService.getScheduler(Tday);

		JSONObject jsc = null;
		JSONArray jsca = new JSONArray();

		for (int i = 0; i < sc.size(); i++) {
			int ms_age = rService.getMovieage(sc.get(i).getMs_title());
			jsc = new JSONObject();

			jsc.put("ms_title", sc.get(i).getMs_title());
			jsc.put("ms_age", ms_age);

			jsca.add(jsc);
		}

		return jsca.toJSONString();
	}

	@ResponseBody
	@RequestMapping(value = "titleScheduler.do", produces = "application/text; charset=UTF-8")
	public String titleScheduler(String mTday, String mTitle, Model model) {

		HashMap<String, String> map = new HashMap<String, String>();

		map.put("mTday", mTday);
		map.put("mTitle", mTitle);

		ArrayList<Scheduler> sc = rService.getTitleScheduler(map);

		JSONObject jsc = null;
		JSONArray jsca = new JSONArray();
		
		
		

		for (int i = 0; i < sc.size(); i++) {
			ArrayList<String> seat = rService.getSeat(sc.get(i).getMs_no());
			
			jsc = new JSONObject();
			jsc.put("ms_no", sc.get(i).getMs_no());
			jsc.put("ms_title", sc.get(i).getMs_title());
			jsc.put("ms_showtime", sc.get(i).getMs_showtime());
			jsc.put("ms_theater", sc.get(i).getMs_theater());
			jsc.put("ms_seat",(100-seat.size()));
			jsca.add(jsc);
		}
		return jsca.toJSONString();
	}

	// 이미 예매된 자석 Ajax
	@ResponseBody
	@RequestMapping(value = "seatNum.do", produces = "application/text; charset=UTF-8")
	public String seatNum(int ms_no) {

		ArrayList<String> seat = rService.getSeat(ms_no);

		JSONArray jsca = new JSONArray();

		for (int i = 0; i < seat.size(); i++) {
			jsca.add(seat.get(i));
		}

		return jsca.toJSONString();
	}

	// 영화 구매 페이지
	@RequestMapping("buyMovie.do")
	public String buyMovie(HttpSession session, String select_Seat, int total_pay, String total_age, int ms_no,
			Model model, RedirectAttributes redirect) {

		User loginUser = (User) session.getAttribute("loginUser");

		Movie mv = rService.getMovieInfo(ms_no);
		Scheduler sc = rService.getNumScheduler(ms_no);
		ArrayList<Coupon> c = rService.getCoupon(loginUser);

		String[] seatArr = select_Seat.split(",");
		String[] ageArr = total_age.split(",");

		HashMap<String, String> map;
		String s_ms_no = ms_no + "";

		int point = rService.getPoint(loginUser.getUser_email());
		
		int result = 0;

		for (int i = 0; i < seatArr.length; i++) {
			map = new HashMap<String, String>();
			map.put("ms_no", s_ms_no);
			map.put("seatNum", seatArr[i]);
			result = rService.chkSeat(map);

			if (result > 0) { // 중복된 좌석이 있을 때 뒤로 이동
				redirect.addAttribute("msg", "true");
				redirect.addAttribute("ms_no", ms_no);
				return "redirect:seat.do";
			}

		}

		// 총 인원 수
		int p_count = 0;
		for (String num : ageArr) {
			p_count += Integer.parseInt(num);
		}
		
		int coupon_count = c.size();
		
		model.addAttribute("point",point);
		model.addAttribute("seatArr", seatArr);
		model.addAttribute("ageArr", ageArr);
		model.addAttribute("mv", mv);
		model.addAttribute("sc", sc);
		model.addAttribute("coupon", c);
		model.addAttribute("coupon_count",coupon_count);
		model.addAttribute("total_pay", total_pay);
		model.addAttribute("p_count", p_count);

		return "buy_movie";
	}

	// 영화 결제(카카오 페이 API)
	@RequestMapping("kakaoPay.do")
	public String kakaoPay(HttpSession session, String coupon, String point, String select_Seat, String total_pay,
			String total_age, String mShowTime, int ms_no, String dc_pay, String cost_pay, Model model, RedirectAttributes redirect) {

		User loginUser = (User)session.getAttribute("loginUser");
	
		model.addAttribute("ms_no",ms_no);
		model.addAttribute("coupon",coupon);
		model.addAttribute("point",point);
		model.addAttribute("select_Seat",select_Seat);
		model.addAttribute("total_pay",total_pay);
		model.addAttribute("dc_pay",dc_pay);
		model.addAttribute("cost_pay",cost_pay);
		model.addAttribute("total_age",total_age);
		model.addAttribute("mShowTime",mShowTime);
		model.addAttribute("loginUser", loginUser);
		
		return "common/kakaoPay";
	}
	
	@RequestMapping("payResult.do")
	public String payResult(HttpSession session, String coupon, String point, String select_Seat, String total_pay,
			String total_age, String mShowTime, int ms_no, String dc_pay, String cost_pay, Model model, RedirectAttributes redirect) {
		
		// total_pay total_age ms_no
		
		User loginUser = (User)session.getAttribute("loginUser");
		Movie mv = rService.getMovieInfo(ms_no);
		String email = loginUser.getUser_email();
		int result=0;
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		
		if(!coupon.equals("")) {
			map.put("coupon", coupon);
			// 쿠폰내역에 사용함으로 체크
			result = rService.usedCoupon(map);
			result = rService.usedCouponCount(map);
		}
		
		
		if(!point.equals("")) {
			map.put("point", point);
			map.put("use","Y");
			// 포인트리스트에 포인트 차감
			result = rService.usedPoint(map);
			result = rService.pointListIn(map);
		}
		
		String[] seatArr = select_Seat.split(",");
		String s_ms_no = ms_no + "";
		
		for(String s:seatArr) {
			HashMap<String, String> sMap = new HashMap<String, String>();
			sMap.put("seat",s);
			sMap.put("ms_no",s_ms_no);
			result = rService.usedSeat(sMap);
		}
		
		Scheduler sc = rService.getNumScheduler(ms_no);
		
		String s = total_age.replaceAll("[^0-9]", "");
		char[] total_c = s.toCharArray();
		int num=0;
		
		for(int i=0; i<total_c.length; i++) {
			// char형의 숫자를 int로 바꾸기 위해 -48을 함(아스키코드 참고)
			num += (total_c[i]-48);
		}
		
		// 결제내역 INSER
		map.put("ms_no",s_ms_no);
		map.put("total_pay", total_pay);
		map.put("select_Seat", select_Seat);
		map.put("getMs_title",sc.getMs_title());
		map.put("getMs_theater",(sc.getMs_theater()+""));
		map.put("getMs_showtime",sc.getMs_showtime());
		map.put("total_c",num+"");
		
		result = rService.buyListInsert(map);
		
		int i_total_pay = Integer.parseInt(total_pay);
		int addPoint = (int)(i_total_pay * 0.05);
		if(result==1) {
			HashMap<String, String> iMap = new HashMap<String, String>();
			iMap.put("point", addPoint+"");
			iMap.put("email", email);
			iMap.put("use","N");
			// DDBY_USER에 포인트 추가
			result = rService.addPoint(iMap);
			// 포인트리스트에 포인트 추가
			result = rService.pointListIn(iMap);
		}else {
			return "common/errorPage";
		}
		
		// 예매번호
		int reserNum = rService.getResernum(map);
		
		if(dc_pay.equals("")) {
			dc_pay="0";
		}
		
		// 영화상영시간
		String mShowTime2=mShowTime.substring(2);
		// JSP로 보내기..
		if(result == 1) {
			model.addAttribute("reserNum", reserNum);
			model.addAttribute("mv", mv);
			model.addAttribute("select_Seat", select_Seat);
			model.addAttribute("total_pay", total_pay);
			model.addAttribute("dc_pay", dc_pay);
			model.addAttribute("cost_pay", cost_pay);
			model.addAttribute("total_age", total_age);
			model.addAttribute("mShowTime", mShowTime2);
			model.addAttribute("getMs_theater",(sc.getMs_theater()+""));
			int result_count = rService.mcount_Update(map);
		}else {
			return "common/errorPage";
		}
		
		return "payResult";
	}
}
