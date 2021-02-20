<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Anime | Template</title>


    <style>

    </style>
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
                        <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                        <span>공지사항</span>
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
                                        <h4>공지사항</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <table class="detail_notice">
                                <thead class="wthead_notice">
                                    <tr>
                                        <th id="short_notice">번호</th>
                                        <th id="short_notice">작성일</th>
                                        <th>글 제목</th>
                                        <th id="short_notice">조회수</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="n" items="${ nl }">
                                		<c:url var="noticeDetail" value="noticeDetail.do">
                                			<c:param name="notice_no" value="${ n.notice_no }"></c:param>
                                		</c:url>
                                    <tr>
                                        <td id="short_notice">${ n.notice_no }</td>
                                        <td id="short_notice">${ n.notice_date }</td>
                                        <td id="long_mybuylist" onclick="location.href='${noticeDetail}'">${ n.notice_title }</td>        
                                        <td id="short_notice">${ n.notice_count }</td>
                                        
                                    </tr>   
                                    </c:forEach>
                                </tbody>
                               </table>
                        </div>
                        <c:if test="${ loginUser.user_email eq 'admin@ddby.com' }">
                        <div> 
                        	<button class="btn_mywish notice_input_btn" onclick="location.href='noticewrite.do'">글 작성</button>
                        </div>
                        </c:if>
                    </div>
                   <div class="product__pagination">
                    <!-- [이전] -->
					<c:if test="${ pi.currentPage eq 1 }">
					</c:if>
					<c:if test="${ pi.currentPage ne 1 }">
						<c:url var="before" value="noticeList.do">
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
							<c:url var="pagination" value="noticeList.do">
								<c:param name="currentPage" value="${ p }"/>
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
					</c:forEach>
					
					<!-- [다음] -->
					<c:if test="${ pi.currentPage eq pi.maxPage }">
					</c:if>
					<c:if test="${ pi.currentPage ne pi.maxPage }">
						<c:url var="after" value="noticeList.do">
							<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
						</c:url> 
						<a href="${ after }">&nbsp;<i style="color:white; font-size: 15px;" class="fa fa-angle-double-right"></i></a>
					</c:if>
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