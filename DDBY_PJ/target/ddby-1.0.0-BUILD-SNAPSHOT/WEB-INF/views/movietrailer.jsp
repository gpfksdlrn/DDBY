<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>영화 트레일러</title>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

<%@ include file="common/header.jsp" %>
    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="index.do"><i class="fa fa-home"></i> Home</a>
                        <span>무비 트레일러</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Product Section Begin -->
    <section class="product-page spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="product__page__content">
                        <div class="product__page__title">
                            <div class="row">
                                <div class="col-lg-8 col-md-8 col-sm-8">
                                    <div class="section-title">
                                        <h4>무비 트레일러</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row_movietrailer">
                        	<c:forEach var="t" items="${trailer}">
                            <div class="col-lg-4-categories col-md-6 col-sm-6 youtube" data-toggle="modal" data-target="#myModal" onclick="test();">
                            <input type="hidden" value="${t.movie_youtube}" class="youtube_link">
                                <div class="product__item">
                                    <div class="movie_playbutton"><img width="45px" height="45px" src="resources/img/playbutton.png"></div>
                                    <div class="product__trailer__pic set-bg" data-setbg="http://img.youtube.com/vi/${ t.movie_youtube }/hqdefault.jpg">
                                    </div>
                                    <div class="product__item__text">
                                        <h5><a href="#">${ t.movie_title }</a></h5>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="product__pagination">
                    <!-- [이전] -->
					<c:if test="${ pi.currentPage eq 1 }">
					</c:if>
					<c:if test="${ pi.currentPage ne 1 }">
						<c:url var="before" value="movietrailer.do">
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
							<c:url var="pagination" value="movietrailer.do">
								<c:param name="currentPage" value="${ p }"/>
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
					</c:forEach>
					
					<!-- [다음] -->
					<c:if test="${ pi.currentPage eq pi.maxPage }">
					</c:if>
					<c:if test="${ pi.currentPage ne pi.maxPage }">
						<c:url var="after" value="movietrailer.do">
							<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
						</c:url> 
						<a href="${ after }">&nbsp;<i style="color:white; font-size: 15px;" class="fa fa-angle-double-right"></i></a>
					</c:if>
					</div>
                </div>
            </div>
        </div>
        <!-- 모달 영역 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="position:absolute; top:17%; left: -17%; overflow:hidden;">
		    <div class="modal-dialog" role="document">
			    <div class="modal-content" style="width:900px;">
				    <div class="modal-header">
				    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
				    </div>
				    <div class="modal-body">
				        <!-- 유튜브 영상 -->  
				    </div>
				    <div class="modal-footer">
				    </div>
			    </div>
		    </div>
		</div>
	</section>
<!-- Product Section End -->

<%@ include file="common/footer.jsp" %>
<script>
	$('.youtube').click(function(){
		$('.modal-body').empty();
		$('.modal-body').append("<iframe class='video' width='850' height='500' src='https://www.youtube.com/embed/"+$(this).children('.youtube_link').val()+"'"+"style='margin-left: 10px;'></iframe>'");
	});
	
	  /* click 'CLOSE' button */
	  $('.close').click( function() {
	    // empty youtube iframe on popup
	    $('.video').remove(); 
	  }); 

	
</script>
</body>

</html>