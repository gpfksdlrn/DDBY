<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
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
                        <h2>비밀번호 찾기</h2>
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
                        <h3>이메일 입력</h3>
                        <form action="findPwd">
                            <div class="input__item">
                                <input oncontextmenu='return false' type="text" placeholder="Email address" id="find_email" name="email">
                                <span class="icon_mail"></span>
                            </div>
                            <div class="input__item">
                                <input type="text" placeholder="Code" id="code">
                                <span class="icon_check"></span>
                            </div>
                            <div class="code_btn_wrap">
	                            <button type="button" class="site-btn" id="mail_send">인증메일 전송</button>
	                            <button type="button" class="site-btn" onclick="codeCheck();">인증하기</button>
                        	</div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Signup Section End -->
	<!-- Footer Section Begin -->
	<%@ include file="common/footer.jsp" %>
	<!-- Footer Section End -->
	
	<script>
		var code;
		var email_text;
		
		$('#mail_send').click(function(){
 			var sw = 0;
 			
 			email_text = $('#find_email').val();
 			
			$.ajax({
				url: "idCheck.do",
				data: {id : email_text},
				type: "post",
				success: function(data){
					if(data=="fail"){
						alert("인증번호를 발송했습니다.");
						email();
					}else{
						alert("이메일 인증실패");
					}
				}
			}); 
			
			
		});
		
	    function email(){
	    	$.ajax({
				url:"emailSend.do",
				data:{id: email_text},
				type:"post",
				success:function(data){
					if(data=="fail"){
						alert("잘못된 이메일 형식 입니다.");
					}else{
						code=data;
					}
				}
			}); 
	    }
	    
	    
	    function codeCheck(){
	     	var inputCode = $('#code').val();

	    	$.ajax({
				url:"codeCheck.do",
				data:{inputCode:inputCode,code:code},
				type:"post",
				success:function(data){
					if(data=="ok"){
						alert("인증완료");
						location.href="changePwdPage.do?email="+$("#find_email").val();
					}else{
						alert("인증실패");
						$("#find_email").focus();
					}
				}
			})
	    }
	</script>
</body>

</html>