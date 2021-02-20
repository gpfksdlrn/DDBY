<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/showtime.css">
<head>
<meta charset="UTF-8">
<title>DDOBOYUNG</title>
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<%@ include file="common/header.jsp"%>
	<!-- Header End -->

	<!-- Breadcrumb Begin -->
	<div class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__links">
						<a href="index.do"><i class="fa fa-home"></i> Home</a> <span>상영시간표</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Product Section Begin -->
	<section class="product-page spad">
		<div class="wrap_scheduler">
			<div class="article article_movie">
				<div class="group_top">
					<h4 class="tit movie_name">영화 선택</h4>
				</div>
				<div class="inner">
					<div class="movie_select_wrap">
						<ul>
							<c:forEach var="m" items="${ mv }">
								<li><a href="javascript:;">
										<div class="tit_wrap">
											<c:if test="${ m.movie_age == 0}">
												<img src="resources/img/allage.png">
											</c:if>

											<c:if test="${ m.movie_age != 0}">
												<img src="resources/img/${ m.movie_age }age.png">
											</c:if>

											<span>${ m.movie_title }</span>
										</div>
								</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<form action="seat.do" method="post">
				<div class="article article_time">
					<div class="group_top">
						<h4 class="tit tit_day"></h4>
					</div>
					<div class="inner">
						<!-- 달력 -->
						<div class="date_select_wrap bdr dateReserveWrap">
							<div class="slide_wrap slide_reserve_date">
								<ul class="owl-carousel owl-loaded owl-drag">
									<div class="owl-stage-outer">
										<div class="owl-stage"
											style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s;">
										</div>
									</div>
								</ul>
							</div>
						</div>
						<!-- 상영시간표 -->
						<div class="scheduler_wrap">
							<div class="timeScroll">
								<div class="time_container">
									<div class="group_time_select">
										<div class="time_select_tit">
											<img src="resources/img/15age.png"> <strong>조제</strong>
										</div>
										<div class="time_select_wrap timeSelect">
											<ul class="list_time">
												<li class=""><a role="button" href="#none">
														<dl>
															<dt>상영시간</dt>
															<dd class="time">
																<strong>14:30</strong>
																<div class="tooltip">종료 16:37</div>
															</dd>
															<dt>잔여석</dt>
															<dd class="seat">
																<strong>90</strong> / 186
															</dd>
															<dt>상영관</dt>
															<dd class="hall">5관</dd>
														</dl>
												</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		</div>
		<script>
        // 달력 스크립트
        var date = new Date();
        var day = ["일", "월", "화", "수", "목", "금", "토"];
        var today;
        var daycss = "date";
		var sw_day = 0;		// day 선택 했는지 체크
		var sw_mov = 0;		// movie 선택 했는지 체크 +css
        var to_days = new Date(); 
        var text_day;
        $(document).ready(function() {
        	// 달력 시작
            var div = $('.owl-stage');
            var month = 0;
            
            for (var i = 0; i < 11; i++) {
                date.setDate(date.getDate() + i);
                today = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();

                if (month == 0) {
                    month = date.getMonth() + 1;
                }
                if (date.getDay() == 0) {
                    daycss = "date sun";
                } else if (date.getDay() == 6) {
                    daycss = "date sat";
                }

                if (i == 0) {
                    div.append("<div class='owl-item active' style='width: 57.929px;'><li class='item'><strong class='month'>" + (date.getMonth() + 1) + "월" + "</strong> <span class='" + daycss + "'> <label> <input type='radio' name='radioDate1' data-playdate='" + today + "' class='date_input' data-playweek='오늘' checked=''> <strong>" + date.getDate() + "</strong> <em>오늘</em> </label> </span> </li> </div>");
                } else if (month != date.getMonth() + 1) {
                    div.append("<div class='owl-item active' style='width: 57.929px;'><li class='item'><strong class='month'>" + (date.getMonth() + 1) + "월" + "</strong><span class='" + daycss + "'><label><input type='radio' name='radioDate1' class='date_input' data-playdate='" + today + "' data-playweek='" + day[date.getDay()] + "'><strong>" + date.getDate() + "</strong><em>" + day[date.getDay()] + "</em></label></span> </li> </div>");
                    month = date.getMonth() + 1;
                } else {
                    div.append("<div class='owl-item active' style='width: 57.929px;'><li class='item'><span class='" + daycss + "'><label><input type='radio' class='date_input' name='radioDate1'data-playdate='" + today + "' data-playweek='" + day[date.getDay()] + "'><strong>" + date.getDate() + "</strong><em>" + day[date.getDay()] + "</em></label></span></li></div>");
                }

                daycss = "date";
                date = new Date();
                
             	
            }
            
            
            // 달력 끝
            
            // 날짜픽 Ajax 오늘날짜 호출
            dayPick(date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate(),"none");

            var tit_day = $('.group_top').children('.tit_day');
            tit_day.text(date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate() + " " + "(" + day[date.getDay()] + ")");
            //console.log("tit_day : "+tit_day.text());
            //text_day = $('.tit_day').text().substring(0,9);
			// 달력 날짜 클릭했을 때
            $('.date_input').click(function() {    
            	sw_day = 1;
            	var Tday = $(this).attr("data-playdate"); // 클릭된 날짜를 가져옴
                tit_day.text(Tday + " " + "(" + $(this).attr("data-playweek") + ")");
            	
                // 영화 시간표 (날짜 선픽) Ajax
                if(sw_mov==1){ 	// 영화가 선픽된 상태에서 날짜를 클릭했을 때 영화이름과 날짜를 Ajax함수의 매개변수로 넣어준다.
                	var movieName = $('.movie_select_active').find('span').text();
                	dayPick(Tday,movieName);
                }else{			// 날짜가 선픽된 상태(영화 미선택)
                	dayPick(Tday,"none");
                }
                
            });
            
            // 영화 선택 스크립트
            $('.tit_wrap').click(function(){
            	
          		var day = $('.group_top').children('.tit_day').text();
          		
            	if($(this).attr("class") != "tit_wrap movie_select_active"){ 
            		$('.tit_wrap').removeClass('movie_select_active');
                    $(this).addClass('movie_select_active');
                    
                    // 선택했으니 sw on
            		sw_mov = 1;
                	
                	var movieName = $(this).find('span').text();
                	
                	// 영화 시간표 (날짜 선픽) Ajax
                	if(sw_day==0){ // 날짜 선택이 안되어있으면 기본 오늘 날짜
                		dayPick(date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate(),movieName);
                	}else{
                		dayPick(day.substring(0,9),movieName);
                	}
            	}else{	// 이미 선택된 영화를 클릭하면 선택해제
            		sw_mov = 0;
            		$('.tit_wrap').removeClass('movie_select_active');
            		
            		dayPick(day.substring(0,9),"none");
            	}
            });
            
        });
        
        </script>

		<script>
        function dayPick(Tday,movieName){
            var html = "";
            $('.timeScroll').empty();
            
        	// 영화 시간표 (날짜픽) Ajax
            $.ajax({
            	url: "dateScheduler.do",
            	data: {Tday:Tday},
            	type: "GET",
            	contentType : "application/json; charset:UTF-8",
            	async:false,	// 비동기식 ajax를 동기식으로 설정하여 순차적 접근을 할 수 있게 한다.
            	success: function(data){	// Tday로 검색한 결과의 영화타이틀
            		var mt = JSON.parse(data);	// JSON.parse는 Json타입을 자바스크립트 코드화 시킴.
            		// DIV에 제목을 삽입하는 과정
					for(var i=0; i<mt.length; i++){
						
						if(movieName=="none"){	// 매개변수로 none을 받았을 때 => 전체 시간표 출력
						 	 html += "<div class='time_container'> <div class='group_time_select'> <div class='time_select_tit'>";
                             
							 if(mt[i].ms_age == 0){
                            	 html+="<img src='resources/img/allage.png'>";
                             }else{
                            	 html+="<img src='resources/img/"+mt[i].ms_age+"age.png'>";
                             }
                             
							html += "<strong>"+mt[i].ms_title+"</strong> </div> <div class='time_select_wrap timeSelect'> <ul class='list_time "+i+"'> </ul> </div> </div> </div>"; 
                			
							$('.timeScroll').append(html);
							html="";
							schedul(mt[i].ms_title,Tday,i);
							// 매개변수로 i를 넣는 이유 : class를 다르게 주기 위함. 
							//					  같게 주면 다른 곳에 중복 append 되는 현상이 있기 때문
							
						}else{
							
							if(mt[i].ms_title==movieName){	// 해당 영화 시간표 출력
								html += "<div class='time_container'> <div class='group_time_select'> <div class='time_select_tit'>";
	                             
								 if(mt[i].ms_age == 0){
	                            	 html+="<img src='resources/img/allage.png'>";
	                             }else{
	                            	 html+="<img src='resources/img/"+mt[i].ms_age+"age.png'>";
	                             }
	                             
								html += "<strong>"+mt[i].ms_title+"</strong> </div> <div class='time_select_wrap timeSelect'> <ul class='list_time "+i+"'> </ul> </div> </div> </div>"; 
	                			
								$('.timeScroll').append(html);
								html="";
								schedul(mt[i].ms_title,Tday,i);
								
							}
						}
					}
            	}
            });
        }
        
		
		 
        function schedul(mTitle,mTday,num){
			var html = "";
			 $.ajax({
               	url: "titleScheduler.do",
               	data: {mTitle:mTitle,
               		   mTday:mTday},
               	type: "GET",
               	contentType : "application/json; charset:UTF-8",
               	async:false, // 비동기식 ajax를 동기식으로 설정하여 순차적 접근을 할 수 있게 한다.
               	success: function(data){
               		var tday = new Date();
               		var mtd = JSON.parse(data);	// JSON.parse는 Json타입을 자바스크립트 코드화 시킴.
               		
               		for(var i=0; i<mtd.length; i++){
						var dd = tday.getFullYear() + "-" + (tday.getMonth() + 1) + "-" + tday.getDate();
               			var ymd = $('.group_top').children('.tit_day').text().substring(0,9);
               			
               			// 맨처음에만 오늘 날짜의 ymd는 가져오지 못해 ""으로 인식된다.
               			// 수동으로 지정을 해준다.
               			if(ymd==""){
               				dd = dd+" "+mtd[i].ms_showtime;
               				var date = new Date(dd);
               			}else{
               				ymd = ymd+" "+mtd[i].ms_showtime;
               				var date = new Date(ymd); 
               			}
               			
               			// 현재 날짜와 시간
                   		to_days = new Date();
                   		
                    	if(mtd[i].ms_seat == 0){
                    		html += "<li class='scBtn'><a role='button' href='#' onclick='subBtn(this);'><dl><dt>상영시간</dt> <dd class='time'><strong>"+mtd[i].ms_showtime+"</strong><input type='hidden' value='"+mtd[i].ms_no+"' class='ms_no'/></dd><dt>잔여석</dt><dd class='seat'><strong>"+mtd[i].ms_seat+"</strong> / 100 <span class='soldout'>[매진]<span></dd><dt>상영관</dt><dd class='hall'>"+mtd[i].ms_theater+"관</dd></dl></a></li>"; 
                    		
                   			$('.'+num).append(html);
                   			$('.scBtn').addClass('scBtn_disable'); 
                       		$('.soldout').css("color","red");
                    	}else{
            		 		html += "<li class='scBtn"+" "+"m"+mtd[i].ms_no+"'><a role='button' href='#' onclick='subBtn(this);'><dl><dt>상영시간</dt> <dd class='time'><strong>"+mtd[i].ms_showtime+"</strong><input type='hidden' value='"+mtd[i].ms_no+"' class='ms_no'/></dd><dt>잔여석</dt><dd class='seat'><strong>"+mtd[i].ms_seat+"</strong> / 100</dd><dt>상영관</dt><dd class='hall'>"+mtd[i].ms_theater+"관</dd></dl></a></li>"; 
            		 		$('.'+num).append(html); 
                    	}
                    	
                    	// 앞의 ymd와 to_days를 비교
	            		if(date<to_days){
	            			$('.m'+mtd[i].ms_no).addClass('scBtn_disable');
	            		}
                   		html="";
               		}
                  }
               });
		}
		
	function subBtn(e){
		var logUser = '${loginUser.user_email}';
		
		if(logUser==""){
			alert("로그인이 필요한 서비스 입니다.");
			location.href="loginPage.do";
		}else{
			var m_num = $(e).find('input').val();

			$('#ms_no').val(m_num);
			
			$('#sub_btn').trigger('click');
		}
	} 
		
        </script>
	</section>
	<!-- Product Section End -->


	<!-- Footer Section Begin -->
	<%@ include file="common/footer.jsp"%>
	<!-- Footer Section End -->
</body>

</html>