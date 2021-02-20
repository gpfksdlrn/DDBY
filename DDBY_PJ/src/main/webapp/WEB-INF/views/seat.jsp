<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>DDOBOYUNG</title>
    <style>
        .wrap_reserve {
            display: grid;
            grid-template-columns: 76px 545px 1fr;
            border: 1px solid white;
            overflow: hidden;
            position: relative;
            width: 1170px;
            height: 865px;
            margin: 0 auto;
        }

        .wrap_seat {
            display: grid;
            grid-template-columns: 76px 1fr;
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
            font-size: 18px;
            height: 50px;
            color: white;
            line-height: 50px;
            border-top: 1px solid white;
            padding-left: 30px;
        }

        .buy_price {
            float: right;
            margin-right: 40px;
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

        .buy_cupon_button {
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

        .buy_point_cupon_div {
            width: 340px;
            height: 270px;
            border: 1px solid white;
        }

        .buy_point_input {
            width: 200px;
            height: 40px;
            margin-top: 51px;
            color: black;
            font-size: 14px;
        }

        .buy_cupon_count {
            margin-top: 50px;
            margin-left: 20px;
            font-size: 14px;
        }

        .buy_cupon_radio_div {
            font-size: 16px;
            margin-top: 5px;
        }

        .buy_cupon_button_div {
            margin-left: 10px;
            margin-top: 54px;
            padding-bottom: 20px;
        }

        .buy_cupon_agree {
            height: 40px;
            width: 120px;
        }

        .buy_cupon_agree:hover {
            height: 40px;
            width: 120px;
        }

        .buy_cupon_deny {
            height: 40px;
            width: 120px;
            margin-left: 9px;
        }

        .buy_cupon_deny:hover {
            height: 40px;
            width: 120px;
            margin-left: 9px;
        }

        .buy_cupon_wrap {
            margin-top: 15px;
        }

        .buy_point_deny_button {
            height: 40px;
            width: 120px;
        }

        .buy_point_deny_button:hover {
            height: 40px;
            width: 120px;
        }

        .buy_point_btn_wrap {
            margin-left: 30px;
            margin-top: 63px;
        }

        .buy_point_all_app {
            height: 40px;
            width: 80px;
        }

        .buy_point_all_app:hover {
            height: 40px;
            width: 80px;
        }

        .buy_point_all_app_wrap {
            margin-left: 23px;
        }

        .buy_movie_seat_num {
            margin-left: 15px;
        }

        .buy_movie_person {
            margin-left: 20px;
        }

        .buy_movie_place_text {
            margin-left: 8px;
        }

        .buy_movie_date_text {
            margin-left: 20px;
        }

        .buy_movie_age_img {
            width: 22px;
        }

        .buy_movie_img {
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

        .seat_selectmovie_wrap {
            background-color: white;
            height: 117px;
            position: relative;
            display: flex;
        }

        .seat_movie_info {
            width: 330px;
            padding: 25px 0 0 25px;
        }

        .seat_movie_img {
            float: left;
            width: 46px;
        }

        .seat_movie_info_age {
            float: left;
            margin-bottom: 35px;
            margin-left: 5px;
        }

        .seat_movie_title {
            margin-left: 5px;
            font-size: 15px;
            font-weight: bold;
        }

        .seat_age {
            float: left;
            margin-left: 5px;
        }

        .seat_movie_wrap {
            margin-bottom: 1px;
            margin-top: 3px;
        }

        .seat_movie_time {
            margin-left: 55px;
            font-size: 11px;
            margin-top: 9px;
        }

        .seat_select_seat_wrap{
            background-color: black;
            height: 629px;
        }

        .seat_guide{
            color: white;
            text-align: center;
            padding-top: 20px;
            font-size: 13px;
            padding-bottom: 20px;
        }

        .seat_screen{
            background-color: #6c6c6c;
            color: white;
            text-align: center;
            font-size: 20px;
        }

        .seat_position{
            background-color: black;
        }

        .seat_buy_wrap{
            background-color: #888888;
            height: 62px;
            line-height: 62px;
            color: white;
            padding-left: 30px;
            font-size: 20px;
        }

        .seat_buy_button{
            background-color: #ff243e;
            float: right;
            width: 200px;
            text-align: center;
            font-weight: bold;
            cursor: pointer;
        }

    .count_people {
      padding-top: 40px;
    }

    .count_people>ul>li:first-child {
      margin-left: 0;
    }

    .count_people>ul>li {
      float: left;
      margin-left: 20px;
    }

    .count_people>ul>li .tit {
      margin-right: 8px;
      font-size: 13px;
    }

    .count_people>ul>li .bx_num {
      display: inline-block;
      width: 100px;
      position: relative;
      border: 1px solid #DDD;
      border-radius: 4px;
      background-color: #fff;
      box-sizing: border-box;
    }

    .bx_num {
      position: relative;
    }

    .bx_num svg {
      font-size: 12px;
    }

    .bx_num .btn_plus,
    .bx_num .btn_mins {
      position: absolute;
      top: 0;
      bottom: 0;
      background: no-repeat 50% 50%;
      border: 0 none;
      padding: 0 15px;
      text-indent: -9999em;
      font: 0 auto;
      cursor: pointer;
    }

    .bx_num .btn_plus {
      left: 57px;
    }

    .bx_num .btn_mins {
      left: 0px;
    }

    .bx_num .txt_num {
      padding: 8px 0;
      font-family: 'Roboto';
      font-size: 15px;
      font-weight: bold;
      color: #000;
      text-align: center;
      vertical-align: middle;
    }

    .position_wrap {
        width: 506px;
        height: 540px;
        margin: 0 auto;
        background-color: gray;
        padding: 128px;
    }

    .f1{
        position: relative;
        display: inline-block;
        overflow: hidden;
        width: 21px;
        height: 16px;
        line-height: 17px;
        background: #E8E8E8;
        color: #000;
        font-size: 10px;
        text-align: center;
        letter-spacing: -0.5px;
        box-sizing: border-box;
        border-radius: 7px 7px 2px 0px;
        font-family: 'Roboto', "Noto Sans KR";
        margin:2px;
        cursor: pointer;
    }
    .f1_active{
        background: #F72300;
        color: white;
    }
    .f1_disable{
        background: #232323;
        color: black;
        cursor: default;
    }
    
    
    .r_seat{
        position: relative;
        display: inline-block;
        overflow: hidden;
        width: 21px;
        height: 16px;
        line-height: 17px;
        background: #232323;
        color: black;
        font-size: 10px;
        text-align: center;
        letter-spacing: -0.5px;
        box-sizing: border-box;
        border-radius: 7px 7px 2px 0px;
        font-family: 'Roboto', "Noto Sans KR";
        margin:2px;
        cursor: default;
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
        <div class="wrap_seat">
            <div style="float: left;">
                <ul>
                    <li class="movie_li">
                        상영시간
                    </li>
                    <li class="movie_li sel_li">
                        인원/좌석
                    </li>
                    <li class="movie_li">
                        결제
                    </li>
                    <li class="movie_li">
                        결제완료
                    </li>
                </ul>
            </div>

            <form action="buyMovie.do" method="post">
            <div>
                <ul>
                    <li class="buy_title">
                        인원/좌석 선택
                    </li>
                    <li>
                        <div class="seat_selectmovie_wrap">
                            <div class="seat_movie_info">
                                <div class="seat_movie_img">
                                	<img src="resources/img/poster/${ mv.movie_poster }">
                                </div>
                                <div class="seat_movie_wrap">
                                    <div class="buy_movie_age_img seat_age">
                                    	
                                    	<c:if test="${mv.movie_age == 0}">
                                    	<img src="resources/img/allage.png" alt="all">
                                    	</c:if>
                                    	
                                    	<c:if test="${mv.movie_age != 0}">
                                    	<img src="resources/img/${mv.movie_age}age.png" alt="all">
                                    	</c:if>
                                    	
                                    </div>
                                    <span class="seat_movie_title">${ mv.movie_title }</span>
                                </div>
                                <div class="seat_movie_time">
                                    <span class="s_date"></span>(<span class="s_day"></span>) | <span class="s_time"></span>
                                    <br>
                                    ${ sc.ms_theater }관
                                </div>
                            </div>
                            <div class="count_people">
                                <h6 class="hidden">인원선택</h6>
                                <ul>
                                  <li id="person_10" data-code="10" data-peple="성인" data-count="0">
                                    <strong class="tit">성인</strong>
                                    <span class="bx_num">
                                      <button type="button" class="btn_mins" id="adult_M"><i class="fas fa-minus"></i></button>
                                      <div class="txt_num"> 0 </div>
                                      <button type="button" class="btn_plus" id="adult_P"><i class="fas fa-plus"></i></button>
                                    </span>
                                  </li>
                                  <li id="person_20" data-code="20" data-peple="청소년" data-count="0">
                                    <strong class="tit">청소년</strong>
                                    <span class="bx_num">
                                      <button type="button" class="btn_mins" id="teenager_M">
                                        <i class="fas fa-minus"></i>
                                      </button>
                                      <div class="txt_num">
                                        0
                                      </div>
                                      <button type="button" class="btn_plus" id="teenager_P">
                                        <i class="fas fa-plus"></i>
                                      </button>
                                    </span>
                                  </li>
                                  <li id="person_12" data-code="12" data-peple="시니어" data-count="0">
                                    <strong class="tit">시니어</strong>
                                    <span class="bx_num">
                                      <button type="button" class="btn_mins" id="senior_M"><i class="fas fa-minus"></i></button>
                                      <div class="txt_num">
                                        0
                                      </div>
                                      <button type="button" class="btn_plus" id="senior_P"><i class="fas fa-plus"></i></button>
                                    </span>
                                  </li>
                                  <li id="person_11" data-code="11" data-peple="장애인" data-count="0">
                                    <strong class="tit">장애인</strong>
                                    <span class="bx_num">
                                      <button type="button" class="btn_mins" id="disabled_M"><i class="fas fa-minus"></i></button>
                                      <div class="txt_num">
                                        0
                                      </div>
                                      <button type="button" class="btn_plus" id="disabled_P"><i class="fas fa-plus"></i></button>
                                    </span>
                                  </li>
                                </ul>
                              </div>
                        </div>
                    </li>
                    <li>            
                        <div class="seat_select_seat_wrap">

                            <div class="seat_guide">
                                - 좌석 선택 후 결제하기 버튼을 클릭하세요
                            </div>

                            <div class="seat_screen">
                                S C R E E N
                            </div>

                            <div class="seat_position">
                                <div class="position_wrap">
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="seat_buy_wrap">
                        	총 합계 <b>0</b>원 
                        	
                            <button type="submit" class="seat_buy_button" onclick="return seatSubmit()">결제하기</button>
                            <input type="hidden" name="select_Seat" id="select_Seat" value="">
                            <input type="hidden" name="total_pay" id="total_pay" value="">
                            <input type="hidden" name="total_age" id="total_age" value="">
                            <input type="hidden" name="ms_no" id="ms_no" value="${sc.ms_no}">
                            
                        </div>
                    </li>
                </ul>
            </div>
          </form>
        </div>
    </section>
    <!-- Footer Section Begin -->
    <%@ include file="common/footer.jsp" %>
    <!-- Footer Section End -->

    <script>
        var adultdiv = $('#person_10').children('span').children('div');
        var teendiv = $('#person_20').children('span').children('div');
        var seniordiv = $('#person_12').children('span').children('div');
        var disdiv = $('#person_11').children('span').children('div');
        var totalnum = $('.seat_buy_wrap').children('b');

        var adultnum = adultdiv.text();
        var teennum = teendiv.text();
        var seniornum = seniordiv.text();
        var disnum = disdiv.text();
        
		
        // 좌석 수
        var countSeat=0;    // 총 인원
        var selectCount=0;  // 사용자가 선택한 좌석 수
        var total_pay=0;    // 총 결제금액
        
        var date = "${sc.ms_showtime}";
        var time = date.substr(11,5);
        var day = new Date("${sc.ms_showtime}");
        var days = ["일", "월", "화", "수", "목", "금", "토"];
        var endtime;
        var ms_no = "${sc.ms_no}"
        
        date = date.substr(0,10);


        $(document).ready(function(){
            var num = 65;
            var seatdiv = $('.position_wrap');
            var msg = "${msg}";
            
            if(msg=="true"){
            	alert("죄송합니다. 이미 예매된 좌석입니다. \n다시 시도해주십시오.");
            	location.href="showtime.do";
            }
            
            for(var i=1; i<=10; i++){
                for(var j=1; j<=10; j++){
                    seatdiv.append("<span class='f1'>"+String.fromCharCode(num)+j+"</span>");
                }
                num++;
            }
            
			seatAjax();
	      
            // 좌석 색 변경
            $(".f1").click(function(){
                if(countSeat > selectCount){
                    if($(this).attr('class')=='f1'){
                        $(this).addClass("f1_active");
                        selectCount++;

                        if(countSeat==selectCount){ // 좌석이 다 선택되었을 때!!!!!
                            $('.f1').each(function(i,obj) {
                                if($(this).attr('class')!='f1 f1_active'){
                                    $(this).addClass("f1_disable");
                                }
                            });

                            var total_pay = (adultnum*13000)+(teennum*8000)+(seniornum*5000)+(disnum*5000);
                            totalnum.text(total_pay);

                        }
                    }else{
                        $(this).removeClass("f1_active");
                        selectCount--;
                    }
                }else if($(this).attr('class')=='f1 f1_active'){    // 좌석이 다 선택되있는 상태에서 취소를 할 때
                    $(this).removeClass("f1_active");
                        selectCount--;

                    $('.f1').each(function(i,obj) {
                        if($(this).attr('class')!='f1 f1_active'){
                            $(this).removeClass("f1_disable");
                        }
                    });
                    totalnum.text(0);
                }else if(countSeat==0){
                    alert('인원을 선택해주세요.');
                }
            });
            
            // 영화 상영 정보
            $('.s_date').text(date); 
            $('.s_day').text(days[day.getDay()]); 
            $('.s_time').text(time+" | "+"${mv.movie_running_time}"+"분");
        });
        
        $(".btn_mins").click(function(){
            if($(this).attr('id')=='adult_M'){
                if(adultnum>0){
                    adultdiv.text(--adultnum);
                    --countSeat;
                }
            }else if($(this).attr('id')=='teenager_M'){
                if(teennum>0){
                    teendiv.text(--teennum);
                    --countSeat;
                }
            }else if($(this).attr('id')=='senior_M'){
                if(seniornum>0){
                    seniordiv.text(--seniornum);
                    --countSeat;
                }
            }else if($(this).attr('id')=='disabled_M'){
                if(disnum>0){
                    disdiv.text(--disnum);
                    --countSeat;
                }
            }
            reset();
        });

        $(".btn_plus").click(function(){
        	if(countSeat>7){
        		alert("최대 8명 선택 가능합니다.");
        		reset();
        		return false;
        	}
        		
            if($(this).attr('id')=='adult_P'){
                    adultdiv.text(++adultnum);
            }else if($(this).attr('id')=='teenager_P'){
                    teendiv.text(++teennum);
            }else if($(this).attr('id')=='senior_P'){
                    seniordiv.text(++seniornum);
            }else if($(this).attr('id')=='disabled_P'){
                    disdiv.text(++disnum);
            }
            ++countSeat;
            
            
            reset();
        });

        function reset(){   // 초기화 (총 결제금액 , 좌석표의 CSS)
            selectCount = 0;
            $('.f1').each(function(i,obj) {
                 $(this).removeClass("f1_disable");
                 $(this).removeClass("f1_active");
                 totalnum.text(0);
            });
        }
		// 이미 예매 완료 된 좌석 표기
        function seatAjax(){
        	 $.ajax({
 	          	url: "seatNum.do",
 	          	data: {ms_no:ms_no},
 	          	type: "GET",
 	          	contentType : "application/json; charset:UTF-8",
 	          	async:false, // 비동기식 ajax를 동기식으로 설정하여 순차적 접근을 할 수 있게 한다.
 	          	success: function(data){
 	          		var sta = JSON.parse(data);	// JSON.parse는 Json타입을 자바스크립트 코드화 시킴.
 	          		for(var i=0; i<sta.length; i++){
 	          		 	$('.f1').each(function(index,object){
 	          		 		if($(this).text()==sta[i]){
 	          		 			$(this).removeClass("f1");
 	          		 			$(this).addClass("r_seat");
 	          		 		}
 	          		 	});
 	          		}
 	          	}
 	          });	
        }
		
     	// 결제하기 눌렀을 때
		function seatSubmit(){
			if(totalnum.text()=="0"){
				alert("좌석을 선택 해주세요.");
				return false;
			}else{
				var t = "";
	        	var age = "";
	        	
	        	// 좌석 값
	        	 $('.f1_active').each(function(i,obj) {
	        		  t += $(this).text()+",";
	             });
	        	// 맨 마지막 쉼표 자르기
	        	 t = t.slice(0,-1);
	        	
	        	// 연령별 인원 수 (*1을 하는 이유 : 0을 String으로 받아 number로 형 변환 시키기 위해)
	        	 age += (adultnum*1) +",";
	        	 age += (teennum*1) +",";
	        	 age += (seniornum*1) +",";
	        	 age += (disnum*1);
	        	 
	        	 $('#select_Seat').val(t);
	        	 $('#total_age').val(age);
	        	 $('#total_pay').val(totalnum.text());
	       		 
	        	 var pay = $('#total_pay').val();
	        	 pay = parseInt(pay);
	        	 
	        	 return true;
			} 
		}

    </script>
</body>

</html>