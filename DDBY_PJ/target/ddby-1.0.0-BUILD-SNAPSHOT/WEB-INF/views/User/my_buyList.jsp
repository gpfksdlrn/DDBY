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
            <div class="header">구매내역</div>
            <div class="info">
                <!-- 구매내역 -->
                <div>
                    <table class="detail_wdetail">
                        <thead class="wthead_wdetail">
                            <tr>
                                <th id="short_wdetail">번호</th>
                                <th>결제일시</th>
                                <th>영화제목</th>
                                <th>결제금액</th>
                                <th>결제방식</th>
                                <th>비고</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="b" items="${ bl }">
                            <tr>
                                <td id="short_wdetail">${ b.buy_no }</td>
                                <td>${ b.buy_date }</td>
                                <td id="long_mybuylist">${ b.movie_title }</td>
                                <td>${ b.pay_money }</td>
                                <td>${ b.pay_way }</td>
                                <td>
                                <button class="refund_btn">예매취소</button>
                                <input type="hidden" value="${b.showtime}" class="show">
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="product__pagination">
                    <!-- [이전] -->
					<c:if test="${ pi.currentPage eq 1 }">
					</c:if>
					<c:if test="${ pi.currentPage ne 1 }">
						<c:url var="before" value="my_buyList.do">
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
							<c:url var="pagination" value="my_buyList.do">
								<c:param name="currentPage" value="${ p }"/>
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
					</c:forEach>
					
					<!-- [다음] -->
					<c:if test="${ pi.currentPage eq pi.maxPage }">
					</c:if>
					<c:if test="${ pi.currentPage ne pi.maxPage }">
						<c:url var="after" value="my_buyList.do">
							<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
						</c:url> 
						<a href="${ after }">&nbsp;<i style="color:white; font-size: 15px;" class="fa fa-angle-double-right"></i></a>
					</c:if>
					</div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer Section Begin -->
	<%@ include file="../common/footer.jsp" %>
	<!-- Footer Section End -->
    <script>
    var today = new Date();
    	
    	$(document).ready(function(){
     		$('.refund_btn').each(function(index, item){
    			
    			var ymd = $(this).parent().find('input').val();
    			var date = new Date(ymd);
    			date.setMinutes(date.getMinutes()-20);
    			
    			if(date<today){
    				$(this).text("환불불가");
    				$(this).attr("disabled","disabled");
    				$(this).css("border","0px");
    				$(this).css("cursor","default");
            	} 
    		});
    		
    	});
    	
        function setThumbnail(event) {
            var reader = new FileReader();

            reader.onload = function (event) {
                var img = document.createElement("img");
                img.className = "image_container";
                img.setAttribute("src", event.target.result);
                $("#image_container").empty();
                $("#image_container").append(img);
            };

            reader.readAsDataURL(event.target.files[0]);
        }

        function fileupload() {
            $('#image').click();
        }

        $('.refund_btn').click(function(){
        	today = new Date();
        	var ymd = $(this).parent().find('input').val();

        	var date = new Date(ymd);
        	date.setMinutes(date.getMinutes()-20);
        	
        	if(date<today){
        		alert("환불 불가합니다.");
        	}else{
        		alert("환불되었습니다.");
        		$(this).text("환불완료");
				$(this).attr("disabled","disabled");
				$(this).css("border","0px");
				$(this).css("cursor","default");
        	}
        });
    </script>
</body>

</html>