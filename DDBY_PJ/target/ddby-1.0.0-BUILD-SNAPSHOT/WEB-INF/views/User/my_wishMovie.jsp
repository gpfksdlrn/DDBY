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
    <title>DDOBOYUNG</title>
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
            <div class="header">기대되는 영화</div>
            <div class="info">
                <!-- 기대되는 영화 -->
                <div class="col-lg-12">
                    <div class="product__page__content">
                        <div class="row_wish_categories">
                        <!-- forEach 시작 -->
                        <c:forEach var ="w" items="${ wishList }" varStatus="status">
                            <div class="col-lg-4-categories col-md-6 col-sm-6">
                                <div class="product__item wish_item">
                                    <div class="wish__item__pic set-bg" data-setbg="resources/img/poster/${w.movie_poster}">
                                        <i class="far fa-times-circle"></i>
                                        <input type="hidden" value="${w.movie_title}">
                                    </div>
                                    <div class="wish__item__text">
                                        <h5><a href="#">${w.movie_title}</a></h5>
                                        <p>${w.movie_release_date} 개봉</p>
                                    </div>
                                </div>
                            </div>
                        <!-- forEach 끝 -->
                        </c:forEach>
                        </div>
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
	        $('.fa-times-circle').click(function(){
	        	var mTitle=$(this).parent().find('input').val();
	        	var sw=1;
	       		
	        	$.ajax({
		           	url: "wishBtn.do",
		           	data: {mTitle:mTitle,
		           			sw:sw}, 
		           	type: "POST",
		           	success: function(data){
		           		if(data=="delete"){
			           		alert("'기대되는 영화'에서 삭제되었습니다.");
			           		location.reload();
		           		}
		           	}
				});
	        });
	    });
    </script>
</body>

</html>