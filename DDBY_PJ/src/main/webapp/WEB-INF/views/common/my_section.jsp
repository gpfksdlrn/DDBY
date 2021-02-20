<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/myPage.css" rel="stylesheet">
</head>
<body>
    <section class="normal-breadcrumb set-bg" data-setbg="resources/img/myinfo.png" style="width: 865px; margin: 20px auto;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="sect-person-info">
                        <div class="box-image">
                            <span class="thumb-image">
                                <img src="resources/puploadFiles/${ loginUser.user_re_img }" alt="${ loginUser.user_name }님 프로필 사진" onerror="this.src='resources/img/no-image.png'">
                            </span>
                        </div>
                        <div class="box-contents">
                            <div class="person-info">
                                <span>${ loginUser.user_name }</span>
                                <span>${ loginUser.user_email }</span><br>
                                <span>닉네임 : ${ loginUser.user_nickname } </span>
                            </div>
                            <hr style="color: whitesmoke;">
                            <div class="cols-benefit-info">
                                <div class="person-info-bottom">
                                    <span id="coupon"></span><br>
                                    <span id="point"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" id="al" value="">
    </section>
    <script>
    	$(document).ready(function(){
    		$.ajax({
				url : "myPageinfo.do",
				type : "post",
				contentType : "application/json; charset:UTF-8",
				success : function(data) {
					var arr = JSON.parse(data);
					
					$('#coupon').text("보유쿠폰 : "+arr[1]+"장");
					$('#point').text("보유포인트 : "+arr[0]+"P");
					
					if(arr[2]=="true"){
						$('#al').val("true");
					}
				}
			});
    	});
    </script>
</body>
</html>