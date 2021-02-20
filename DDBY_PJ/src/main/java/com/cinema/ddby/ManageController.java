package com.cinema.ddby;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cinema.ddby.naver.NaverLoginBO;
import com.cinema.ddby.user.model.service.ManagerService;
import com.cinema.ddby.user.model.service.UserService;
import com.cinema.ddby.user.model.vo.Coupon;
import com.cinema.ddby.user.model.vo.Event;
import com.cinema.ddby.user.model.vo.Movie;
import com.cinema.ddby.user.model.vo.Notice;
import com.cinema.ddby.user.model.vo.PageInfo;
import com.cinema.ddby.user.model.vo.Pagenation;
import com.cinema.ddby.user.model.vo.User;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.sun.javafx.collections.MappingChange.Map;

import javafx.scene.control.Pagination;

@SessionAttributes({"loginUser","tl"})

/**
 * Handles requests for the application home page.
 */
@Controller
public class ManageController {

	@Autowired
	private ManagerService mService;

	@Autowired
	UserController uc;

	@Autowired
	private UserService uService;

	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	private static final Logger logger = LoggerFactory.getLogger(ManageController.class);
	
	@Autowired
	static boolean nalogin = false;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate );

		return "home";
	}
	
	@RequestMapping("chat.do")
	public String chat(HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		if(loginUser!=null) {
			if(loginUser.getUser_email().equals("admin@ddby.com")) {
				EchoHandler.num=0;
				return "chat";
			}else {
				return "redirect:index.do";
			}
		}else {
			return "redirect:index.do";
		}
	}
	
	
	@ResponseBody //결과를 response 객체에 담아서 보내라는 의미의 어노테이션
	@RequestMapping("sendMessage.do")
	public String sendMessage(HttpSession session,String id){
		
		System.out.println(session.getId()+"입장");
		
		//현재 로직을 통과하는 세션이 관리자 세션이면
		User loginUser = (User)session.getAttribute("loginUser");
		if(loginUser!=null) {
			if(loginUser.getUser_email().equals("admin@ddby.com")) {
				   EchoHandler.ws=EchoHandler.map.get(id);
				   EchoHandler.trash_id=id;
				   return "ok";
			   }else {
				  return "no";
			   }
		}else {
			return "no";
		}
	}
	
	@ResponseBody //결과를 response 객체에 담아서 보내라는 의미의 어노테이션
	@RequestMapping("onMessage.do")
	//현재 로직을 통과하는 세션이 관리자 세션이면
	public String onMessage(HttpSession session){
			User loginUser = (User)session.getAttribute("loginUser");
			
			if(loginUser!=null) {
	
			if(loginUser.getUser_email().equals("admin@ddby.com")) {
			   return "ok";
		   }else{
			  return "no";
		   }
		}else{
			return "no";
		}
	}
	
	@RequestMapping("index.do")
	public String index(Model model,HttpSession session) {
		Random random = new Random();
		ArrayList<Event> event = mService.getEvent();
		ArrayList<Movie> movie = mService.getMovie();
		ArrayList<Notice> notice = mService.notice();

		// 영화의  수만큼 랜덤 수를 만들어 랜덤으로 영화를 뽑아준다.
		Movie ranmovie = movie.get(random.nextInt(movie.size()));

		if(event.size()>=2&&movie.size()>=2) {
			ArrayList Poster = new ArrayList();
			
			for(int i=0; i<2; i++) {
				Poster.add(event.get(i));
			}
			
			for(int i=0; i<2; i++) {
				Poster.add(movie.get(i));
			}
			model.addAttribute("Poster", Poster);
		}
		
		
		model.addAttribute("ranmovie", ranmovie);
		model.addAttribute("Event", event);
		model.addAttribute("Notice", notice);

		return "index";
	}

	@RequestMapping("loginPage.do")
	public String login(String errorMsg,Model model,HttpSession session){
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		if(errorMsg!=null) {
			model.addAttribute("errorMsg",errorMsg);
			return "login";
		}else {
			model.addAttribute("url",naverAuthUrl);
			System.out.println(naverAuthUrl);
			return "login";
		}	
	}

	@RequestMapping(value="navercallback.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String callback(Model model,@RequestParam String code, @RequestParam String state, HttpSession session, RedirectAttributes redirect)throws IOException, ParseException{

		System.out.println("콜백 진입");

		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);

		//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터

		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;

		//3. 데이터 파싱
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");

		String name = (String)response_obj.get("name");
		String email = (String)response_obj.get("email");
		String nickname = (String)response_obj.get("nickname");


		System.out.println("name=" + name);
		System.out.println("email=" + email);
		System.out.println("nickname=" + nickname);

		//4. 파싱 닉네임 세션으로 저장
		session.setAttribute("sessionId", nickname); //세션생성

		int idCheck = uService.idCheck(email);

		if(idCheck==1) {
			User u = new User();
			u.setUser_email(email);
			User loginUser = uService.loginUser(u);	
			// model로 세션 등록
			model.addAttribute("loginUser",loginUser);
			model.addAttribute("tl","t");
			// redirect로 정보를 같이 넘긴다. 모델은  redirect로 넘어가지 않는다.
			redirect.addFlashAttribute("loginUser",loginUser);
			// index에 필요한 정보를 가져오기 위해 서블릿을 타야한다.
			nalogin = true;
			return "redirect:index.do";
		}else {
			User u = new User();
			u.setUser_email(email);
			u.setUser_name(name);
			u.setUser_nickname(nickname);
			u.setUser_marketing("Y");
			u.setUser_password(email);

			int result = uService.signUp(u);

			if(result==1) {
				User loginUser = uService.loginUser(u);	
				// model로 세션 등록
				model.addAttribute("loginUser",loginUser);
				model.addAttribute("tl","t");
				// redirect로 정보를 같이 넘긴다. 모델은  redirect로 넘어가지 않는다.
				redirect.addFlashAttribute("loginUser",loginUser);
				// index에 필요한 정보를 가져오기 위해 서블릿을 타야한다.
				nalogin = true;
				return "redirect:index.do";
			}else {
				return "common/errorPage";
			}
		}

	}


	@RequestMapping("signUpPage.do")
	public String signUp() {
		return "signUp";
	}

	@RequestMapping("moviechart.do")
	public String moviechart(Model model,@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
		int listCount = mService.getMovieCount(); //전체 게시글의 수를 구해온다.

		PageInfo pi = Pagenation.getPageInfo(currentPage, listCount, 16);

		ArrayList<Movie> movie = mService.getMovieRank(pi);

		model.addAttribute("movie",movie);
		model.addAttribute("pi",pi);

		return "moviechart";
	}

	@RequestMapping("movietrailer.do")
	public String movietrailer(Model model,@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {

		int listCount = mService.getTrailerCount(); //전체 게시글의 수를 구해온다.

		PageInfo pi = Pagenation.getPageInfo(currentPage, listCount, 16);

		ArrayList<Movie> trailer = mService.getTrailers(pi);
		//ArrayList<String> stillimg = mService.getStillimg(title);

		model.addAttribute("trailer",trailer);
		model.addAttribute("pi",pi);

		return "movietrailer";
	}

	@RequestMapping("event.do")
	public String event(Model model,@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {

		int listCount = mService.getEventCount(); //전체 게시글의 수를 구해온다.

		PageInfo pi = Pagenation.getPageInfo(currentPage, listCount, 16);

		ArrayList<Event> eventList = mService.eventList(pi);

		model.addAttribute("event", eventList);
		model.addAttribute("pi", pi);
		return "event";
	}

	@RequestMapping("findPwd.do")
	public String findPwd() {
		return "find_pwd";
	}

	@RequestMapping("changePwdPage.do")
	public String changePwd(String email,Model model) {
		model.addAttribute("email",email);
		return "change_pwd";
	}

	@RequestMapping("noticeList.do")
	public String noticeList(Model model,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {

		int count = mService.findNoticeCount(); //전체 게시글의 수를 구해온다.

		PageInfo pi = Pagenation.getPageInfo(currentPage, count, 16);

		ArrayList<Notice> nl = mService.getNoticeList(pi);

		model.addAttribute("nl",nl);
		model.addAttribute("pi",pi);

		return "notice_list";
	}

	@RequestMapping("noticewrite.do")
	public String noticewrite() {
		return "notice_write";
	}

	@RequestMapping("eventwrite.do")
	public String eventwrite() {
		return "event_write";
	}

	@RequestMapping("noticeDetail.do")
	public String noticeDetail(int notice_no,Model model) {

		int nCountUpResult = mService.nViewCountUp(notice_no);

		if(nCountUpResult==1) {
			Notice n = mService.getNotice(notice_no);
			model.addAttribute("n",n);
			return "notice_detail";
		}else {
			return "common/errorPage";	
		}


	}

	@ResponseBody
	@RequestMapping("noticeUpdate.do")
	public String noticeUpdate(String no,String title,String content) {

		HashMap<String, String> map = new HashMap<String, String>();


		map.put("notice_no", no);
		map.put("title", title);
		map.put("content", content);

		int nCountUpdateResult = mService.noticeUpdate(map);

		if(nCountUpdateResult==1) {
			return "ok";
		}else {
			return "false";
		}

	}

	@ResponseBody
	@RequestMapping("noticeDelete.do")
	public String noticeDelete(int no) {

		int nDeleteResult = mService.noticeDelete(no);

		if(nDeleteResult==1) {
			return "ok";
		}else {
			return "false";
		}

	}

	@RequestMapping("movieDetail.do")
	public String movieDetail(String title, Model model, HttpSession session) {

		User loginUser = (User)session.getAttribute("loginUser");

		Movie m = mService.movieDetail(title);
		ArrayList<String> stillimg = mService.getStillimg(title);

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("mTitle", title);

		if(loginUser!=null) {
			map.put("email", loginUser.getUser_email());
			int sw = mService.getWishCount(map);
			model.addAttribute("sw", sw);
		}

		if(m != null) {
			model.addAttribute("movie", m);
			model.addAttribute("mTitle", title);
			model.addAttribute("stillimg", stillimg);
			model.addAttribute("loginUser", loginUser);

			return "movie_detail";
		}else {
			return "common/errorPage";			
		}
	}

	@RequestMapping("eventDetail.do")
	public String eventDetail(int no, Model model) {

		Event e = mService.eventDetail(no);

		if(e != null) {
			model.addAttribute("event",e);
			model.addAttribute("eventNum",no);
			return "event_detail";
		}else {
			return "common/errorPage";			
		}
	}

	@RequestMapping("eventUpdate.do")
	public String event_update(int no, Model model) {
		Event e = mService.eventDetail(no);

		if(e != null) {
			model.addAttribute("event",e);
			model.addAttribute("eventNum",no);
			return "event_update";
		}else {
			return "common/errorPage";			
		}
	}

	@RequestMapping("updateEvent.do")
	public String updateEvent(Event e,HttpServletRequest request,Model model,
			@RequestParam(name="event_main_img", required=false) MultipartFile event_main_img,
			@RequestParam(name="event_list_img", required=false) MultipartFile event_list_img) {

		if(!event_main_img.getOriginalFilename().equals("")) {
			String renameFileName = uc.saveFile(event_main_img,request,"event_m");

			if(renameFileName != null) {
				e.setEvent_b_img(event_main_img.getOriginalFilename());
				e.setEvent_re_b_img(renameFileName);
			}
		}

		if(!event_list_img.getOriginalFilename().equals("")) {
			String renameFileName = uc.saveFile(event_list_img,request,"event_l");

			if(renameFileName != null) {
				e.setEvent_s_img(event_list_img.getOriginalFilename());
				e.setEvent_re_s_img(renameFileName);
			}
		}

		int result = mService.updateEvent(e);

		if(result == 1) {
			return "redirect:event.do";
		}else {
			return "common/errorPage";			
		}

	}

	@RequestMapping("inputEvent.do")
	public String inputEvent(Event e,HttpServletRequest request,@RequestParam(name="event_main_img", required=false) MultipartFile event_main_img,
			@RequestParam(name="event_list_img", required=false) MultipartFile event_list_img,Model model){

		if(!event_main_img.getOriginalFilename().equals("")) {
			String renameFileName = uc.saveFile(event_main_img,request,"event_m");

			if(renameFileName != null) {
				e.setEvent_b_img(event_main_img.getOriginalFilename());
				e.setEvent_re_b_img(renameFileName);
			}
		}

		if(!event_list_img.getOriginalFilename().equals("")) {
			String renameFileName = uc.saveFile(event_list_img,request,"event_l");

			if(renameFileName != null) {
				e.setEvent_s_img(event_list_img.getOriginalFilename());
				e.setEvent_re_s_img(renameFileName);
			}
		}

		int result = mService.inputEvent(e);

		if(result==1) {
			return "redirect:event.do";
		}else {
			return "redirect:eventwrite.do";
		}
	}

	@RequestMapping("eventDelete.do")
	public String eventDelete(int no) {
		int result = mService.deleteEvent(no);

		if(result==1) {
			return "redirect:event.do";
		}else {
			return "common/errorPage";			
		}
	}

	@ResponseBody
	@RequestMapping("couponIssue.do")
	public String couponIssue(String email, String cTitle) {

		if(email.equals("none")) {
			return "notlog";
		}else {
			HashMap<String, String> map = new HashMap<String, String>();

			map.put("email", email);
			map.put("cTitle", cTitle);

			// 쿠폰 중복체크
			int result1 = mService.couponCheck(map);
			if(result1>0) {
				return "overlap";
			}else{

				String used = "N";
				map.put("used", used);
				// 쿠폰 발급
				int result2 = mService.couponIssue(map);
				// 쿠폰 카운트 +1
				int rCount = mService.couponCount(email);

				if(result2==1 && rCount==1) {
					return "ok";
				}else {
					return "false";
				}
			}
		}

	}

	@ResponseBody
	@RequestMapping("couponCheck.do")
	public String couponCheck(String email, String cTitle) {


		HashMap<String, String> map = new HashMap<String, String>();

		map.put("email", email);
		map.put("cTitle", cTitle);

		int result = mService.couponCheck(map);

		if(result > 0) {
			// 중복 존재
			return "ok";
		}else {
			return "false";
		}
	}

	// 검색 결과 페이지
	@RequestMapping("searchResult.do") 
	public String searchResult(String searchText, Model model,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {

		int count = mService.findMovieCount(searchText); //전체 게시글의 수를 구해온다.

		PageInfo pi = Pagenation.getPageInfo(currentPage, count, 16);

		ArrayList<Movie> mv = mService.findMovie(searchText, pi);

		model.addAttribute("count",count);
		model.addAttribute("pi",pi);
		model.addAttribute("movie",mv);
		return "searchResult";
	}

	@RequestMapping("nWrite.do")
	public String nWrite(String nContent,String nTitle ,Model model) {

		HashMap<String, String> map = new HashMap<String, String>();

		map.put("nContent", nContent);
		map.put("nTitle", nTitle);

		int result = mService.writeNotice(map);

		if(result==1) {
			return "redirect:noticeList.do";
		}else {
			return "common/errorPage";
		}
	}
}
