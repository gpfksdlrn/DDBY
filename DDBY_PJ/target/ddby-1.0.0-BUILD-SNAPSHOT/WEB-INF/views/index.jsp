<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>DDOBOYUNG</title>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <%@ include file="common/header.jsp" %>
    <!-- Header End -->

<!-- <div style="transform: scale(0.9);"> -->
    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="hero__slider owl-carousel">
	             <c:forEach var="p" items="${ Poster }" begin="0" end="1" step="1">
                        <c:url var="eventDetail" value="eventDetail.do">
                        	<c:param name="no" value="${p.event_num}"/>
                        </c:url>
	              	<div class="hero__items set-bg" data-setbg="resources/puploadFiles/${ p.event_re_b_img }" onclick="location.href='${eventDetail}'">
			            <div class="hero__row">
			                <div class="col-lg-6">
			                    <div class="hero__text"></div>
			                </div>
			            </div>
			        </div>
	             </c:forEach>
	             
	            <c:forEach var="p" items="${ Poster }" begin="2" end="3" step="1">
          	        <c:url var="movieDetail" value="movieDetail.do">
                    	<c:param name="title" value="${p.movie_title}"/>
                    </c:url>
		            <div class="hero__items set-bg" data-setbg="resources/img/poster/${ p.movie_big_img}" onclick="location.href='${ movieDetail }'">
	                    <div class="hero__row">
	                        <div class="col-lg-6">
	                            <div class="hero__text">
	                                <div class="label">${ p.movie_tem }</div>
	                                <h2>${p.movie_title}</h2>
	                                <p>${p.movie_headline}</p>
	                                <a href="showtime.do"><span>예매하기</span></a>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	             </c:forEach>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="trending__product">
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-8">
                                <div class="section-title">
                                    <h4>MOVIE SELECTION</h4>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <div class="btn__all">
                                    <a href="movieDetail.do" class="primary-btn">View All <span class="arrow_right"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="row_select">
                            <iframe width="850" height="388" src="https://www.youtube.com/embed/${ranmovie.movie_youtube}"></iframe>    
                            <img class="post_index" src="resources/img/poster/${ranmovie.movie_poster}" style="margin-left: 20px;">
                        </div>
                    </div>
                    <div class="popular__product">
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-8">
                                <div class="section-title">
                                    <h4>EVENT</h4>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <div class="btn__all">
                                    <a href="event.do" class="primary-btn">View All <span class="arrow_right"></span></a>
                                </div>
                            </div> 
                        </div>
                         <div class="row" style="flex-wrap: nowrap;">
                         <c:forEach var="e" items="${ Event }" begin="0" end="3" step="1">
                         	<c:url var="eventDetail" value="eventDetail.do">
                         		<c:param name="no" value="${e.event_num}"/>
                         	</c:url>
                            <div class="event_index" onclick="location.href='${eventDetail}'">
                            <img src="resources/puploadFiles/${ e.event_re_s_img }" style="height: 100%; width: 100%; object-fit: cover;"></div>
                        </c:forEach>
                        </div>
                    </div>
                    <div class="recent__product">
                        <div class="row" style="justify-content: space-around;">
                            <div class="col-lg-8 col-md-8 col-sm-8">
                                <div class="section-title">
                                    <h4>NOTICE</h4>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <div class="btn__all">
                                    <a href="noticeList.do" class="primary-btn">View All <span class="arrow_right"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <ul class="notic_index">
                            <c:forEach var="n" items="${ Notice }"  begin="0" end="2" step="1">
                                <c:url var="noticeDetail" value="noticeDetail.do">
                         			<c:param name="notice_no" value="${n.notice_no}"/>
                         		</c:url>
                                <li style="width: 100%;">
                                    <a href="${ noticeDetail }">${ n.notice_title }</a>
                                    <span class="notic_day_index" >${ n.notice_date }</span>
                                </li>
                            </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<!-- Product Section End -->

<!-- Footer Section Begin -->
<%@ include file="common/footer.jsp" %>
<!-- Footer Section End -->
</body>
</html>
