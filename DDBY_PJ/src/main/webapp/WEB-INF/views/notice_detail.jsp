<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
    <!-- Header Section Begin -->
    <%@ include file="common/header.jsp" %>
    <!-- Header End -->
<head>
    <meta charset="UTF-8">
    <title>Anime | Template</title>

    <!-- 썸머노트 script -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    
    <style>
        .notice_content{
            font-size: 15px;
            color: white;
            width: 980px;
            margin: 0 auto;
        }
        
        .notice_content p{
            font-size: 15px;
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

        .notice_backtolist_btn{
            float: right;
            padding:10px;
            margin-top: 20px;
        }
    </style>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>


    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                        <span>공지사항</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Anime Section Begin -->
    <section class="anime-details">
       <div style="text-align:center; width: 980px; margin: 0 auto">
            <div style="border-bottom: 3px solid white; color:white; font-size: 22px; float: left; width: 980px; margin-bottom: 20px;">
                <div style="float:left" id="notice_title">${n.notice_title}</div> 
                <input id="notice_title_input" type="text" style="float:left; background-color: #0b0c2a; width: 980px; margin-bottom: 10px;" placeholder="제목을 입력하세요" name="event_title" value="${n.notice_title}"/>
                <div style="font-size:12px; float: right; line-height: 3;">등록일: ${ n.notice_date }</div>
            </div>
       </div>
    </section>
    <section class="anime-details spad">
        <div class="notice_content">
             <div class="notice_content" id="notice_content">${ n.notice_content }</div> 
	            <div style="width: 980px; margin: 0 auto" id="notice_content_input">
	        		<textarea id="summernote_Mail" name="nContent"></textarea> 
	    		</div>
	    		<c:if test="${ loginUser.user_email eq 'admin@ddby.com' }">
		            <input type="button" value="수정" class="btn_mywish notice_backtolist_btn" id="notice_update"/>
		            <input type="button" value="수정하기" class="btn_mywish notice_backtolist_btn" id="notice_update_ajax"/>
		            <input type="button" value="삭제" class="btn_mywish notice_backtolist_btn" id="notice_delete"/>
            	</c:if>
            		<input type="button" value="목록으로" class="btn_mywish" style="float: left; margin-left: 0; margin-top: 20px; padding:10px;" onclick="location.href='noticeList.do'"/>
        </div>
    </section>
    <!-- Anime Section End -->

<!-- Footer Section Begin -->
<%@ include file="common/footer_summer.jsp" %>
<!-- Footer Section End -->
</body>

	<script>
    $(document).ready(function () {
        //썸머노트
       	 $('#summernote_Mail').summernote({
 			toolbar: [
 				// [groupName, [list of button]]
					['fontname', ['fontname']],
      			    ['fontsize', ['fontsize']],
      			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
      			    ['color', ['forecolor','color']],
      			    ['table', ['table']],
      			    ['para', ['ul', 'ol', 'paragraph']],
      			    ['height', ['height']],
      			    ['insert',['picture','link','video']],
      			    ['view', ['fullscreen', 'help']]
      			  ],
			height: 400,                 // 에디터 높이
			minHeight: null,             // 최소 높이
			maxHeight: null,             // 최대 높이
			focus: true,                 // 에디터 로딩후 포커스를 맞출지 여부
			lang: "ko-KR",				 // 한글 설정
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
      	  });
        $('#summernote_Mail').summernote('code', '${n.notice_content}');
        
        $('.notice_content p').css("color","white");
        
        $('.nAjax').hide();
        $('#notice_content_input').hide();
        $('#notice_title_input').hide();
        $('#notice_update_ajax').hide();
    });
   	 
	// 수정 버튼
	$('#notice_update').click(function(){
		$('.notice_content p').css("color","black");
		$('#notice_title').hide();
		$('#notice_content').hide();
		
		$('#notice_content_input').show();
        $('#notice_title_input').show();
        
		$('#notice_title').focus();
		$('#notice_update_ajax').show();
		$(this).hide();
	});
	
	// 수정 완료 버튼
	$('#notice_update_ajax').click(function(){
		
		var content = $('#summernote_Mail').val();
		var title = $('#notice_title_input').val();
		var no = "${ n.notice_no }";
		
		$.ajax({
	    	url: "noticeUpdate.do",
	    	data: {content:content,
	    			title:title,
	    			no:no
	    		  },
	    	type: "POST",
	    	success: function(data){
	    		if(data=="ok"){
	    			alert("수정이 완료되었습니다.");
	    			location.href="noticeDetail.do?notice_no="+no;
	    		}else{
	    			alert("수정에 실패하였습니다.");
	    		}
	    	}
		});
	});
	
	$('#notice_delete').click(function(){
		var no = "${ n.notice_no }";
		
		$.ajax({
	    	url: "noticeDelete.do",
	    	data: { no:no },
	    	type: "POST",
	    	success: function(data){
	    		if(data=="ok"){
	    			alert("삭제 되었습니다.");
	    			location.href="noticeList.do";
	    		}else{
	    			alert("삭제에 실패하였습니다.");
	    		}
	    	}
		});
	});

	</script>
</html>