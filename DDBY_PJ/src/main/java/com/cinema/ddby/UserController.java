package com.cinema.ddby;

import java.io.File;
import java.lang.ProcessBuilder.Redirect;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cinema.ddby.user.model.service.KakaoService;
import com.cinema.ddby.user.model.service.ReservationService;
import com.cinema.ddby.user.model.service.UserService;
import com.cinema.ddby.user.model.vo.BuyList;
import com.cinema.ddby.user.model.vo.Coupon;
import com.cinema.ddby.user.model.vo.DIARY;
import com.cinema.ddby.user.model.vo.Movie;
import com.cinema.ddby.user.model.vo.PageInfo;
import com.cinema.ddby.user.model.vo.Pagenation;
import com.cinema.ddby.user.model.vo.PointList;
import com.cinema.ddby.user.model.vo.User;

@SessionAttributes({"loginUser","tl"})

@Controller
public class UserController {
	
	@Autowired
	private UserService uService;
	
	@Autowired
	private ReservationService rService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	// 이메일 전송 인터페이스
	@Inject // 생성한 클래스 없이 바로 객체를 생성시킨다.
	JavaMailSender mailSender;

	@Autowired
	static boolean kalogin = false;

	// 이메일 중복 체크
	@ResponseBody
	@RequestMapping("idCheck.do")
	public String idCheck(String id) {
		int result = uService.idCheck(id);
		
		if(result>0) {
			return "fail";
		}else {
			return "ok";
		}
	}
	
	// 닉네임 중복 체크
	@ResponseBody
	@RequestMapping("nickNameCheck.do")
	public String nickNameCheck(String nick) {
		
		int result = uService.nickCheck(nick);
		
		if(result>0) {
			return "fail";
		}else {
			return "ok";
		}
	}
	
	// 회원가입
	@RequestMapping("signUp.do") 
	public String signUp(User u) {

		u.setUser_password(bcryptPasswordEncoder.encode(u.getUser_password()));
	
		int result = uService.signUp(u);
		if(result == 1) {
			return "redirect:index.do";
		}else {
			System.out.println("회원가입실패!!");
			return "common/errorPage";
		}
	}
	
	// 인증메일 발송
	@ResponseBody
	@RequestMapping("emailSend.do")
	public String emailSend(Model model,String id) {
		
		String randomcode = (int)((Math.random() * (9999-1000))+1000)+"";
		
		if(sendmail(id, randomcode).equals("fail")) {
			return "fail";
		}else {
			return(bcryptPasswordEncoder.encode(randomcode));
		}
	}
	
	public String sendmail(String email,String code) {
		String setfrom = "cjsehdals0430@gmail.com";

		try {
			// 이메일 메세지 보낼 수 있는 객체 라이브러리
			MimeMessage message = mailSender.createMimeMessage();
			
			// MimeMessege를 도와주는 객체 라이브러리
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");
			
			// MimeMessageHelper 양식
			messageHelper.setFrom(setfrom); // 보내는 사람 E-mail
			messageHelper.setTo(email);		// 받는 사람 E-mail
			messageHelper.setSubject("또보영에서 보낸 회원가입 인증코드입니다.");
			messageHelper.setText(code+"\n 메일 인증코드입니다. 인증코드란에 입력하십시오",true);
			
			mailSender.send(message);
			
		} catch (Exception e) {
			// 이메일 보내기 실패했을 때
			return "fail";
		}
		System.out.println("인증코드  = " + code);
		return "true";
	}
	
	// 인증코드와 입력한 인증코드의 비교 메소드
	@ResponseBody
	@RequestMapping("codeCheck.do") 
	public String codeCheck(String code, String inputCode, Model model) {
		// 암호화 비교할 때 .matches() 를 이용
		if(bcryptPasswordEncoder.matches(inputCode, code)) {
			return "ok";
		}else {
			return "fail";
		}
	}
	
	// 로그인
	@RequestMapping("login.do")
	public String login(User u, Model model, RedirectAttributes redirect) {
		
		User loginUser = uService.loginUser(u);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(u.getUser_password(),loginUser.getUser_password())){
			// model로 세션 등록
			model.addAttribute("loginUser",loginUser);
			model.addAttribute("tl","f");

			// redirect로 정보를 같이 넘긴다. 모델은  redirect로 넘어가지 않는다.
			redirect.addFlashAttribute("loginUser",loginUser);
			// index에 필요한 정보를 가져오기 위해 서블릿을 타야한다.
			return "redirect:index.do";
		}else{
			redirect.addAttribute("errorMsg","가입하지 않은 이메일이거나, 잘못된 비밀번호입니다.");
			return "redirect:loginPage.do";
		}
	}
	
	// 로그아웃
	@RequestMapping("logout.do")
	public String logout(SessionStatus status, HttpSession session,String token) {
		status.setComplete();
		
		if(kalogin) {
			KakaoService.kakaoLogout(token);
			// kalogin은 카카오 로그인 판별 ture면은 카카오 로그인이 된상태
			// false면 카카오 로그인이 아닌상태
			kalogin=false;
		}
		
		ManageController.nalogin = false;
		return "redirect:index.do";
	}
	
	// 비밀번호 찾기(비밀번호 변경)
		@RequestMapping("changePwd.do")
		public String changePwd(User u,Model model) {
			System.out.println(u);
			
			u.setUser_password(bcryptPasswordEncoder.encode(u.getUser_password()));
			
			int result = uService.modifyPwd(u);
			
			if(result==1){
				model.addAttribute("msg",1);
				return "change_pwd";
			}else{
				model.addAttribute("msg",2);
				return "change_pwd";
			}
		}
	
	// 프로필 수정
	@RequestMapping("profileUpdate.do")
	public String profileUpdate(User u, HttpServletRequest request,
			@RequestParam(name="uploadFile", required=false) MultipartFile file,HttpSession session,Model model) {
				// @RequestParam어노테이션을 이용한 업로드 파일 접근
				// form의 enctype이 multipart/form-data로 작성되어있어야하고, method=POST이어야한다.
				// MultipartResolver가 multipartFile객체를 컨트롤러로 전달할 수 있다.
		User loginUser = (User)session.getAttribute("loginUser");
		
		u.setUser_email(loginUser.getUser_email());
		u.setUser_name(loginUser.getUser_name());
		
		if(!file.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(file,request,"profile");
			
			if(renameFileName != null) {
				u.setUser_img(file.getOriginalFilename()); // 파일명만 DB에 저장
				u.setUser_re_img(renameFileName);
			}
		}
		
		int result = uService.updateProfile(u);
		
		if(result == 1) {
			model.addAttribute("loginUser",u);
			return "redirect:my_profile.do";
		}else {
			return "common/errorPage";
		}
		
		
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request,String what) {
		// 파일이 저장될 경로를 설정하기
		// 웹 서버의 contextPath를 불러와서 폴더의 경로를 가져온다
		// webapp하위의 resources
		String root = request.getSession().getServletContext().getRealPath("resources");

		// 파일 경로
		// \를 문자로 인식시키기 위해서는 "\\"를 사용한다.
		String savePath = root + "\\puploadFiles";

		File folder = new File(savePath);

		if(!folder.exists()) { // 폴더가 있는지 없는지
			folder.mkdirs(); // 폴더가 없다면 생성한다.
		}

		// 파일명을 rename 과정을 추가 => "년월일시분초.확장자"로 변경
		String originalFileName = file.getOriginalFilename();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss"); 

		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()))+"."
				+ originalFileName.substring(originalFileName.lastIndexOf(".")+1);
		
		if(what=="event_m") {
			renameFileName = ("EM_" + renameFileName); 
		}else if(what=="event_l") {
			renameFileName = ("EL_" + renameFileName);  
		}
		
		String renamePath = folder + "\\" + renameFileName; // 실제 저장될 파일 경로 + 파일명

		try {
			file.transferTo(new File(renamePath)); // 전달받은 file이 rename명으로 이 때 파일이 저장된다.
		}catch(Exception e) {
			System.out.println("파일 전송 에러" + e.getMessage());
		}

		return renameFileName;
	}
	
	// 회원탈퇴
	@RequestMapping("deleteUser.do")
	public String deleteUser(String password,HttpSession session,Model model,SessionStatus status) {
		
		User loginUser = (User)session.getAttribute("loginUser");
		
		if(bcryptPasswordEncoder.matches(password,loginUser.getUser_password())){
			int result = uService.deleteUser(loginUser);
			
			if(result ==1) {
				model.addAttribute("msg",1);
				status.setComplete();
				return "User/my_deleteUser";
			}else{
				System.out.println("에러");
				return "User/my_deleteUser";
			}
			
		}else{
			model.addAttribute("msg",2);
			return "User/my_deleteUser";
		}	
	}
	
	// 비밀번호 수정
	@RequestMapping("modifyPwd.do")
	public String modifyPwd(String password, String now_pwd, HttpSession session, Model model, SessionStatus status) {
		
		User loginUser = (User)session.getAttribute("loginUser");
		
		// 현재 비밀번호와 DB에 저장된 비밀번호 일치 확인
		if(bcryptPasswordEncoder.matches(now_pwd,loginUser.getUser_password())){
			// 새 비밀번호로 변경
			loginUser.setUser_password(bcryptPasswordEncoder.encode(password));
			
			int result = uService.modifyPwd(loginUser);
			  
			if(result == 1) {
				model.addAttribute("msg",1);
				status.setComplete();
				return "User/my_modifyPwd";
			}else {
				model.addAttribute("msg",2);
				System.out.println("비밀번호 수정 에러");
				return "User/my_modifyPwd";
			}
		}else{
			model.addAttribute("msg",3);
			return "User/my_deleteUser";
		}
	}
	
	@RequestMapping("my_profile.do")
	public String profile(Model model) {
		return "User/my_profile";
	}
	
	@RequestMapping("my_changePwd.do")
	public String my_changePwd() {
		return "User/my_modifyPwd";
	}
	
	@RequestMapping("my_deleteUser.do")
	public String my_deleteUser() {
		return "User/my_deleteUser";
	}
	
	@RequestMapping("my_buyList.do")
	public String my_buyList(HttpSession session, Model model,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
		User loginUser = (User)session.getAttribute("loginUser");
		
		String email = loginUser.getUser_email();
		
		int count = uService.bListCount(email);
		
		PageInfo pi = Pagenation.getPageInfo(currentPage, count, 10);
		
		ArrayList<BuyList> bl = uService.getBuyList(email, pi);
		
		model.addAttribute("bl", bl);
		model.addAttribute("pi",pi);
		
		return "User/my_buyList";
	}
	
	@RequestMapping("my_coupon.do")
	public String my_coupon(HttpSession session, Model model,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
		User loginUser = (User)session.getAttribute("loginUser");
		
		int count = uService.cListCount(loginUser);
		
		PageInfo pi = Pagenation.getPageInfo(currentPage, count, 10);
		
		ArrayList<Coupon> cList = uService.couponList(loginUser, pi);
		
		model.addAttribute("cList", cList);
		model.addAttribute("pi", pi);
		
		return "User/my_couponList";
	}
	
	@RequestMapping("my_point.do")
	public String my_point(HttpSession session,Model model,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
		
		User loginUser = (User)session.getAttribute("loginUser");
		
		int count = uService.pListCount(loginUser);
		
		PageInfo pi = Pagenation.getPageInfo(currentPage, count, 10);
		
		ArrayList<PointList> pList = uService.pointList(loginUser.getUser_email(), pi);
		System.out.println(count);
		System.out.println(pList);
		model.addAttribute("pList", pList);
		model.addAttribute("pi", pi);
		
		return "User/my_pointList";
	}
	
	@RequestMapping("my_wishMovie.do")
	public String my_wishMovie(HttpSession session, Model model) {
		User loginUser = (User)session.getAttribute("loginUser");
		
		ArrayList<Movie> wishList = uService.getWishMovie(loginUser.getUser_email());
		model.addAttribute("wishList",wishList);
		
		return "User/my_wishMovie";
	}
	
	@ResponseBody
	@RequestMapping("wishBtn.do")
	public String wishBtn(String mTitle, int sw, HttpSession session) {
		
		User loginUser = (User)session.getAttribute("loginUser");
		
		int result = 0;
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", loginUser.getUser_email());
		map.put("mTitle", mTitle);
		
		if(sw==0) {	// 찜 등록
			result = uService.wishListIn(map);
			if(result==1) {
				return "input";
			}else {
				return "fail";
			}
		}else {		// 찜 해제
			result = uService.wishListDel(map);
			if(result==1) {
				return "delete";
			}else {
				return "fail";
			}
		}
	}
	
	// 내가 본 영화
	@RequestMapping("my_watching.do")
	public String my_watching(HttpSession session, Model model,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
		User loginUser = (User)session.getAttribute("loginUser");
		
		String email = loginUser.getUser_email();
		
		int count = uService.bListCount_N(email);
		
		PageInfo pi = Pagenation.getPageInfo(currentPage, count, 10);
		
		ArrayList<BuyList> bl = uService.getBuyList_N(loginUser.getUser_email(), pi);
		ArrayList<Movie> m = new ArrayList<Movie>();
			
		for(int i=0; i< bl.size(); i++) {
			if(bl.get(i).getWatching().equals("N")) {
				m.add(uService.getMovieList(bl.get(i).getMovie_title()));
			}
		}
		
		model.addAttribute("bl",bl);
		model.addAttribute("movie",m);
		model.addAttribute("pi",pi);
		
		return "User/my_watching";
	}
	
	@ResponseBody
	@RequestMapping("watchDelBtn.do") 
	public String watchDelBtn(HttpSession session, String b_no) {
		User loginUser = (User)session.getAttribute("loginUser");
		String email = loginUser.getUser_email();
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("b_no", b_no);
		
		int result = uService.deleteWatching(map);
		if(result==1) {
			return "ok";
		}else {
			return "false";
		}
	}
	
	@RequestMapping("my_diary.do")
	public String my_diary(HttpSession session, Model model, 
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage,String bnum) {
		
		User loginUser = (User)session.getAttribute("loginUser");
		
		String email = loginUser.getUser_email();
		
		// 구매한 영화 정보들 SELECT-BOX에 있는 부분
		ArrayList<BuyList> blist = uService.getBuyLists(email);
		ArrayList<Movie> m = new ArrayList<Movie>();
		
		for(int i=0; i< blist.size(); i++) {
			m.add(uService.getMovieList(blist.get(i).getMovie_title()));
		}
		
		// 여기부터 DIARY 정보 가져오는 부분 시작
		// 다이어리 게시글 갯수
		int count = uService.getDiaryCount(email);
		PageInfo pi = Pagenation.getPageInfo(currentPage, count, 10);
		
		ArrayList<DIARY> dlist = uService.getDiary(email,pi);
		ArrayList<Movie> dm = new ArrayList<Movie>();
		ArrayList<BuyList> dblist = new ArrayList<BuyList>();
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("email", email);
		
		for(int i=0; i<dlist.size(); i++) {
			System.out.println("dia_num = " + dlist.get(i).getDia_no());
			map.put("dia_num",dlist.get(i).getDia_no()+"");
			dm.add(uService.getBuylistMovie(map));
			dblist.add(uService.getBuyDiary(map));
		}
		
		model.addAttribute("blist", blist);
		model.addAttribute("movie", m);
		model.addAttribute("dCount",count);
		model.addAttribute("pi",pi);
		model.addAttribute("dlist",dlist);
		model.addAttribute("dblist",dblist);
		model.addAttribute("dm",dm);
		
		if(bnum!=null) {
			model.addAttribute("bnum",bnum);
		}
		
		return "User/my_diary";
	}
	
	
	@RequestMapping("my_diaryInsert.do") 
	public String my_diaryInsert(HttpSession session, String buy_no, String txtMovieWith, String textContent) { 
		User loginUser = (User)session.getAttribute("loginUser");
		String email = loginUser.getUser_email();
	  
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("buy_no", buy_no);
		map.put("txtMovieWith", txtMovieWith);
		map.put("textContent", textContent);
		map.put("write", "Y");
		
		int result = uService.diaryInsert(map);
		int result2 = uService.diaryBuylistUpdate(map);
		
		if(result==1&&result2==1) {
			return "redirect:my_diary.do";
		}else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("my_diaryUpdate.do") 
	public String my_diaryUpdate(HttpSession session, String buy_no, String txtMovieWith, String textContent) { 
		User loginUser = (User)session.getAttribute("loginUser");
		String email = loginUser.getUser_email();
	  
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("buy_no", buy_no);
		map.put("txtMovieWith", txtMovieWith);
		map.put("textContent", textContent);
		
		int result = uService.diaryUpdate(map); 
		
		if(result==1) {
			return "redirect:my_diary.do";
		}else {
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping("diaryDel.do") 
	public String diary_del(HttpSession session, String b_no) { 
		User loginUser = (User)session.getAttribute("loginUser");
		String email = loginUser.getUser_email();
	  
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("buy_no", b_no);
		map.put("write", "N");
		
		int result = uService.diaryDel(map);
		
		int result2 = uService.diaryBuylistUpdate(map);
		
		if(result==1&&result2==1) {
			return "ok";
		}else {
			return "fail";
		}
	}
	
	
	// 인증코드와 입력한 인증코드의 비교 메소드
	@ResponseBody
	@RequestMapping("myPageinfo.do") 
	public String codeCheck(HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		
		int point = rService.getPoint(loginUser.getUser_email());
		int coupon = uService.cListCount(loginUser);
		
		JSONArray jsa = new JSONArray();
		
		String al="";
		
		if(kalogin || ManageController.nalogin) {
			al="true";
		}
		
		jsa.add(point);
		jsa.add(coupon);
		jsa.add(al);
		
		return jsa.toJSONString();
	}
	
	@RequestMapping("kakaoLogin.do")
	public String kakaoLogin(String email, String name, String pwd, Model model,RedirectAttributes redirect) {
		
		User u = new User();
		int result = uService.idCheck(email);

		if(result==1) {
			u.setUser_email(email);
			User loginUser = uService.loginUser(u);	
			// model로 세션 등록
			model.addAttribute("loginUser",loginUser);
			model.addAttribute("tl","t");
			// redirect로 정보를 같이 넘긴다. 모델은  redirect로 넘어가지 않는다.
			redirect.addFlashAttribute("loginUser",loginUser);
			// index에 필요한 정보를 가져오기 위해 서블릿을 타야한다.
			kalogin = true;
			return "redirect:index.do";
		}else {
			u.setUser_email(email);
			u.setUser_name(name);
			u.setUser_nickname(name);
			u.setUser_marketing("Y");
			u.setUser_password(pwd);
			
			int result2 = uService.signUp(u);

			if(result2==1) {
				User loginUser = uService.loginUser(u);	
				// model로 세션 등록
				model.addAttribute("loginUser",loginUser);
				model.addAttribute("tl","t");
				// redirect로 정보를 같이 넘긴다. 모델은  redirect로 넘어가지 않는다.
				redirect.addFlashAttribute("loginUser",loginUser);
				// index에 필요한 정보를 가져오기 위해 서블릿을 타야한다.
				kalogin = true;
				
				System.out.println(email);
				return "redirect:index.do";
			}else {
				System.out.println(email);
				return "common/errorPage";
			}
		}
	}
}







