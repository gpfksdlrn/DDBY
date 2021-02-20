<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

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

    <section class="normal-breadcrumb set-bg" data-setbg="resources/img/signup_img.png">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>비밀번호 변경</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="signup spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-10">
                    <div class="login__form singup__form">
                        <h3>새로운 비밀번호 입력</h3>
                        <form action="changePwd.do" method="post">
                            <div class="input__item">
                                <input type="password" placeholder="Password" id="pwd1">
                                <span class="icon_lock"></span>
                                
                            </div>
                            <div class="input__item">
                                <input type="password" placeholder="One more input" name="user_password" id="pwd2">
                                <span class="icon_lock"></span>
                            </div>
                            <button type="submit" class="site-btn" onclick="return chkPW();">비밀번호 변경</button>
                            <input type="hidden" value="${email}" name="user_email"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<!-- Footer Section Begin -->
	<%@ include file="common/footer.jsp" %>
	<!-- Footer Section End -->
	
	<script>
		$(document).ready(function() {
			var msg = "${msg}";
			
			if(msg==1){
				alert("비밀번호 변경이 완료되었습니다.");
				location.href="index.do";
			}else if(msg==2){
				alert("비밀번호 변경에 실패하였습니다.");
				location.href="changePwdPage.do";
			}
		});
		
		function chkPW(){
			var pw = $("#pwd2").val();
			var num = pw.search(/[0-9]/g);
			var eng = pw.search(/[a-z]/ig);
			var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
			
			if($('#pwd1').val()==$('#pwd2').val()){
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
			}else{
				alert("패스워드가 일치하지 않습니다.");
				return false;
			}
		}
	</script>
</body>

</html>