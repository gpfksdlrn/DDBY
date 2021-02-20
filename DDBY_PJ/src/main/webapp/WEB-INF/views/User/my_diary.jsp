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
            <div class="header">무비다이어리</div>
            <div class="info">
                <!-- 무비다이어리 -->
                <div class="col-detail">
                    <div class="movielog-detail-wrap">
                        <div class="tit-mycgv">
                            <p>또보영과 함께한 추억들 <span>${dCount}건</span></p>
                        </div>
                        <form method="post" action="my_diaryInsert.do" autocomplete="off">
                            <div class="diary-register-wrap">
                                <div class="sect-diary-register">
                                    <div class="article-who-together article-what-movie">
                                        <i class="fas fa-video" style="margin: 10px; vertical-align: middle;"></i>
                                        <span style="color: #878681">어떤 영화를 보셨나요?</span>
                                        <i class="fas fa-chevron-down m_select_btn"></i>
                                    </div>
                                    <!-- Movie Select Box-->
                                    <div class="article-movie-select-box" style="display: none;">
                                    <c:if test="${fn:length(blist)>0}">
                                    <c:forEach var="i" begin="0" end="${ fn:length(blist)-1 }">
	                                    <div class="article-any-movie">
	                                       <div class="movie-select">
	                                            <div class="box-image"> 
	                                                <span class="thumb-image">
	                                                    <img src="resources/img/poster/${ movie[i].movie_poster }"> 
	                                                </span> 
	                                            </div>
	                                            <div class="box-contents-diary">
	                                                <div class="title"> <strong>${ movie[i].movie_title }</strong>
	                                                    <p>${ movie[i].movie_title_eng }</p>
	                                                </div>
	                                                <p class="date"><strong>${ blist[i].showtime }</strong></p>
	                                                <p class="theater">또보영 ${ blist[i].theater }관 / ${ blist[i].buy_person }명</p>
	                                            </div>
	  										</div>
	  										
	  										<input type="hidden" value="${ movie[i].movie_poster }" id="m_poster">
	  										<input type="hidden" value="${ movie[i].movie_title }" id="m_title">
	  										<input type="hidden" value="${ movie[i].movie_title_eng }" id="m_title_eng">
	  										<input type="hidden" value="${ blist[i].showtime }" id="b_showtime">
	  										<input type="hidden" value="${ blist[i].theater }" id="b_theater">
	  										<input type="hidden" value="${ blist[i].buy_person }" id="b_person">
	  										<input type="hidden" value="${ blist[i].buy_no }" id="b_buy_no">

	  										
	  										<input type="button" value="선택" class="btn_mywish" onclick="btn_movieSel();" style="float:right; position: absolute; top: 65px; left: 647px;"/>
	                                    </div>
	                                </c:forEach>
	                              	</c:if>
                                    </div>
                                    <!-- selectOne Movie -->
                                    <div class="article-any-movie diary_movie_info">
                                      
                                    </div>
                                    <div class="article-who-together">
                                        <i class="fas fa-user-friends" style="margin: 10px; vertical-align: middle;"></i>
                                        <input type="text" id="txtMovieWith" name="txtMovieWith"
                                            placeholder="누구와 함께 보셨나요?" maxlength="60" style="background-color: #0B0C29;">
                                    </div>
                                    <div class="article-how-see">
                                        <div class="comment_diary"><i class="far fa-comment" style="margin: 10px;font-size: 20px;"></i></div>
                                        <textarea id="textContent" name="textContent" required="required" minlength="2"
                                            cols="55" rows="5" placeholder="영화 어떻게 보셨나요?"></textarea>
                                    </div>
                                    <div class="article-info-select">
                                        <div class="set-btn">
                                            <button type="button" class="round gray on" id="btn_write_cancel"><span>취소</span></button>
                                            <button type="button" class="round on red" value="0" id="submit"><span>등록</span></button>
                                            <button type="submit" Style="display: none;" id="submit_btn"></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                          <input type="hidden" value="" id="buy_no" name="buy_no">
                        </form>
                        <div class="movie-diary-wrap">
                            <div class="sect-movie-diary">
                                <ul id="moviediary_list_container">
                                	<c:if test="${fn:length(dlist)>0}">
                                     <c:forEach var="i" begin="0" end="${ fn:length(dlist)-1 }">
                                    <li data-mdidx="1462393" class="movie_info_81075">
                                        <div class="sect-movie-info">
                                            <p class="wrt-date">
                                                <strong>${ dblist[i].showtime }</strong> 
                                                <i></i>
                                            </p>
                                            <div class="article-movie-info" id="tests">
                                                <div class="box-image">
                                                    <span class="thumb-image-detail">
                                                       <img src="resources/img/poster/${ dm[i].movie_poster }">
                                                            <c:if test="${ dm[i].movie_age != 0 }">
                                                            	<img class="grade-age" src="resources/img/${ dm[i].movie_age }age.png">
                                                            </c:if>
                                                        	<c:if test="${ dm[i].movie_age == 0 }">
                                                            	<img class="grade-age" src="resources/img/allage.png" alt="전체 이용가">
                                                            </c:if>
                                                    </span>
                                                </div>
                                                <div class="box-contents">
                                                    <div class="title-detail">
                                                       <a href="#" style="color:white; text-decoration: none;"><strong>${ dm[i].movie_title }</strong></a>
                                                        <p>${ dm[i].movie_title_eng }</p>
                                                    </div>
                                                    <p class="theater">또보영 ${ dblist[i].theater }관<c:if test="${ dlist[i].dia_couple ne null }"><span class="peer"><i class="fas fa-user-friends"></i>${ dlist[i].dia_couple }</span></c:if></p>
                                                </div>
                                                <input type="hidden" value="${ dblist[i].buy_no }">
                                                <button class="btn btn-del" type="button" data-mdidx="1462393">
                                                    <i class="far fa-times-circle"></i>
                                                </button>
                                            </div>
                                            <div class="article-wrt-details">
                                                <i class="far fa-comment"></i><p>${ dlist[i].dia_content }</p>
                                            </div>
                                            <div class="set-combo">
                                                <span>
                                                    ${ dlist[i].dia_date } 작성
                                                </span>
                                                
                                                <button class="btn diary_edit" type="button">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                                
		                                        <input type="hidden" value="${ dm[i].movie_poster }" id="m_poster_u">
			  									<input type="hidden" value="${ dm[i].movie_title }" id="m_title_u">
			  									<input type="hidden" value="${ dm[i].movie_title_eng }" id="m_title_eng_u">
			  									<input type="hidden" value="${ dblist[i].showtime }" id="b_showtime_u">
			  									<input type="hidden" value="${ dblist[i].theater }" id="b_theater_u">
			  									<input type="hidden" value="${ dblist[i].buy_person }" id="b_person_u">
			  									<input type="hidden" value="${ dblist[i].buy_no }" id="b_buy_no_u">
			  									<input type="hidden" value="${ dlist[i].dia_content }" id="dia_content_u">
			  									<input type="hidden" value="${ dlist[i].dia_couple }" id="dia_couple_u">
                                            </div>
                                        </div>
                                    </li>
                                    </c:forEach>
                                  </c:if>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer Section Begin -->
	<%@ include file="../common/footer.jsp" %>
	<!-- Footer Section End -->
    <script>
 		var toggle_sw = 0;
 		var bnum = "${bnum}";
 		
 		$(document).ready(function(){
 			$('.diary_movie_info').hide();
 			
 			$('.m_select_btn').click(function(){
 	 			$('.article-movie-select-box').toggle();
 	 		});
 				
 			if(bnum!=""){
 			 	$('.article-any-movie').each(function(index,object){
 			 		var b_buy_no = $(this).find('#b_buy_no').val();
 	 				if(bnum==b_buy_no){
 	 					var m_poster = $(this).find('#m_poster').val();
 	 		 			var m_title = $(this).find('#m_title').val();
 	 		 			var m_title_eng = $(this).find('#m_title_eng').val();
 	 		 			var b_showtime = $(this).find('#b_showtime').val();
 	 		 			var b_theater = $(this).find('#b_theater').val();
 	 		 			var b_person = $(this).find('#b_person').val();
 	 		 			
 	 		        	$('.article-what-movie').hide();
 	 		        	$('.article-movie-select-box').hide();
 	 		        	
 	 		        	$('.diary_movie_info').empty();
 	 		        	
 	 		        	$('.diary_movie_info').append("<div class='movie-select'><div class='box-image'><span class='thumb-image'><img src='resources/img/poster/"+m_poster+"'></span></div><div class='box-contents-diary'><div class='title'> <strong>"+m_title+"</strong><p>"+m_title_eng+"</p></div><p class='date'><strong>"+b_showtime+"</strong></p><p class='theater'>또보영 "+b_theater+"관 / "+b_person+"명</p></div>");
 	 		        	
 	 		        	$('.diary_movie_info').show();
 	 		        	
 	 		        	$('#buy_no').val(b_buy_no);
 	 		        	        	
 	 		        	$('#submit').find('span').text('등록');
 	 		        	$('#submit').val("1");
 	 				}
 	 			}); 
 			}
 			
 		});
 		
 		// select-box의 영화 선택 버튼
 		$('.btn_mywish').click(function(){
 			var m_poster = $(this).parent().children('#m_poster').val();
 			var m_title = $(this).parent().children('#m_title').val();
 			var m_title_eng = $(this).parent().children('#m_title_eng').val();
 			var b_showtime = $(this).parent().children('#b_showtime').val();
 			var b_theater = $(this).parent().children('#b_theater').val();
 			var b_person = $(this).parent().children('#b_person').val();
 			var b_buy_no = $(this).parent().children('#b_buy_no').val();
        	$('.article-what-movie').hide();
        	$('.article-movie-select-box').toggle();
        	
        	$('.diary_movie_info').empty();
        	
        	$('.diary_movie_info').append("<div class='movie-select'><div class='box-image'><span class='thumb-image'><img src='resources/img/poster/"+m_poster+"'></span></div><div class='box-contents-diary'><div class='title'> <strong>"+m_title+"</strong><p>"+m_title_eng+"</p></div><p class='date'><strong>"+b_showtime+"</strong></p><p class='theater'>또보영 "+b_theater+"관 / "+b_person+"명</p></div>");
        	
        	$('.diary_movie_info').show();
        	
        	$('#buy_no').val(b_buy_no);
        	        	
        	$('#submit').find('span').text('등록');
        	$('#submit').val("1");
        	
        	console.log($('#buy_no').val());
        
        });
        
 		// 게시글 수정 버튼
 		$('.diary_edit').click(function(){
 			
 			var m_poster = $(this).parent().children('#m_poster_u').val();
 			var m_title = $(this).parent().children('#m_title_u').val();
 			var m_title_eng = $(this).parent().children('#m_title_eng_u').val();
 			var b_showtime = $(this).parent().children('#b_showtime_u').val();
 			var b_theater = $(this).parent().children('#b_theater_u').val();
 			var b_person = $(this).parent().children('#b_person_u').val();
 			var b_buy_no = $(this).parent().children('#b_buy_no_u').val();
 			var dia_couple = $(this).parent().children('#dia_couple_u').val();
 			var dia_content = $(this).parent().children('#dia_content_u').val();
        	$('.article-what-movie').hide();
        	$('.article-movie-select-box').hide();
        	
        	$('.diary_movie_info').empty();
        	
        	$('.diary_movie_info').append("<div class='movie-select'><div class='box-image'><span class='thumb-image'><img src='resources/img/poster/"+m_poster+"'></span></div><div class='box-contents-diary'><div class='title'> <strong>"+m_title+"</strong><p>"+m_title_eng+"</p></div><p class='date'><strong>"+b_showtime+"</strong></p><p class='theater'>또보영 "+b_theater+"관 / "+b_person+"명</p></div>");
        	
        	$('#txtMovieWith').val(dia_couple);
        	
        	$('#textContent').val(dia_content);
        	
        	$('.diary_movie_info').show();
        	
        	$('#buy_no').val(b_buy_no);
        	
        	$('#txtMovieWith').focus();
        	$('#submit').find('span').text('수정');
        	$('#submit').val("2");
 		});
 		
        // 작성 취소
        $('#btn_write_cancel').click(function(){
        	$('.diary_movie_info').empty();
        	$('.diary_movie_info').hide();
        	$('.article-what-movie').show();
        	// 값 초기화
        	$('#m_poster').val('');
        	$('#m_title').val('');
        	$('#m_title_eng').val('');
        	$('#b_showtime').val('');
        	$('#b_theater').val('');
        	$('#b_person').val('');
        	$('#b_buy_no').val('');
        	$('#buy_no').val('');
        	$('#txtMovieWith').val('');
        	$('#textContent').val('');
        	
        	$('#submit').find('span').text('등록');
        });
        
        // 다이어리 게시물 삭제
        $('.btn-del').click(function(){
        	var b_no = $(this).parent().find('input').val();
			$.ajax({
				url:"diaryDel.do",
				data:{b_no:b_no},
				type:"post",
				success:function(data){
					if(data=="ok"){
						alert('게시글 삭제가 완료되었습니다.');
						location.reload();
					}else{
						alert('게시글 삭제 중 오류 발생');
					}
				}
			});
        });
        
       $('#submit').click(function(){
    	   if($(this).val()=="0"){
    		   alert("영화를 선택해주세요.");
    	   }else if($(this).val()=="1"){
    	   	   $("form").attr("action", "my_diaryInsert.do");
    	   	   $("#submit_btn").trigger("click");
    	   }else if($(this).val()=="2"){
    		   $("form").attr("action", "my_diaryUpdate.do");
    		   $("#submit_btn").trigger("click");
    		   
    	   }
       });
        
    </script>
</body>

</html>