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
<title>프로필</title>
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
				<!-- 프로필 -->
				<form action="profileUpdate.do" method="post"
					enctype="multipart/form-data">
					<div>
						<div class="info_div_title">이름</div>
						<div class="info_div_content">${ loginUser.user_name }</div>

						<div class="info_div_title">이메일</div>
						<div class="info_div_content">${ loginUser.user_email }</div>

						<span class="info_div_title" style="height: 100px;">닉네임</span>
						<div class="info_div_content" style="height: 100px;">
							<span>한글,영문,숫자혼용가능 (한글 기준 10자 이내)</span>
							<div>
								<input type="text" value="${ loginUser.user_nickname }"
									class="mypage_nickname_text" name="user_nickname" /> <input
									type="button" value="중복확인" class="btn_mywish"
									onclick="nickDupl();" />
							</div>
						</div>
						<div class="info_div_title" style="height: 130px;">프로필사진</div>
						<div class="info_div_content" style="height: 130px;">
							<div id="image_container">
								<img src="resources/puploadFiles/${ loginUser.user_re_img }"
									alt="" class="image_container" onerror="this.src='resources/img/no-image.png'"> 
								<input type="hidden" value="${ loginUser.user_img }" name="user_img" />
								<input type="hidden" value="${ loginUser.user_re_img }" name="user_re_img" />
							</div>
							<div style="margin-top: 20px;">jpg,gif,png 파일만 등록이 가능합니다.</div>
							<br> <input type="button" value="사진변경"
								class="btn_mywish btn_file" onclick="fileupload();" /> <input
								type="file" id="image" accept="image/*" name="uploadFile"
								onchange="setThumbnail(event);" />
						</div>


						<div class="info_div_title">이메일 수신동의</div>
						<div class="info_div_content">
							<div class="Agree">
								<input type="checkbox" id="marketing_m"><label
									for="marketing_m">동의함</label><span>이메일 수신 동의</span><a
									href="./index.html"
									onclick="window.open(this.href, '', 'width=600, height=630'); return false;">자세히보기</a>
							</div>
						</div>
						<input type="hidden" id="user_marketing"
							value="${ loginUser.user_marketing }" name="user_marketing">

						<input type="button" value="수정하기" onclick="updateBtn();">
						<button id="update_click" style="visibility: hidden;"></button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Footer Section Begin -->
	<%@ include file="../common/footer.jsp"%>
	<!-- Footer Section End -->
	<script>
		var nick = 0;

		$(document).ready(function() {
			var market_m = "${ loginUser.user_marketing }"

			if (market_m == "Y") {
				$("#marketing_m").attr("checked", true);
			}
		});

		function setThumbnail(event) {
			var reader = new FileReader();

			reader.onload = function(event) {
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

		function refund() {
			if (confirm("환불하시겠습니까?")) {
				alert("환불완료");
			}
		}

		// ********** 닉네임 중복 체크 시작 **********
		$(".mypage_nickname_text").on("keyup", function() {
			nickAjax();
		});

		$(".mypage_nickname_text").on("mouseup", function() {
			nickAjax();
		});

		function nickAjax() {
			if ("${loginUser.user_nickname}" == $('.mypage_nickname_text')
					.val()) {
				nick = 0;
			} else if ($('.mypage_nickname_text').val() == "") {
				nick = -1;
			} else {
				$.ajax({
					url : "nickNameCheck.do",
					data : {
						nick : $('.mypage_nickname_text').val()
					},
					type : "post",
					success : function(data) {
						if (data == "ok") {
							nick = 1;
						} else {
							nick = 2;
						}
					}
				});
			}
		}

		function nickDupl() {
			if (nick == 0) {
				alert("기존과 동일한 닉네임입니다.");
			} else if (nick == 2) {
				alert("사용중인 닉네임 입니다.");
			} else if (nick == 1) {
				alert("사용가능한 닉네임 입니다.");
			} else if (nick == -1) {
				alert("사용할 수 없는 닉네임 입니다.");
			} else {
				alert("error");
			}
			return false;
		}

		function updateBtn() {
			var nick = $('.mypage_nickname_text').val();
			$.ajax({
				url : "nickNameCheck.do",
				data : {
					nick : nick
				},
				type : "post",
				success : function(data) {
					if (data == "ok" || nick=="${loginUser.user_nickname}") {
							// 메일 수신 동의 체크
							if ($("#marketing_m").is(":checked")) {
								$('#user_marketing').val("Y");
							} else {
								$('#user_marketing').val("N");
							}
							$('#update_click').trigger('click');
						} else {
							alert("닉네임을 확인 해주세요.");
						}
				}
			});
		}

		// ********** 닉네임 중복 체크 끝 **********
	</script>

</body>

</html>