<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
    <!-- Header Section Begin -->
    <%@ include file="common/header.jsp" %>
<head>

    <!-- Header End -->
    <meta charset="UTF-8">
    <title>Anime | Template</title>


    <!-- 썸머노트 script -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  
    <style>
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

        .event_input_btn{
            float: right;
            padding: 20px;
            margin-right: 460px;
            margin-top: -50px;
        }

        .event_section{
            padding-bottom: 60px;
        }
    </style>
</head>

<body>

<form method="post" action="nWrite.do">
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
                        <a href="index.do"><i class="fa fa-home"></i> Home</a>
                        <span>공지사항 작성</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Anime Section Begin -->
    <section class="anime-details spad event_section">
       <div style="text-align:center; width: 980px; margin: 0 auto">
            <div style=" color:white; font-size: 22px; float: left; width: 980px; ">
                <input type="text" style="float:left; background-color: #0b0c2a; width: 980px; " placeholder="제목을 입력하세요" name="nTitle"/>
            </div>
       </div>
    </section>

    <div style="width: 980px; margin: 0 auto">
        <textarea id="summernote_Mail" name="nContent"></textarea> 
    </div>
    
    <section class="anime-details spad">
        <input type="submit" value="글 작성" class="btn_mywish event_input_btn"/>
    </section>
    <!-- Anime Section End -->
</form>
<!-- Footer Section Begin -->
<%@ include file="common/footer_summer.jsp" %>
<!-- Footer Section End -->



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
               focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
               lang: "ko-KR",					// 한글 설정
       			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
       			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
       	  });
  });
        
    </script>
    
</body>

</html>