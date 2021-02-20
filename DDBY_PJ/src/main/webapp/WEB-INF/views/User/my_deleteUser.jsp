<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
	<!-- Header Section Begin -->
    <%@ include file="../common/header.jsp" %>
    <!-- Header End -->

<head>
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
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
	<%@ include file="../common/my_section.jsp" %>
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
                <!-- 회원탈퇴 -->
                <div>
                    <div class="login__form singup__form">
                        <h3>회원탈퇴</h3>
                        <form action="deleteUser.do" method="post">
                            <div class="input__item">
                                    <input type="password" placeholder="Password" id="pwd1">
                                    <span class="icon_lock"></span>
                            </div>
                            <div class="input__item">
                                    <input type="password" placeholder="One more input" id="pwd2" name="password">
                                    <span class="icon_lock"></span>
                            </div>
                            <button type="submit" class="site-btn" onclick="return deleteUser();">회원탈퇴</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer Section Begin -->
	<%@ include file="../common/footer.jsp" %>
	<!-- Footer Section End -->
	<script>
		$(document).ready(function(){
			var msg = "${msg}";
			
			if(msg==1){
				alert("삭제가 완료되었습니다.");
				location.href="index.do";
			}else if(msg==2){
				alert("패스워드가 틀렸습니다.");
				location.href="my_deleteUser.do";
			}
		});
	
	
		function deleteUser(){
			if($('#pwd1').val()==$('#pwd2').val()){
				if(confirm('정말로 계정을 삭제하시겠습니까?')){
					return true;
				}else{
					return false;
				}
			}else{
				alert("패스워드가 일치하지 않습니다.");
				return false;
			}
		}
	</script>
</body>

</html>