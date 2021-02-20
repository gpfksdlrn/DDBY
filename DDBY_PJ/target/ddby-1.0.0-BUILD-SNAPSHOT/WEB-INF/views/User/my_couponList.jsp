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
<title>쿠폰 리스트</title>
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
				<!-- 쿠폰내역 -->
				<div class="tabcontent current">
					<table class="detail_wdetail">
						<thead class="wthead_wdetail">
							<tr>
								<th id="short_wdetail">번호</th>
								<th>발급날짜</th>
								<th>쿠폰이름</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${ !empty cList }">
								<c:forEach var="c" items="${ cList }">
									<tr>
										<td id="short_wdetail">${ c.coupon_num }</td>
										<td>${ c.coupon_date }</td>
										<td id="long_mybuylist">${ c.coupon_title }</td>
										<c:if test="${ c.coupon_used eq 'Y' }">
											<td>사용완료</td>
										</c:if> 
										<c:if test="${ c.coupon_used eq 'N' }">
											<td>사용가능</td>
										</c:if> 
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								쿠폰 정보가 존재하지 않습니다.
							</c:otherwise>
						</c:choose>
						</tbody>
					</table>
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