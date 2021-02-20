<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <title>이벤트 상세보기</title>


    <style>
        .notice_content{
            font-size: 15px;
            color: white;
            width: 980px;
            margin: 0 auto;
            position: relative;
        }
        
        .notice_content .coupon_Btn{
        	position: absolute;
		    top: 2898px;
		    left: 180px;
		    height: 122px;
		    width: 598px;
		    border-radius: 58px;
		    background : none;
		    background-color: none;
    		border-color: none;
		    border: 0px;
		    outline: 0;
        }

        .btn_mywish {
            margin-left: 10px;
            background-color: #0B0C2A;
            border: 1px solid #fff;
            color: beige;
            text-align: center;
            font-size: 14px;
            border-radius: 5px;
            transition: 0.3s;
            outline: none;
            cursor: pointer;
            height: 35px;
            line-height: 0px;
        }

        /* 찜해제버튼 hover */
        .btn_mywish:hover {
            margin-left: 10px;
            background-color: #E53637;
            font-weight: 500;
            color: white;
            outline: none;
            height: 35px;
            line-height: 0px;
        }

        .notice_backtolist_btn{
            float: right;
            padding:10px;
            margin-top: 20px;
        }
        
        .coupon_modal_text{
        	font-size: 15px;	
    		margin-bottom: 10px;
        }
        
        .modal-body{
    		margin: 31px;
    		text-align: center;
        }
        
        #coupon_modal_number{
        	width: 200px;
		    height: 30px;
		    font-size: 14px;
		    padding-left: 5px;
        }
        
        #modal-dialog{
		    position: absolute;
		    left: 50%;
		    top: 50%;
		    margin: -195px 0 0 -320px;
        }
        
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
	
    <section class="anime-details">
       <div style="text-align:center; width: 980px; margin: 0 auto">
            <div style="border-bottom: 3px solid white; color:white; font-size: 22px; float: left; width: 980px; margin-bottom: 20px;">
                <div style="float:left">${ event.event_title }</div>
                <div style="font-size:12px; float: right; line-height: 3;">등록일: ${ event.event_date }</div>
            </div>
       </div>
    </section>
    <section class="anime-details spad">
        <div class="notice_content">
            <div class="notice_content">
            	${event.event_content}
            	<button type="button" class="btn coupon_Btn" data-toggle="modal" data-target="#CouponModal"></button>
            </div>
            <c:if test="${ loginUser.user_email eq 'admin@ddby.com' }">
            <div style="margin-right: 22px;">
	            <input type="button" value="수정" class="btn_mywish notice_backtolist_btn" onclick="location.href='eventUpdate.do?no=${ eventNum }'"/>
	            <input type="button" value="삭제" class="btn_mywish notice_backtolist_btn" onclick="location.href='eventDelete.do?no=${ eventNum }'"/>
            </div>
            </c:if>
            <div>
            	<input type="button" value="목록으로" onclick="location.href='event.do'" class="btn_mywish" style="float: left; margin-left: 0; margin-top: 20px; padding:10px;"/>
        	</div>
        </div>
		
		<!-- Modal -->
		<div class="modal fade" id="CouponModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document" id="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-body">
		        	<div class="coupon_modal_text"></div>
		        	<input type="text" id="coupon_modal_number">
		      </div>
		      <div class="modal-footer">   
		        <button type="button" class="btn btn-primary" style="font-size:12px;" onclick="certified();">인증하기</button>
		        <button type="button" class="btn btn-secondary " style="font-size:12px;" data-dismiss="modal">취소</button>
		      </div>
		    </div>
		  </div>
		</div>
    </section>

<!-- Footer Section Begin -->
<%@ include file="common/footer.jsp" %>
<!-- Footer Section End -->
</body>

<script>
	var couponKind = "${event.event_s_img}".slice(6,-4);
	var email="${loginUser.user_email}";
	var cTitle="${event.event_title}";
	
 	$(document).ready(function(){ 	
 		// 모달 감추기
		$('.fade').css("display","none");
 		
 		// 모달 
 		if(couponKind=="Army"){
 			$('.coupon_modal_text').text("군번을 입력해주세요.");
 			$('.coupon_Btn').css("top", "1097px");
 			$('.coupon_Btn').css("left", "272px");
 			$('.coupon_Btn').css("width", "332px");
 			$('.coupon_Btn').css("height", "70px");
 		}else if(couponKind=="Student"){
 			$('.coupon_modal_text').text("수험번호를 입력해주세요.");
 		}
	}); 
	
 	// 모달 띄우기
	$('.btn-primary').click(function(){
		$('.fade').css("display","block");
	});
 	
	
	// 쿠폰발급 Ajax
	function cAjax(){
		if(email==""){
			email="none";
		}
		$.ajax({
			url: "couponIssue.do",
			data: {
					email:email, 
					cTitle:cTitle
				  },
			type:"post",
			success:function(data){
				if(data=="ok"){
					alert(data);
					if(couponKind=="Army"){
						alert("쿠폰이 발급되었습니다. \n항상 감사합니다!");
					}else if(couponKind=="Student"){
						alert("쿠폰이 발급되었습니다. \n수고 많으셨습니다!");
					}
					location.reload();
				}else if(data=="notlog"){
					alert("로그인이 필요한 서비스 입니다.");
					location.href="loginPage.do";
				}else if(data=="overlap"){
					alert("이미 발급받은 쿠폰입니다.");
					location.reload();
				}else{
					alert("쿠폰등록에 실패하였습니다.");
				}
			}
		});
	}
	
	function certified(){
		if(couponKind=="Army"){
			var num = $('#coupon_modal_number').val();
			
			if(num.length==11 && num.charAt(2)=="-"){
				cAjax();
			}else{
				alert("군번을 다시 입력해주세요.");
			}
		}else if(couponKind=="Student"){
			var num = $('#coupon_modal_number').val();
			
			if(num.length==8 && !isNaN(num)){
				cAjax();
			}else{
				alert("수험번호를 다시 입력해주세요.");
			}
		}
	}
	
	// modal 취소시 input 값 초기화
 	$('.btn-secondary').click(function(){
		$('#coupon_modal_number').val('');
	});


</script>
</html>