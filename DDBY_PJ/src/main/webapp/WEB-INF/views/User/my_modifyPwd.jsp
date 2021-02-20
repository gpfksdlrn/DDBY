<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<!-- Header Section Begin -->
<%@ include file="../common/header.jsp"%>
<!-- Header End -->

<head>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<link href="resources/css/myPage.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Anime | Template</title>
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<!-- Normal Breadcrumb Begin -->
	<%@ include file="../common/my_section.jsp"%>
	<!-- Normal Breadcrumb End -->

	<!-- Signup Section Begin -->
	<div class="wrapper">
		<div class="sidebar">
			<h2>Sidebar</h2>
			<ul class="menu">
				<li><a href="my_profile.do">프로필</a></li>
                <c:if test="${tl eq 'f'}">
                	<li><a href="my_changePwd.do">비밀번호 변경</a></li>
                	<li><a href="my_deleteUser.do">회원탈퇴</a></li>
                </c:if>
                <li><a href="my_buyList.do">구매내역</a></li>
                <li><a href="my_coupon.do">쿠폰내역</a></li>
                <li><a href="my_point.do">포인트내역</a></li>
                <li><a href="my_wishMovie.do">기대되는 영화</a></li>
                <li><a href="my_watching.do">내가 본 영화</a></li>
                <li><a href="my_diary">무비다이어리</a></li>
			</ul>
		</div>
		<div class="main_content">
			<div class="header">Welcome!! Have a nice day.</div>
			<div class="info">
				<!-- 새 비밀번호 -->
				<div id="tab-2" class="tabcontent current">
					<div class="login__form singup__form">
						<h3>새로운 비밀번호 입력</h3>
						<form action="modifyPwd.do" method="post">
							<div class="input__item">
								<input type="password" placeholder="Now Password" id="pwd0" name="now_pwd"> 
								<span class="icon_lock"></span>
							</div>
							<div class="input__item">
								<input type="password" placeholder="New Password" id="pwd1"> 
								<span class="icon_lock"></span>
							</div>
							<div class="input__item">
								<input type="password" placeholder="One more input" id="pwd2" name="password">
								<span class="icon_lock"></span>
							</div>
							<button type="submit" class="site-btn" onclick="return changePwd();">비밀번호 변경</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer Section Begin -->
	<%@ include file="../common/footer.jsp"%>
	<!-- Footer Section End -->
	<script>
		$(document).ready(function(){
			var msg = "${msg}";
			
			if(msg==1){
				alert("새로운 비밀번호로 다시 로그인 해주세요.");
				location.href="index.do";
			}else if(msg==2){
				alert("비밀번호 변경 중 에러 발생 /n계속 발생할 경우 고객센터에 문의하세요.");
				location.href="my_deleteUser.do";
			}else if(msg==3){
				alert("패스워드가 틀렸습니다.");
				location.href="my_deleteUser.do";
			}
		});	
		
		function changePwd(){
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