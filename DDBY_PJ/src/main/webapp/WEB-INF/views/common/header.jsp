<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="resources/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="resources/css/owl.carousel.min.css">
    <link rel="stylesheet" type="text/css" href="resources/css/elegant-icons.css">
    <link rel="stylesheet" type="text/css" href="resources/css/plyr.css">
    <link rel="stylesheet" type="text/css" href="resources/css/nice-select.css">
    <link rel="stylesheet" type="text/css" href="resources/css/slicknav.min.css">
    <link rel="stylesheet" type="text/css" href="resources/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />

</head>
<body>
    <header class="header">
        <div class="container">
            <div class="hero__row">
                <div class="col-lg-2">
                    <div class="header__logo">
                        <a href="index.do">
                            <img src="resources/img/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li><a href="moviechart.do">무비차트</a></li>
                                <li><a href="movietrailer.do">무비트레일러</a></li>
                                <li><a href="showtime.do">예매</a></li>
                                <li><a href="scheduler.do">상영시간표</a></li>
                                <li><a href="event.do">이벤트</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-2">
                    
						<c:choose>
							<c:when test="${!empty loginUser.user_email}">
								<div class="header__right" id="login_header">
			                        <input type="text" class="search_text" style="display: none;">
									<a class="search-switch" onclick="search_text_on();">
			                            <span class="icon_search"></span>
			                        </a>
									<a href="my_profile.do"><span class="icon_profile" style="color: #78B13E;"></span></a>
		                        	<a href="javascript:logout();"><i class="fas fa-door-open"></i></a>
			                    </div>
							</c:when>
							<c:otherwise>
								<div class="header__right">
				                    <input type="text" class="search_text" style="display: none;">
									<a class="search-switch" onclick="search_text_on();">
			                            <span class="icon_search"></span>
			                        </a>
									<a href="loginPage.do"><span class="icon_profile"></span></a>
								</div>
							</c:otherwise>
						</c:choose>
                    </div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>
    <script>
    	var searchsw = 0;
    	var searchText = "";
	
	    function search_text_on(){
	        if(searchsw==0){
	            $('.search_text').css("display","inline-block");
	            $('.header__right').css("width","320px");
	            $('#login_header').css("width","351px");
	            searchsw=1;
	        }else{
	            searchText = $('.search_text').val();
	            location.href="searchResult.do?searchText="+searchText;
	        }
	    }
	    
	    $('.search_text').keyup(function(){
	    	if(window.event.keyCode==13){
	    		search_text_on();
	    	}
		});
	    
        Kakao.init('80738b8187750e295952905b3e7606c0');
		
        function logout(){
        	window.location.href = "logout.do?token=" + Kakao.Auth.getAccessToken();
        }
	</script>
</body>
</html>