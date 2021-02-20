<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"></script>
    <meta charset="UTF-8">
    <title>Anime | Template</title>
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
                        <h2>로그인</h2>
                        <p>Welcom!</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Normal Breadcrumb End -->

    <!-- Login Section Begin -->
    <section class="login spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="login__form">
                        <h3>Login</h3>
                        <form action="login.do" method="post">
                            <div class="input__item">
                                <input type="text" placeholder="Email address" name="user_email">
                                <span class="icon_mail"></span>
                            </div>
                            <div class="input__item">
                                <input type="password" placeholder="Password" name="user_password">
                                <span class="icon_lock"></span>
                            </div>
                            <button type="submit" class="site-btn">Login Now</button>
                        </form>
                        <a href="findPwd.do" class="forget_pass">비밀번호를 잊으셨나요?</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="login__register">
                        <h3>계정이 존재하지 않으신가요?</h3>
                        <a href="signUpPage.do" class="primary-btn">SIGN UP</a>
                    </div>
                    <div class="login__social__links">
                        <span>or</span>
                        <ul>
                            <li>
	                            <a href="${url}">
	                            	<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
	                            </a>
                            </li>
                            <li>
                            	<a id="kakao-login-btn"></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="login__social">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-6">
                    </div>
                </div>
            </div>
        </div>
    </section>
    
         <form action="kakaoLogin.do" method="post">
		 	<input style="visibility: hidden;" name="email" id="email" value="">
		 	<input style="visibility: hidden;" name="name" id="name" value="">
		 	<input style="visibility: hidden;" name="pwd" id="pwd" value="">
			<button class="login_button_form" style="visibility: hidden;"></button>
		</form>
    <!-- Login Section End -->

    <!-- Footer Section Begin -->
    <%@ include file="common/footer.jsp" %>
    <!-- Footer Section End -->

	<script>
		$(document).ready(function(){
			var msg = "${errorMsg}";
			
			if(msg!=""){
				alert(msg);
				location.href="loginPage.do";
			}
		});
		
		//네이버 로그인
		$(function(){
		    var naverLogin = new naver.LoginWithNaverId({
		        clientId: "{ClientId}",
		        callbackUrl: "{Callback URL}",
		        isPopup: true,
		        loginButton: {color: "green", type: 3, height: 45}
		    });
		    naverLogin.init();
		})//

	</script>
	
	
	 <script type='text/javascript'>
	        //<![CDATA[
	        // 사용할 앱의 JavaScript 키를 설정해 주세요.
	        // Kakao.init('d9e38ce6222396ec9c46084186906ad7'); 헤더 영역에 넣어줌
	        // 카카오 로그인 버튼을 생성합니다.
	        Kakao.Auth.createLoginButton({
	            container: '#kakao-login-btn',
	            success: function (authObj) {
	                //console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력
					
	                // 사용자정보 요청받는 ajax
	                Kakao.API.request({
						url:"/v2/user/me",
						success : function(res){
							$("#token").val(Kakao.Auth.getAccessToken()); 	// 로그아웃에 활용할 토큰
	                        $("#email").val(res.kakao_account && res.kakao_account.email);
	                        $("#name").val(res.properties.nickname);		// 회원 닉네임(이름)
	                        $("#pwd").val(res.id); 							// (res.id=회원 고유 번호)를 비번으로 지정
	                        $('.login_button_form').trigger("click");
						},
						
						fail: function (err) {
			                alert(JSON.stringify(err));
			            }
					})
					var token = authObj.access_token;
	            },
	            fail: function (err) {
	                alert(JSON.stringify(err));
	            }
	        });
	        
		</script>
		
		
</body>

</html>