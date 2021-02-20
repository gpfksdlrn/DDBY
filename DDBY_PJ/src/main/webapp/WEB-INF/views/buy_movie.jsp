<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html lang="zxx">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<head>
    <meta charset="UTF-8">
    <title>영화구매</title>
    <style>
        .wrap_buymovie {
            display: grid;
            grid-template-columns: 76px 545px 1fr;
            border: 1px solid white;
            overflow: hidden;
            position: relative;
            width: 1170px;
            height: 865px;
            margin: 0 auto;
        }

        .movie_li {
            border-bottom: 1px solid #666666;
            border-right: 1px solid #666666;
            background-color: #333333;
            width: 76px;
            height: 216px;
            text-align: center;
            line-height: 208px;
            font-size: 14px;
            color: white;
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

        .bx_provision {
            padding: 10px 15px;
            font-size: 12px;
            color: white;
        }

        .bx_item {
            border-bottom: 1px solid white;
            position: relative;
            padding: 10px;
            font-size: 15px;
            color: white;
        }

        .bx_frame {
            border: 1px solid white;
        }

        .buy_money_frame {
            font-size: 15px;
            height: 50px;
            color: white;
            line-height: 50px;
            border-top: 1px solid white;
            padding-left: 30px;
        }

        .buy_price {
            float: right;
            margin-right: 40px;
            font-weight: bold;
        }

        .buy_button {
            background-color: #e13536;
            text-align: center;
            cursor: pointer;
        }

        .buy_chkbox {
            position: relative;
            top: 1.6px;
        }

        .check_text {
            font-size: 13px;
            margin-left: 5px;
        }

        .buy_title {
            height: 55px;
            text-align: center;
            line-height: 55px;
            background-color: #000000;
            font-size: 18px;
            color: white;
        }

        .buy_frame {
            float: left;
            width: 545px;
        }

        .buy_Reservation_infomation {
            height: 376px;
            border-right: 1px solid #ffffff;
        }

        .buy_movie_div {
            padding-top: 20px;
            padding-left: 130px;
        }

        .buy_movie_infomation {
            padding-left: 85px;
            padding-top: 25px;
        }

        .buy_movie_text {
            padding-left: 30px;
            padding-top: 25px;
        }

        .buy_movie_title {
            color: white;
            font-size: 18px;
            margin-top: -25px;
            padding-left: 30px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .buy_movie_date {
            color: white;
            font-size: 12px;
            margin-top: 10px;
        }

        .buy_movie_place {
            color: white;
            font-size: 12px;
            margin-top: 3px;
        }

        .buy_movie_seat_span {
            margin-left: 30px;
            color: white;
            padding-bottom: 20px;
        }

        .buy_movie_seat_li {
            height: 60px;
            border-top: 1px solid white;
            border-right: 1px solid white;
            border-bottom: 1px solid white;
            line-height: 60px;
            font-size: 14px;
        }

        .buy_point_cupon_li {
            height: 420px;
            border-right: 1px solid #ffffff;
        }

        .buy_point_cupon_title {
            color: white;
            font-size: 15px;
            padding-left: 30px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            padding-top: 35px;
        }

        .buy_point_cupon_frame {
            margin-left: 100px;
            color: white;
            margin-top: 15px;
        }

        .buy_point_button {
            width: 170px;
            height: 40px;
            float: left;
            font-size: 14px;
            text-align: center;
            border-left: 1px solid white;
            border-top: 1px solid white;
            border-right: 1px solid white;
            line-height: 39px;
            cursor: pointer;
        }

        .buy_cupon_button{
            width: 170px;
            height: 40px;
            float: left;
            font-size: 14px;
            text-align: center;
            border-top: 1px solid white;
            border-right: 1px solid white;
            line-height: 39px;
            cursor: pointer;
        }

        .buy_point_cupon_div{
            width: 340px;
            height: 270px;
            border: 1px solid white;
        }

        .buy_point_input{
            width:200px;
            height:40px;
            margin-top: 51px;
            color: black;
            font-size: 14px;
        }

        .buy_cupon_count{
            margin-top: 50px;
            margin-left: 20px;
            font-size: 14px;
        }

        .buy_cupon_radio_div{
            font-size: 16px;
            margin-top: 5px;
        }

        .buy_cupon_button_div{
            margin-left: 10px;
            margin-top: 54px;
            padding-bottom: 20px;
        }

        .buy_cupon_agree{
            height:40px;
            width:120px;
        }

        .buy_cupon_agree:hover{
            height:40px;
            width:120px;
        }

        .buy_cupon_deny{
            height: 40px;
            width:120px;
            margin-left: 9px;
        }

        .buy_cupon_deny:hover{
            height: 40px;
            width:120px;
            margin-left: 9px;
        }

        .buy_cupon_wrap{
            margin-top: 15px;
        }

        .buy_point_deny_button{
            height:40px;
            width:120px;
        }

        .buy_point_deny_button:hover{
            height:40px;
            width:120px;
        }

        .buy_point_btn_wrap{
            margin-left: 30px;
            margin-top: 63px;
        }

        .buy_point_all_app{
            height: 40px;
            width:80px;
        }

        .buy_point_all_app:hover{
            height: 40px;
            width:80px;
        }

        .buy_point_all_app_wrap{
            margin-left: 23px;
        }

        .buy_movie_seat_num{
            margin-left: 15px;
        }

        .buy_movie_person{
            margin-left: 15px;
        }

        .buy_movie_place_text{
            margin-left: 8px;
        }

        .buy_movie_date_text{
            margin-left: 20px;
        }

        .buy_movie_age_img{
            width:22px;
        }

        .buy_movie_img{
            width: 120px;
        }
        
        /* icon */
        .ic_grade {
            display: inline-block;
            width: 22px;
            height: 22px;
            line-height: 22px;
            border-radius: 50%;
            font-size: 0;
            text-align: center;
            vertical-align: middle;
        }

        .ic_grade:before {
            margin-left: -1px;
            font-size: 13px;
            font-weight: bold;
            color: #FFF;
            white-space: nowrap;
        }

        .ic_grade.gr_non {
            background-color: #777777;
        }

        .ic_grade.gr_all {
            background-color: #5BC77E;
        }

        .ic_grade.gr_12 {
            background-color: #4DD6FF;
        }

        .ic_grade.gr_15 {
            background-color: #FFC134;
        }

        .ic_grade.gr_18 {
            background-color: #ED4C6B;
        }

        .ic_grade.gr_all_eng {
            background-color: #5BC77E;
        }

        .ic_grade.gr_18_eng {
            background-color: #ED4C6B;
        }

        .ic_grade.gr_non:before {
            content: "미정";
            font-size: 11px;
        }

        .ic_grade.gr_all:before {
            content: "전체";
            font-size: 11px;
        }

        .ic_grade.gr_12:before {
            content: "12";
            font-family: "Roboto";
        }

        .ic_grade.gr_15:before {
            content: "15";
            font-family: "Roboto";
        }

        .ic_grade.gr_18:before {
            content: "청불";
            font-size: 11px;
        }

        .ic_grade.gr_all_eng:before {
            content: "ALL";
            font-size: 11px;
        }

        .ic_grade.gr_18_eng:before {
            content: "19";
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

    <!-- Product Section Begin -->
    <section class="product-page spad">
    <form action="kakaoPay.do" method="post">
        <div class="wrap_buymovie">
            <div style="float: left;">
                <ul>
                    <li class="movie_li">
                        상영시간
                    </li>
                    <li class="movie_li">
                        인원/좌석
                    </li>
                    <li class="movie_li sel_li">
                        결제
                    </li>
                    <li class="movie_li">
                        결제완료
                    </li>
                </ul>
            </div>
            <div class="buy_frame">
                <ul>
                    <li class="buy_title">
                        예매정보
                    </li>
                    <li class="buy_Reservation_infomation">
                        <div class="buy_movie_div">
                            <div class="buy_movie_infomation">
                                <img src="resources/img/poster/${ mv.movie_poster }"
                                    alt="${ mv.movie_title }" class="buy_movie_img">
                            </div>
                            <div class="buy_movie_text">
                                <span>
                                	<c:if test="${ mv.movie_age == 0 }">
                                		<img src="resources/img/allage.png" alt="${ mv.movie_title }" class="buy_movie_age_img">
                                	</c:if>
                                	<c:if test="${ mv.movie_age != 0 }">
                                		<img src="resources/img/${ mv.movie_age }age.png" alt="${ mv.movie_title }" class="buy_movie_age_img">
                                	</c:if>
                                </span>
                                <div class="buy_movie_title">
                                    ${ mv.movie_title }
                                </div>
                                <div class="buy_movie_date">일시<span class="buy_movie_date_text"></span>(<span class="s_day"></span>) | <span class="s_time"></span>
                                </div>
                                <div class="buy_movie_place">
                                    영화관<span class="buy_movie_place_text">또보영 ${ sc.ms_theater }관</span>
                                </div>
                                <div class="buy_movie_place">인원<span class="buy_movie_person"><!--  
                                    --><c:forEach var="a" items="${ ageArr }" varStatus="index"><!--  
                                    	--><c:if test="${index.index == 0 && a!=0}">성인 ${a}명</c:if><!--  
                                    	--><c:if test="${index.index == 1 && a!=0}">청소년 ${a}명</c:if><!--  
                                    	--><c:if test="${index.index == 2 && a!=0}">시니어 ${a}명</c:if><!--  
                                    	--><c:if test="${index.last && a!=0}">장애인 ${a}명</c:if><!--  
                                    --></c:forEach></span>
                                </div>
                            </div>
                        </div>
                    </li>
                    <input type="hidden" id="coupon" name="coupon" value="">
                    <input type="hidden" id="point" name="point" value="">
                    <input type="hidden" id="cost_pay" name="cost_pay" value="">
                    <input type="hidden" id="dc_pay" name="dc_pay" value="">
                    <input type="hidden" id="total_pay" name="total_pay" value="">
                    <input type="hidden" id="total_age" name="total_age" value="">
                    <input type="hidden" id="select_Seat" name="select_Seat" value="">
                    <input type="hidden" id="ms_no" name="ms_no" value="${ sc.ms_no }">
                    <input type="hidden" id="mShowTime" name="mShowTime" value="">
                    <li class="buy_movie_seat_li">
                        <span class="buy_movie_seat_span">좌석
                    	<c:forEach var="s" items="${seatArr}" varStatus="index">
                    			<c:choose>
                    				<c:when test="${index.last}">
                    					<span class="buy_movie_seat_num">${s}</span>
                    				</c:when>
                    				<c:otherwise>
                    					<span class="buy_movie_seat_num">${s},</span>
                    				</c:otherwise>
                    			</c:choose>
                        </c:forEach>
                        </span>
                    </li>
                    <li class="buy_point_cupon_li">
                        <div class="buy_point_cupon_title">
                            포인트/쿠폰
                        </div>
                        <div class="buy_point_cupon_frame">
                            <div class="buy_point_button" onclick="pointbutton();">포인트 <b> ${ point }</b>P</div>
                            <div class="buy_cupon_button" onclick="cuponbutton();">쿠폰</div>
                            <div id="buy_point_cupon_select">

                                <div class="buy_point_cupon_div" id="buy_point">
                                    <div class="buy_point_all_app_wrap">
                                        <input type="number" class="buy_point_input">
                                        <button type="button" class="btn_mywish buy_point_all_app" onclick="fulldis();">최대적용</button>
                                    </div>
                                    <div class="buy_point_btn_wrap">
                                        <button type="button" class="btn_mywish buy_point_deny_button" onclick="discount();">적용</button>
                                        <button type="button" class="btn_mywish buy_point_deny_button" onclick="cancel();">취소</button>
                                    </div>
                                </div>
    
                                <div class="buy_point_cupon_div" id="buy_cupon">
                                    <div class="buy_cupon_count">
                                        보유쿠폰 ${ coupon_count }매
                                        <div class="buy_cupon_wrap">
	                                        <c:forEach var="c" items="${coupon}" varStatus="index">
	                                        	<c:if test="${ c.coupon_title eq '군장병 여러분 감사합니다' }">
	                                        		<div class="buy_cupon_radio_div"><input type="radio" style="margin-right: 10px;" name="cupon" class="buy_cupon_radio" value="군장병 여러분 감사합니다">군장병 할인쿠폰 : 1매</input></span>
	                                        	</c:if>
	                                        	<c:if test="${ c.coupon_title eq '고3수고했3!' }">
	                                        		<div class="buy_cupon_radio_div"><input type="radio" style="margin-right: 10px;" name="cupon" class="buy_cupon_radio" value="고3수고했3!">수험생 할인쿠폰 : 1매</input></span>
	                                        	</c:if>
	                                        </c:forEach>
                                        </div>
                                    </div>
                                    <div class="buy_cupon_button_div">
                                        <button type="button" class="btn_mywish buy_cupon_agree" onclick="coupon_Access();">적용</button>
                                        <button type="button" class="btn_mywish buy_cupon_deny" onclick="cancel();">취소</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <div style="float: left">
                <ul>
                    <li class="buy_title">
                        결제수단
                    </li>
                    <li>
                        <div class="bx_frame">
                            <div class="bx_item">
                                <input type="checkbox" id="chkSavingTerm" class="buy_chkbox">
                                <label for="chkSavingTerm">결제대행서비스 약관 전체동의</label>
                            </div>
                            <div class="bx_provision">
                                <div>
                                    <input type="checkbox" class="buy_chkbox chk_test">
                                    <label class="check_text">[필수] 전가금융거래 이용약관 동의</label>
                                </div>

                                <div>
                                    <input type="checkbox" class="buy_chkbox chk_test">
                                    <label class="check_text">[필수] 고유식별정보 수집 및 이용안내</label>
                                </div>

                                <div>
                                    <input type="checkbox" class="buy_chkbox chk_test">
                                    <label class="check_text">[필수] 개인정보 수집 및 이용동의</label>
                                </div>

                                <div>
                                    <input type="checkbox" class="buy_chkbox chk_test">
                                    <label class="check_text">[필수] 개인정보 제3자 제공/위탁동의</label>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li style="margin-top: 430px;">
                        <div class="buy_money_frame">
                            상품금액<span class="buy_price" id="movie_price">${total_pay}원</span><!-- 
                         --></div>
                        <div class="buy_money_frame">
                            할인금액<span class="buy_price" id="movie_dc">0원</span>
                        </div>
                        <div class="buy_money_frame">
                            결재금액<span class="buy_price" id="movie_fprice"></span>
                        </div>
                        <div class="buy_money_frame buy_button">
                            결제하기
                        </div>
                        <button type="submit" id="kakao_submit"></button>
                    </li>
                </ul>
            </div>
        </div>
        	<c:forEach var="a" items="${ageArr}" varStatus="index">
        		<input type="hidden" id="age${index.index}" value="${a}"> 
        	</c:forEach>
     </form>
    </section>
    <!-- Product Section End -->
	<!-- Footer Section Begin -->
	<%@ include file="common/footer.jsp" %>
	<!-- Footer Section End -->
    <script>
	    var date = "${sc.ms_showtime}";
	    var time = date.substr(11,5);
	    var day = new Date("${sc.ms_showtime}");
	    var days = ["일", "월", "화", "수", "목", "금", "토"];
	    date = date.substr(0,10);
	    
	    var c_adult= $('#age0').val();
	    var c_child= $('#age1').val();
	    var c_senior= $('#age2').val();
	    var c_dis= $('#age3').val();
	    
       $(document).ready(function(){
           pointbutton();
           
           // 영화 상영 정보
           $('.buy_movie_date_text').text(date); 
           $('.s_day').text(days[day.getDay()]); 
           $('.s_time').text(time+" | "+"${mv.movie_running_time}"+"분");
       });

       function cuponbutton() {
           $('#buy_cupon').css("display","block");
           $('#buy_point').css("display","none");
           $('.buy_cupon_button').css('border-bottom','none');
           $('.buy_point_button').css('border-bottom','1px solid white');
       }

       function pointbutton() {
           $('#buy_point').css("display","block");
           $('#buy_cupon').css("display","none");
           $('.buy_point_button').css('border-bottom','none');
           $('.buy_cupon_button').css('border-bottom','1px solid white');
       }

       $("#chkSavingTerm").click(function(){
            if($("#chkSavingTerm").is(":checked")){
               $(".buy_chkbox").prop("checked",true); 
            }
            else{
                $(".buy_chkbox").prop("checked",false); 
           }
       });

       $(".buy_chkbox").click(function(){
         var i =0;
         $(".buy_chkbox").each(function(index){
             if($(this).is(":checked")==false){
                 i=1;
             }
         });
         if(i==1){
             $("#chkSavingTerm").prop("checked",false);
         }else{
             $("#chkSavingTerm").prop("checked",true);
         }
     });
       
     window.setInterval("refreshfrice()",100);

     function refreshfrice(){
         var price =  parseInt($("#movie_price").text().replace('원','')) - parseInt($('#movie_dc').text().replace('원',''));

         $('#movie_fprice').text(price+'원');
     }

     function discount(dsnum){
         var movieprice = parseInt($("#movie_price").text().replace('원',''));
         var point = $('.buy_point_button').children('b').text();
         dsnum = $('.buy_point_input').val();

         if(parseInt(point) < dsnum || movieprice < dsnum){
             alert("포인트 초과!");
         }else{
           $('#movie_dc').text(dsnum+'원');
         }
  		$('#point').val($('.buy_point_input').val());
     }

     function fulldis(){
		var uPoint = "${ loginUser.user_point }";
       var movieprice = parseInt($("#movie_price").text().replace('원',''));
       $('.buy_point_input').val(uPoint);

       if(movieprice < uPoint ){
           $('.buy_point_input').val(movieprice);
       }
     }

     function coupon_Access(){
    	 var p_Count = "${p_count}";
    	 // dnum = 할인금액
         var dnum = parseInt($("#movie_price").text().replace('원','')) - 6000;
    	 
         if($('input:radio[name="cupon"]:checked').val()=="군장병 여러분 감사합니다"){
       	 	if(c_adult>=2){
       	 		dnum = 14000;
       	 		$('#movie_dc').text(dnum+'원');
       	 	}else if(c_adult==1 && c_child>=1){
       	 		dnum = 9000;
       	 		$('#movie_dc').text(dnum+'원');
       	 	}else if(c_adult==1){
       	 		dnum = 7000;
       	 		$('#movie_dc').text(dnum+'원');
       	 	}
         }else if($('input:radio[name="cupon"]:checked').val()=="고3수고했3!"){
       	 		dnum =  2000;
       	 		$('#movie_dc').text(dnum+'원');
         }
         
         $('#coupon').val($('input:radio[name="cupon"]:checked').val());
     }
     
     // 결제하기 버튼
     $('.buy_button').click(function() {
    	 var sw = 0;
    	if($('#total_pay').val()==0){
    		
    	}
    	// hidden값에 넣기
 		$('#cost_pay').val($('#movie_price').text().replace('원',''));
 		$('#dc_pay').val($('#movie_dc').text().replace('원',''));
 		$('#total_pay').val($('#movie_fprice').text().replace('원',''));
 		$('#total_age').val($('.buy_movie_person').text());
 		$('#select_Seat').val($('.buy_movie_seat_num').text());
 		$('#mShowTime').val($('.buy_movie_date').text());
 	
    	// 이용약관 체크
   	 	$('.chk_test').each(function(index,object){
   	 		if($(this).is(":checked")==false){
   	 			sw=1;
   	 		}
   	 	});
    	 	
   	 	if($('#total_pay').val()=="0"){
   	 		$("form").attr("action", "payResult.do");
   	 	}
   	 	
   	 	if(sw!=0){
   	 		alert("모든 약관에 동의 해주세요.");
   	 	}else{
   	 		$('#kakao_submit').trigger("click");
   	 	}
   	 	
     });

     function cancel(){
    	 $('#movie_dc').text(0+'원');
    	 $("input:radio[name='cupon']").prop("checked", false);
    	 $('.buy_point_input').val("");
    	 $('#coupon').val("");
    	 $('#point').val("");
     }
     
    </script>
</body>

</html>