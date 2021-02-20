<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="zxx">
	<!-- Header Section Begin -->
    <%@ include file="../common/header.jsp" %>
    <!-- Header End -->

<head>
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	<link href="resources/css/myPage.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/04dc22ed0b.js" crossorigin="anonymous"></script>
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
            <div class="header">내가 본 영화</div>
            <div class="info"> 
                <!-- 내가 본 영화 -->
                <c:if test="${fn:length(bl)>0}">
                <div class="info">
                        <div class="content_mywish">
                            <div class="dataInform_mywish">
                                <div class="layoutSubbox_mywish">
                                
                                  <c:forEach var="i" begin="0" end="${fn:length(bl)-1}">
                                  
                                    <div class="pOrderSearch_mywish">
                                        <div class="pLeft_mywish">
                                            <div class="Lsit-Saction_mywish">          	
                                                <div class="mywish_img_div">
                                                    <img src="resources/img/poster/${ movie[i].movie_poster }" class="mywish_img_index">
                                                </div>
                                            </div>
                                            
                                            <div class="pWrap_mywish">
                                                <div class="pTitle_mywish">${ movie[i].movie_title }
                                                	<p>${ movie[i].movie_title_eng }</p>
                                                </div>
                                                <div class="pTitle_detail">
                                                    <div>${ bl[i].showtime }</div>
                                                    <div>또보영 ${ bl[i].theater }관 / ${ bl[i].buy_person }명</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="pRight_mywish">
                                            <div class="wishCancle_mywish">
                                            	<button class="btn_mywish btn_wish"><input type="hidden" value="${ bl[i].buy_no }"/>x</button>
                                            </div>
                                            <div class="pMovieDiary_mywish">
                                            	<button type="button" class="btn_mywish" onclick="moveDiary();">Movie_Diary</button>
                                            </div>
                                        </div>
                                    </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                            <div class="product__pagination">
                    <!-- [이전] -->
					<c:if test="${ pi.currentPage eq 1 }">
					</c:if>
					<c:if test="${ pi.currentPage ne 1 }">
						<c:url var="before" value="my_watching.do">
							<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
						</c:url>
						<a href="${ before }"><i class="fa fa-angle-double-left"></i></a>
					</c:if>
					
					<!-- 페이지 -->
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<a class="current-page" size="4"><b>${ p }</b></a>
						</c:if>
						
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="my_watching.do">
								<c:param name="currentPage" value="${ p }"/>
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
					</c:forEach>
					
					<!-- [다음] -->
					<c:if test="${ pi.currentPage eq pi.maxPage }">
					</c:if>
					<c:if test="${ pi.currentPage ne pi.maxPage }">
						<c:url var="after" value="my_watching.do">
							<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
						</c:url> 
						<a href="${ after }">&nbsp;<i style="color:white; font-size: 15px;" class="fa fa-angle-double-right"></i></a>
					</c:if>
					</div>
					</c:if>
					<c:if test="${fn:length(bl)<=0}">
						관람한 영화가 존재하지 않습니다.
					</c:if>
                	</div>
            </div>
        </div>
    </div>
    <!-- Footer Section Begin -->
	<%@ include file="../common/footer.jsp" %>
	<!-- Footer Section End -->
    <script>
        $('.btn_wish').click(function(){
	   		var b_no = $(this).find('input').val();
	       	 $.ajax({
	           	url: "watchDelBtn.do",
	           	data: { b_no:b_no }, 
	           	type: "POST",
	           	success: function(data){
	           		if(data=="ok"){
	           			alert("삭제되었습니다.");
	           			location.href="my_watching.do";
	           		}else{
	           			alert("삭제에 실패하였습니다. \n 잠시 후 재실행 해주세요.");
	           		}
	           	}
			}); 
       });
        
        function moveDiary(){
        	var buy_no = $('.btn_mywish').parent().parent().find('input').val();
        	
        	location.href="my_diary.do?bnum="+buy_no;
        }
    </script>
</body>

</html>