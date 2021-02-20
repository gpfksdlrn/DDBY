<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <%@ include file="common/header.jsp" %>
    <!-- Header End -->

    <!-- Normal Breadcrumb Begin -->
    <section class="normal-breadcrumb set-bg" data-setbg="resources/img/signup_img.png">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>회원가입</h2>
                        <p>Welcome!</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Normal Breadcrumb End -->

    <!-- Signup Section Begin -->
    <section class="signup spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-10">
                    <div class="login__form singup__form">
                        <h3>회원가입</h3>
                        <form action="signUp.do" method="post" autocomplete="off">
                            <div class="input__item">
                                <input type="text" placeholder="Email address" id="userEmail" name="user_email" style="width: 85%;">
                                <button class="btn_mywish cfBtn" type="button" onclick="email();" >인증번호 발송</button>
                                <p class="ex_id" id="ex_id">이미 등록된 이메일 입니다.</p>
                                <input type="hidden" name="idDupl" id="idDupl" value="0">
                                <span class="icon_mail"></span>
                            </div>
            
				            <!-- 인증코드 입력 텍스트폼이랑 제한시간 -->
				            <div class="input__item code_wrap">
				               <input type="text" placeholder="인증코드를 입력하세요." id="ranNum" name="ranNum" style="width: 50%;">
				               <button class="btn_mywish cfBtn" style="width: 50px;" type="button" onclick="codeCheck();" disabled="disabled">확인</button>
				               <span><i class="fas fa-key"></i></span>
				               <div class="timelimit_signup">제한시간 : </div>
				            </div>
				            <input type="hidden" id="confirmMail" value="0">
				            	
                            <div class="input__item">
                                <input type="text" placeholder="Your Name" id="userName" name="user_name">
                                <span class="icon_profile"></span>
                            </div>
                            <div class="input__item">
                                <input type="text" placeholder="Your NickName" id="userNickname" name="user_nickname">
                                <input type="hidden" name="nickDupl" id="nickDupl" value="0">
                                <span class="icon_id-2_alt"></span>
                            </div>
                            <div class="input__item">
                                <input type="password" placeholder="Password" id="pwd" name="user_password">
                                <span class="icon_lock"></span>
                            </div>
                           <div class="Agree" style="background-color: lightgray;">
                                <br>
                                <input type="checkbox" value="all" id="all">
                                <label for="all">전체동의</label>
                                <span>(전체동의시 적립금 1,000포인트 지급)</span>
                                <hr>
                                <input type="checkbox" value="policy" id="policy" class="signup_checkbox">
                                <label for="policy">동의함</label><span>[필수] 이용약관 동의</span><a href="./index.html" onclick="window.open(this.href, '', 'width=600, height=630'); return false;">자세히보기</a><br>
                                <input type="checkbox" value="privacy" id="privacy" class="signup_checkbox">
                                <label for="privacy">동의함</label><span>[필수] 개인정보처리방침 동의</span><a href="./index.html" onclick="window.open(this.href, '', 'width=600, height=630'); return false;">자세히보기</a><br><br>
                                <span>[선택] 정보 수신 동의</span><br>
                                <br>
                                <input type="checkbox" id="marketing_m" class="signup_checkbox"><label for="marketing_m" >동의함</label><span>이메일 수신 동의</span><a href="./index.html" onclick="window.open(this.href, '', 'width=600, height=630'); return false;">자세히보기</a>
                            	<input type="hidden" name="user_marketing" id="user_marketing" value="N">
                            </div>
                            <button type="submit" class="site-btn" onclick="return validate();" style="margin-top: 20px;">Sign up</button>
                    	  </form>
                        <h5>Already have an account? <a href="loginPage.do">Log In!</a></h5>
                    </div>
                </div>
                <!--<div class="col-lg-6">
                    <div class="login__social__links">
                        <h3>Login With:</h3>
                        <ul>
                            <li><a href="#" class="facebook"><i class="fa fa-facebook"></i> Sign in With Facebook</a>
                            </li>
                            <li><a href="#" class="google"><i class="fa fa-google"></i> Sign in With Google</a></li>
                        </ul>
                    </div>
                </div>-->
            </div>
        </div>
    </section>
    <!-- Signup Section End -->

    <!-- Footer Section Begin -->
    <%@ include file="common/footer.jsp" %>
    <!-- Footer Section End -->

</body>

<script>
	var point="회원가입해주셔서 감사합니다.";
	var clear=0;
	var code;
	
	$(document).ready(function(){
		idcss();
	});
	
	function validate(){
		if($('#idDupl').val()==0){
			alert("이미 존재하는 이메일입니다.");
			$('#userEmail').focus();
			return false;
		}else if($('#confirmMail').val()==0){
			alert("이메일을 인증해주세요.")
			$('#userEmail').focus();
			return false;
		}else if($('#userName').val()==''){
			alert("이름을 입력해주세요.");
			$('#userName').focus();
			return false;
		}else if($('#userNickname').val()==''){
			alert("닉네임을 입력해주세요.");
			$('#userNickname').focus();
			return false;
		}else if($('#nickDupl').val()==0){
			alert("사용할 수 없는 닉네임입니다.");
			$('#userNickname').focus();
			return false;
		}else if($('#pwd').val()==''){
			alert("비밀번호를 입력해주세요.");
			$('#pwd').focus();
			return false;
		}else{
			if(chkPW()){
				if(check()){
					alert(point);
					return true;
				}else{
					return false;
				}
			}else{
				return false;
			}
		}
	}
	
	function chkPW(){
		var pw = $("#pwd").val();
		var num = pw.search(/[0-9]/g);
		var eng = pw.search(/[a-z]/ig);
		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		
		if(pw.length < 8 || pw.length > 20){
			 alert("비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.");
	         return false;
		}else if(pw.search(/\s/) != -1){
			alert("비밀번호는 공백없이 입력 해주세요.");
			return false;
		}else if(num<0 || eng < 0 || spe < 0){
			alert("영문,숫자,특수문자를 혼합하여 입력해주세요.");
			return false;
		}else{
			return true;
		}
	}

	$(function(){
		$("#userEmail").on("keyup",function(){
			var userEmail = $(this).val();
			$.ajax({
				url:"idCheck.do",
				data:{id:userEmail},
				type:"post",
				success:function(data){
					if(data=="ok"){
						$('.ex_id').css("display","none");
						$('.cfBtn').attr('disabled',false);
						$('#idDupl').val(1);
					}else{
						$('.ex_id').css("display","block");
						$('.cfBtn').attr('disabled',true);
						$('#idDupl').val(0);
					}
				}
			})
		});
	});
	
	$(function(){
		$("#userNickname").on("keyup",function(){
			var userNick = $(this).val();
			$.ajax({
				url:"nickNameCheck.do",
				data:{nick:userNick},
				type:"post",
				success:function(data){
					if(data=="ok"){
						$('#nickDupl').val(1);
					}else{
						$('#nickDupl').val(0);
					}
				}
			})
		});
	});
	
	function idcss(){
		$('.ex_id').css("font-size","18px");
		$('.ex_id').css("color","#e53637");
		$('.ex_id').css("margin-top","10px");
		$('.ex_id').css("display","none");
		$('.cfBtn').attr('disabled',true); // 인증번호 버튼 비활성화
	}
	
	 $("#all").click(function(){
         if($("#all").is(":checked")){
            $(".signup_checkbox").prop("checked",true); 
         }
         else{
             $(".signup_checkbox").prop("checked",false); 
        }
    });

    $(".signup_checkbox").click(function(){
      var i =0;
      $(".signup_checkbox").each(function(index){
          if($(this).is(":checked")==false){
              i=1;
          }
      });
      if(i==1){
          $("#all").prop("checked",false);
      }else{
          $("#all").prop("checked",true);
      }
  	});
	
    function check(){
    	if($('#policy').is(":checked")==true&&$('#privacy').is(":checked")==true){
    		if($('#marketing_m').is(":checked")){
    			$('#user_marketing').val('Y');
    			point="회원가입해주셔서 감사합니다.\n포인트 적립 1000포인트";
    		}
    		return true;
    	}else{
    		alert("필수 약관을 체크해주세요.");
    		return false;
    	}
    }
    
    function email(){
    	var userEmail = $('#userEmail').val();
    	$.ajax({
			url:"emailSend.do",
			data:{id:userEmail},
			type:"post",
			success:function(data){
				if(data=="fail"){	// 이메일 형식이 적절하지 않으면 fail
					alert("잘못된 이메일 형식 입니다.");
				}else{
					code=data;
					alert("인증코드를 발송하였습니다.")
					timelimit(); // 인증번호 시간초
				}
			}
		})
    }
    
    
    function codeCheck(){
     	var inputCode = $('#ranNum').val();

    	$.ajax({
			url:"codeCheck.do",
			data:{inputCode:inputCode,code:code},
			type:"post",
			success:function(data){
				if(data=="ok"){
					$('#confirmMail').val(1);
					clear=1;
					$('.code_wrap').css('display','none');	// 인증코드 숨기기
					$('.cfBtn').css('display','none');	// 인증번호 버튼 숨기기
					$('#userEmail').css('width','100%');	// 인증번호 버튼 숨기기
					$('#userEmail').attr('readonly', true); // 이메일 수정 불가
					$('#userEmail').css('background', '#333');
					$('.cfBtn').attr('disabled',true); // 인증번호 버튼 비활성화
					alert("인증완료");
				}else{
					alert("인증실패");
				}
			}
		})
    }
    
 	// 인증번호 시간초
    function timelimit() {
		// 5분 300초
		var count=300;
		// 1초마다 실행
		var countdown = setInterval(function (){
			$('.timelimit_signup').text("");
			// 분
			var min = parseInt((count%3600)/60);
			// 초
			var sec = count % 60;
			// 10초 이하일 때 09,08 식으로 표기
			if(sec<10){
				sec = "0" + sec;
			}
			$('.timelimit_signup').text("제한시간 : " + min +"분 " + sec+"초");
			
			if(count == 0){		// 시간초가 완료 되었을 때
				clearInterval(countdown);
				alert("인증번호가 만료되었습니다. \n다시 메일을 인증해주세요.");
			}else if(clear==1){ // 인증코드 확인이 완료되었을 때
				clearInterval(countdown);
			}
			count--;
		}, 1000);
    }
</script>
</html>