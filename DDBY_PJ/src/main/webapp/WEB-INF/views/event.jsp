<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>
    <meta charset="UTF-8">
    <title>Event</title>
</head>

<body>

    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <%@ include file="common/header.jsp" %>
    <!-- Header End -->

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="index.do"><i class="fa fa-home"></i> Home</a>
                        <span>이벤트</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Product Section Begin -->
    <section class="product-page spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="product__page__content">
                        <div class="product__page__title">
                            <div class="row">
                                <div class="col-lg-8 col-md-8 col-sm-8">
                                    <div class="section-title">
                                        <h4>이벤트</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row_movietrailer">
                        <c:forEach var="e" items="${ event }" >
                        
                            <div class="col-lg-4-categories col-md-6 col-sm-6">
                                <div class="product__item">
                                    <img class="product__trailer__pic set-bg" src="resources/puploadFiles/${ e.event_re_s_img }">
                                    <div class="product__item__text">
                                        <h5><a href="eventDetail.do?no=${ e.event_num }">${ e.event_title }</a></h5>
                                    </div>
                                    <input type="hidden" value="${ e.event_num }">
                                </div>
                            </div>
                        </c:forEach>
                        </div>
                        
                    </div>
                    <div class="product__pagination">
                    <!-- [이전] -->
					<c:if test="${ pi.currentPage eq 1 }">
					</c:if>
					<c:if test="${ pi.currentPage ne 1 }">
						<c:url var="before" value="event.do">
							<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
						</c:url>
						<a href="${ before }"><i class="fa fa-angle-double-left"></i></a>
					</c:if>
					
					<!-- 페이지 -->
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<a class="current-page" color="red" size="4"><b>${ p }</b></a>
						</c:if>
						
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="event.do">
								<c:param name="currentPage" value="${ p }"/>
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
					</c:forEach>
					
					<!-- [다음] -->
					<c:if test="${ pi.currentPage eq pi.maxPage }">
					</c:if>
					<c:if test="${ pi.currentPage ne pi.maxPage }">
						<c:url var="after" value="event.do">
							<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
						</c:url> 
						<a href="${ after }">&nbsp;<i style="color:white; font-size: 15px;" class="fa fa-angle-double-right"></i></a>
					</c:if>
					</div>
					
					<c:if test="${ loginUser.user_email eq 'admin@ddby.com' }">
	                    <div style="float: left">
	                    	<button onclick="location.href='eventwrite.do'">이벤트작성</button>
	                    </div>
                    </c:if>
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