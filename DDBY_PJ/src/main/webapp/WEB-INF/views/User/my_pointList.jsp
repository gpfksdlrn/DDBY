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
				<!-- 포인트내역 -->
				<div>
					<table class="detail_wdetail point_table">
						<thead class="wthead_wdetail">
							<tr>
								<th id="short_point_table">번호</th>
								<th>결제일시</th>
								<th>포인트</th>
								<th>사용방식</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="pl" items="${pList}">
							<tr>
									<td id="short_point_table">${ pl.point_no }</td>
									<td>${ pl.iss_date }</td>
									<c:if test="${pl.point_used eq 'Y'}">
									<td id="long_mybuylist"> -${ pl.pl_point } P </td>
										<td>포인트 사용</td>
									</c:if>
									<c:if test="${pl.point_used eq 'N'}">
									<td id="long_mybuylist"> ${ pl.pl_point } P </td>
										<td>포인트 적립</td>
									</c:if>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="product__pagination">
                    <!-- [이전] -->
					<c:if test="${ pi.currentPage eq 1 }">
					</c:if>
					<c:if test="${ pi.currentPage ne 1 }">
						<c:url var="before" value="my_point.do">
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
							<c:url var="pagination" value="my_point.do">
								<c:param name="currentPage" value="${ p }"/>
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
					</c:forEach>
					
					<!-- [다음] -->
					<c:if test="${ pi.currentPage eq pi.maxPage }">
					</c:if>
					<c:if test="${ pi.currentPage ne pi.maxPage }">
						<c:url var="after" value="my_point.do">
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
	<%@ include file="../common/footer.jsp"%>
	<!-- Footer Section End -->
	<script>
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

        function refund(){
            if(confirm("환불하시겠습니까?")){
                alert("환불완료");
            }
        }
    </script>
</body>

</html>