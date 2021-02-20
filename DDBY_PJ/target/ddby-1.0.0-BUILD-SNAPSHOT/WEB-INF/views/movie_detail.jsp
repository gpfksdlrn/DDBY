<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<title>영화 상세보기</title>

</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<%@ include file="common/header.jsp"%>
	<!-- Header End -->

	<!-- Breadcrumb Begin -->
	<div class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12"></div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Anime Section Begin -->
	<section class="anime-details spad">
		<div class="container">
			<div class="anime__details__content">
				<div class="row">
					<div class="col-lg-3" style="height: 440px;">
						<div class="anime__details__pic set-bg"
							data-setbg="resources/img/poster/${ movie.movie_poster }"></div>
					</div>
					<div class="col-lg-9">
						<div class="anime__details__text">
							<div class="anime__details__title">
								<h3>${ movie.movie_title }</h3>
								<span>${ movie.movie_title_eng }</span>
							</div>
							<p>${ movie.movie_story }</p>
							<div class="anime__details__widget">
								<div class="row">
									<div class="col-lg-12 col-md-6">
										<ul>
											<li><span>감독:</span> ${ movie.movie_director }</li>
											<li><span>배우:</span> ${ movie.movie_actor }</li>
											<li><span>장르:</span> ${ movie.movie_tem }</li>
											<c:if test="${ movie.movie_age eq 0 }">
												<li><span>관람연령:</span> 전체이용가</li>
											</c:if>
											<c:if test="${ movie.movie_age ne 0 }">
												<li><span>관람연령:</span> ${ movie.movie_age }세 이상</li>
											</c:if>
											<li><span>개봉일:</span> ${ movie.movie_release_date }</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="anime__details__btn">
								<a href="#" class="follow-btn"><i class="far fa-heart"></i>찜 하기</a>
								<a href="showtime.do" class="watch-btn"><span>예매하기</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="section-title">
				<h4>STILL CUT</h4>
			</div>
			<div style="transform: scale(0.8); margin-bottom: 20px">
				<div class="movie_detail_stillcut">
					<div class="hero__slider owl-carousel">
						<c:forEach var="s" items="${ stillimg }">
							<div class="hero__items set-bg"
								data-setbg="resources/img/stillcut/${ s }">
								<div class="hero__row">
									<div class="col-lg-6">
										<div class="hero__text"></div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="row"></div>
		</div>
	</section>
	<!-- Anime Section End -->

	<!-- Footer Section Begin -->
	<%@ include file="common/footer.jsp"%>
	<!-- Footer Section End -->
	
	<script>
	var sw = 0;
	var loginUser = "${loginUser.user_email}";
	
	$(document).ready(function(){
		sw = "${sw}";
		if(sw==1){
			$('.follow-btn').empty();
   			$('.follow-btn').append('<i class="fas fa-heart"></i>찜 해제');
		}else{
			$('.follow-btn').empty();
   			$('.follow-btn').append('<i class="far fa-heart"></i>찜 하기');
		}
	});
	
	
	var mTitle = "${ movie.movie_title }";
	$('.follow-btn').click(function(){
		if(loginUser==""){
			alert("로그인이 필요한 서비스 입니다.");
			location.href="loginPage.do";
		}else{
			$.ajax({
	           	url: "wishBtn.do",
	           	data: {mTitle:mTitle,
	           			sw:sw}, 
	           	type: "POST",
	           	success: function(data){
	           		 if(data=="input"){
	           			$('.follow-btn').empty();
	           			$('.follow-btn').append('<i class="fas fa-heart"></i>찜 해제');
	           			sw = 1;
	           			var result = confirm("'기대되는 영화'에 등록되었습니다.\n'기대되는 영화'로 이동하시겠습니까?");
	           			if(result){
	           			    location.href='my_wishMovie.do';
	           			}
	           		 }else if(data=="delete"){
	           			$('.follow-btn').empty();
	           			$('.follow-btn').append('<i class="far fa-heart"></i>찜 하기');
	           			sw = 0;
	           		 }else{
	           			alert("찜 통신 실패");
	           		 }
	           	}
			});
		}
	});
	</script>
</body>
</html>